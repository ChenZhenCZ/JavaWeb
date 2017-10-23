package ServletList;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import base.BaseDAOimp;
import base.IBaseDAO;
import bean.CouponCode;
import bean.CouponRecord;
import bean.PageObject;
import bean.PageVo;
import bean.TeacherVo;
import bean.UersVo;

public class CouponRecordServlet extends HttpServlet {

	IBaseDAO base = new BaseDAOimp();
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		HttpSession session = request.getSession();
		UersVo user =(UersVo)session.getAttribute("user");
		if(action.equals("add")){
			String activityName = request.getParameter("activityName").trim();
			String activityDesc = request.getParameter("activityDesc").trim();
			CouponRecord coupon = new CouponRecord();
			coupon.setActivityDesc(activityDesc);
			coupon.setActivityName(activityName);
			coupon.setUserid(user.getUserid());
			base.couponRecordAdd(coupon);
			listPage(request,response,user.getUserid());
			request.getRequestDispatcher("/web/couponRecordList.jsp").forward(request, response);
		}else if(action.equals("list")){
			listPage(request,response,user.getUserid());
			request.getRequestDispatcher("/web/couponRecordList.jsp").forward(request, response);
		}else if(action.equals("list1")){//�Żݻ
			listPage1(request,response,user.getUserid());
			request.getRequestDispatcher("/web/couponlist.jsp").forward(request, response);
		}else if(action.equals("produce")){
			int couponRecordId = Integer.parseInt(request.getParameter("couponRecordId"));
			if(request.getParameter("couponMoney")!=null){
				int couponMoney = Integer.parseInt(request.getParameter("couponMoney").trim());
				int validDay = Integer.parseInt(request.getParameter("validDay").trim());
				int couponCnt = Integer.parseInt(request.getParameter("couponCnt").trim());
				base.couponCodeAdd(couponRecordId, couponMoney, validDay, couponCnt);
			}
			List<CouponCode> couponCodeList = base.couponCodeList(couponRecordId);
			request.setAttribute("couponRecordId",couponRecordId);
			request.setAttribute("couponCodeList",couponCodeList);
			
			request.getRequestDispatcher("/web/couponCodeAdd.jsp").forward(request, response);
		}
	}
	
	public void listPage(HttpServletRequest request, HttpServletResponse response,int teacherId)
	throws ServletException, IOException {
		//��ȡҳ�����
		String pageDaen=request.getParameter("pageDaen");//��ǰҳ
		String por=request.getParameter("por");
		//��ȡ��¼����
		int cnd= base.getCount("select count(*) cnt from CouponRecord");
		PageVo page=new PageVo();
		//��һ������
		page.setTextCount(cnd);
		//�ڶ�������
		if(pageDaen==null || pageDaen.equals("")){//��ǰҳ
		page.setPageDaen(1);
		}else{
			page.setPageDaen(Integer.parseInt(pageDaen));
		}
		//����������
		if(por==null || por.equals("")){
			page.setPor("first");
		}else{
			page.setPor(por);
		}
		int pageD=page.getPageDaen();//��ȡ��ǰҳ
		int pageInt=page.getPageInt();
		int pageSize=page.getPageSize();
		
		List<CouponRecord> couponList = base.couponRecordList(teacherId,pageSize,pageInt);
		
		request.setAttribute("couponList", couponList);
		request.setAttribute("pager", page);
		
	}
	public void listPage1(HttpServletRequest request, HttpServletResponse response,int teacherId)
	throws ServletException, IOException {
		//��ȡҳ�����
		String pageDaen=request.getParameter("pageDaen");//��ǰҳ
		String por=request.getParameter("por");
		//��ȡ��¼����
		int cnd= base.getCount("select count(*) cnt from CouponRecord");
		PageVo page=new PageVo();
		//��һ������
		page.setTextCount(cnd);
		//�ڶ�������
		if(pageDaen==null || pageDaen.equals("")){//��ǰҳ
		page.setPageDaen(1);
		}else{
			page.setPageDaen(Integer.parseInt(pageDaen));
		}
		//����������
		if(por==null || por.equals("")){
			page.setPor("first");
		}else{
			page.setPor(por);
		}
		int pageD=page.getPageDaen();//��ȡ��ǰҳ
		int pageInt=page.getPageInt();
		int pageSize=page.getPageSize();
		
		List<CouponRecord> couponList = base.couponRecordList(pageSize,pageInt);
		
		request.setAttribute("couponList", couponList);
		request.setAttribute("pager", page);
		
	}
}
