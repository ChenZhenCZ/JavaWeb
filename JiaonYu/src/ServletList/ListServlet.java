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
import bean.CourseVo;
import bean.PageVo;
import bean.SectionVo;
import bean.TeacherVo;
import bean.UersVo;
import bean.UserCourseEvalVo;

public class ListServlet extends HttpServlet {
	IBaseDAO basexxp=new BaseDAOimp();
	IBaseDAO base=new BaseDAOimp();
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request,response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action=request.getParameter("action");
		if(action.equals("course")){
			String id=request.getParameter("courseId");
			CourseVo course=basexxp.courseven(id);
			TeacherVo teacher=base.findteacherById(course.getTeacherId()+"");
			List<SectionVo> sectionList=base.sectionList(Integer.parseInt(id), 3, 0);
			List<UserCourseEvalVo> list=base.Evelyn(id);
			request.setAttribute("sectionList",sectionList);
			request.setAttribute("teacher",teacher);
			request.setAttribute("course",course);
			request.setAttribute("list",list);
			request.getRequestDispatcher("/web/buy.jsp").forward(request, response);
		}
	}
	public void listPage(HttpServletRequest request, HttpServletResponse response,int courseId)
	throws ServletException, IOException {
		//��ȡҳ�����
		String pageDaen=request.getParameter("pageDaen");//��ǰҳ
		String por=request.getParameter("por");
		//��ȡ��¼����
		int cnd=base.getCount("select count(*) cnt from section");
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
		
		List<SectionVo> sectionList = base.sectionList(courseId,pageSize,pageInt);
		request.setAttribute("sectionList", sectionList);
		request.setAttribute("pager", page);
		
	}
}