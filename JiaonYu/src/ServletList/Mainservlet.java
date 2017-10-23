package ServletList;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import base.BaseDAOimp;
import bean.CourseVo;
import bean.PageVo;
import bean.TeacherVo;

public class Mainservlet extends HttpServlet {
	
	BaseDAOimp sql = new BaseDAOimp();
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String action = request.getParameter("action"); 
		if(action.equals("main")){
			listPage(request, response);
			listPage1(request, response);
			request.getRequestDispatcher("/web/index.jsp").forward(request, response);
		}else if(action.equals("list")){
			listPage1(request, response);
			request.getRequestDispatcher("/web/laoshi.jsp").forward(request, response);
		}
	}
	public void listPage(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		//��ȡҳ�����
		String pageDaen=request.getParameter("pageDaen");//��ǰҳ
		String por=request.getParameter("por");
		//��ȡ��¼����
		int cnd=sql.getCount("select count(*) cnt from  course");
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
		int pageInt=page.getPageInt();
		int pageSize=page.getPageSize();
		//��ȡ���г���
		List<CourseVo> courselist=sql.courseList(pageSize, pageInt);
		//����request����������������Եĳ�������
		request.setAttribute("courselist",courselist);
		request.setAttribute("page",page);
	}
	public void listPage1(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		//��ȡҳ�����
		String pageDaen=request.getParameter("pageDaen");//��ǰҳ
		String por=request.getParameter("por");
		//��ȡ��¼����
		int cnd=sql.getCount("select count(*) cnt from  teacher");
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
		int pageInt=page.getPageInt();
		int pageSize=page.getPageSize();
		//��ȡ���г���
		List<TeacherVo> teacherlist = sql.teacherList(pageSize, pageInt);
		//����request����������������Եĳ�������
		request.setAttribute("teacherlist",teacherlist);
		request.setAttribute("page",page);
	}



}
