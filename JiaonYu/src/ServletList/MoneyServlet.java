package ServletList;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import base.AesUtils;
import base.BaseDAOimp;
import base.IBaseDAO;
import basexxp.Basexxp;
import basexxp.IBasexxp;
import bean.CashRecordVo;
import bean.PayRecordVo;
import bean.TeacherGrade;
import bean.UersVo;
import bean.UserCourseEvalVo;

public class MoneyServlet extends HttpServlet {
	IBasexxp basexxp=new Basexxp();
	IBaseDAO base=new BaseDAOimp();
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request,response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action=request.getParameter("action");
		if(action.equals("look")){
			String teacherid=request.getParameter("teacherid");	
			UersVo teacher=base.uersup(Integer.parseInt(teacherid));
			List<CashRecordVo> list=base.Cashlist("select * from CashRecord where teacher_id="+teacherid);
			request.setAttribute("teacher", teacher);
			request.setAttribute("list", list);
			//查询收入
String sq="select pay_money from payRecord where isCash=0 and pay_or_return=0 and courseid in (select courseid from course where teacher_id="+teacherid+")";			
			float money=basexxp.getM(sq);
String sql="select grade_Percent from teacherGrade where grade_id in (select gradeId from teacher where teacherid="+teacherid+")";
			TeacherGrade teachergrade= basexxp.moneyGrade(sql);
			float grade= teachergrade.getGradePercent();
			money=grade*money;
			request.setAttribute("money",money);
			request.getRequestDispatcher("/money/money.jsp").forward(request, response);
		}else if(action.equals("add")){
			//新增提现记录
			String teacherid=request.getParameter("teacherid");
			String s1="select pay_money from payRecord where isCash=0 and pay_or_return=0 and courseid in (select courseid from course where teacher_id="+teacherid+")";			
			float money=basexxp.getM(s1);//总收入
			//分成比例
			String s2="select grade_Percent from teacherGrade where grade_id in (select gradeId from teacher where teacherid="+teacherid+")";
			TeacherGrade teachergrade= basexxp.moneyGrade(s2);
			float grade= teachergrade.getGradePercent();
			float money2=grade*money;//老师的收入
			float money3=(1-grade)*money;//平台收入
			request.setAttribute("money",money);
			//将买课记录表中的状态改为1
			String s4="update payRecord set isCash=1 where pay_or_return=0 and courseid in (select courseid from course where teacher_id="+teacherid+")";			
			base.chz(s4);
			CashRecordVo cash=new CashRecordVo();
			cash.setTeacherId(Integer.parseInt(teacherid));
			cash.setPayMoney(money2);
			cash.setIncomMoney(money3);
			basexxp.Cashadd(cash);			
			request.getRequestDispatcher("/web/webCenter.jsp").forward(request, response);
		}
	}
}
