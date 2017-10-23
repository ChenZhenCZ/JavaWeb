package ServletList;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import base.BaseDAOimp;
import base.IBaseDAO;
import basexxp.Basexxp;
import basexxp.IBasexxp;
import basexxp.MOBpay;
import basexxp.Mpay;
import bean.CityVo;
import bean.CourseVo;
import bean.MycourseVo;
import bean.PageVo;
import bean.PayRecordVo;
import bean.ProVo;

public class PayRecordServlet extends HttpServlet {
	IBaseDAO baseDao=new BaseDAOimp();
	IBasexxp basexxp=new Basexxp();
	Mpay base=new MOBpay();
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request,response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action=request.getParameter("action");
		if(action.equals("list")){
		//查询所有的数据
		listPage(request, response);
		//转到jsp页面
		request.getRequestDispatcher("/T13/payRecordAdd.jsp").forward(request, response);
		}else if(action.equals("look")){
			//查询买课记录
			String userid=request.getParameter("userid");
			List<PayRecordVo> payRecord=basexxp.findpayRecord(userid);
			request.setAttribute("payRecord",payRecord);
			
			request.getRequestDispatcher("/T013/payRecordLook.jsp").forward(request, response);
		}else if(action.equals("add")){
			String courseId=request.getParameter("courseId");
			CourseVo course=basexxp.CourseById(courseId);
			request.setAttribute("course", course);
			request.getRequestDispatcher("/T013/payRecordAdd.jsp").forward(request, response);
		}else if(action.equals("addSave")){
			PayRecordVo payRecord=new PayRecordVo();
			float money=Float.parseFloat(request.getParameter("remainMoney"));
			float payMoney=Float.parseFloat(request.getParameter("payMoney"));
			float dismoney=Float.parseFloat(request.getParameter("discountMoney"));
			int userid=Integer.parseInt(request.getParameter("userid"));
			money=money-payMoney;
			String sql="update users set remainMoney='"+money+"' where userid="+userid;
			System.out.println(sql);
			baseDao.chz(sql);
			payRecord.setUserid(userid);
			payRecord.setCourseid(Integer.parseInt(request.getParameter("courseid")));
			payRecord.setPayOrReturn(0);
			payRecord.setPayMoney(payMoney);
			payRecord.setDiscountMoney(dismoney);
			payRecord.setPayer(request.getParameter("payer"));
			payRecord.setPayStatus(1);
			payRecord.setIsCash(0);
			basexxp.payRecord(payRecord);
			request.getRequestDispatcher("/payRecordServlet?action=pay&id="+userid).forward(request, response);
		}else if(action.equals("update")){
			//退款与提现
			PayRecordVo payRecord=new PayRecordVo();
			payRecord.setUserid(Integer.parseInt(request.getParameter("userid")));
			payRecord.setCourseid(Integer.parseInt(request.getParameter("courseid")));
			payRecord.setPayOrReturn(0);
			payRecord.setPayMoney(Float.parseFloat(request.getParameter("payMoney")));
			//payRecord.setDiscountMoney(Float.parseFloat(request.getParameter("discountMoney")));
			payRecord.setDiscountMoney(0);
			payRecord.setPayType(Integer.parseInt(request.getParameter("payType")));
			payRecord.setCardNum(request.getParameter("cardNum"));
			payRecord.setPayer(request.getParameter("payer"));
			payRecord.setOrderNumber(request.getParameter("orderNumber"));
			payRecord.setPayStatus(1);
			payRecord.setIsCash(0);
			basexxp.payRecord(payRecord);
		}else if(action.equals("pay")){
			String Id=request.getParameter("id");
			List<MycourseVo> paylist=base.paylist(Id);
			request.setAttribute("paylist",paylist);
			request.getRequestDispatcher("/T13/Paylist.jsp").forward(request,response);
			
		}
	}
	public void list(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		List<CityVo> cityList=baseDao.CityList();
		request.setAttribute("cityList", cityList);
		System.out.println(cityList);
	}
	public void listPage(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		//获取页面参数
		String pageDaen=request.getParameter("pageDaen");//当前页
		String por=request.getParameter("por");
		//获取记录总数
		int cnd=baseDao.getCount("select count(*) cnt from payRecord");
		PageVo page=new PageVo();
		//第一个参数
		page.setTextCount(cnd);
		//第二个参数
		if(pageDaen==null || pageDaen.equals("")){//当前页
		page.setPageDaen(1);
		}else{
			page.setPageDaen(Integer.parseInt(pageDaen));
		}
		//第三个参数
		if(por==null || por.equals("")){
			page.setPor("first");
		}else{
			page.setPor(por);
		}
		int pageD=page.getPageDaen();//获取当前页
		int pageInt=page.getPageInt();
		int pageSize=page.getPageSize();
		//获取所有城市
		List<PayRecordVo> payRecord=basexxp.payRecordList(pageInt, pageSize);
		//定义request变量，保存的是所以的城市数据
		request.setAttribute("payRecord",payRecord);
		request.setAttribute("page",page);
	}
}