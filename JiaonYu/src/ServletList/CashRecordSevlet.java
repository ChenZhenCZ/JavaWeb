package ServletList;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import base.BaseDAOimp;
import base.IBaseDAO;
import bean.CashRecordVo;
import bean.CouponRecord;
import bean.PageVo;
import bean.TeacherVo;
import bean.UersVo;

public class CashRecordSevlet extends HttpServlet {
		IBaseDAO base=new BaseDAOimp();
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			doPost(request, response);
	
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		if(action.equals("list")){
			String sql="select * from CashRecord where status=0";
			List<CashRecordVo> cashlist=base.Cashlist(sql);
			request.setAttribute("cashlist", cashlist);
			request.getRequestDispatcher("/T14/cashlist.jsp").forward(request,response);
			
		}else if(action.equals("update")){
			String payRecordId=request.getParameter("payRecordId");
			String reason=request.getParameter("reason");
			int status=Integer.parseInt(request.getParameter("status"));
			String teacherId=request.getParameter("teacherId");
			Float payMoney=Float.valueOf(request.getParameter("payMoney"));
			base.chz("update CashRecord set status='"+status+"',reason='"+reason+"' where pay_Record_Id="+payRecordId);
			if(status==1){
			UersVo uers=base.uersup(Integer.parseInt(teacherId));
			Float remainMoney=uers.getRemainMoney();
			remainMoney=remainMoney-payMoney;
			base.chz("update users set remainMoney='"+remainMoney+"' where userid="+teacherId);
			}
			String sql="select * from CashRecord where status=0";
			List<CashRecordVo> cashlist=base.Cashlist(sql);
			request.setAttribute("cashlist", cashlist);
			request.getRequestDispatcher("/T14/cashlist.jsp").forward(request,response);
		}else if(action.equals("cash")){
			String teacherId=request.getParameter("teacherId");	
			UersVo teacher=base.uersup(Integer.parseInt(teacherId));
			List<CashRecordVo> list=base.Cashlist("select * from CashRecord where teacher_id="+teacherId);
			request.setAttribute("teacher", teacher);
			request.setAttribute("list", list);
			request.getRequestDispatcher("/T14/dewo.jsp").forward(request,response);
		}
		
	}
}
