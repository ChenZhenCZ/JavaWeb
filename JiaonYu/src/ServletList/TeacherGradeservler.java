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
import bean.TeacherGrade;

public class TeacherGradeservler extends HttpServlet {
		IBaseDAO base=new BaseDAOimp();
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	//讲师分类表
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String cation=request.getParameter("cation");
		if(cation.equals("list")){
			list(request, response);
			request.getRequestDispatcher("/T7/teachList.jsp").forward(request,response);
		}else if(cation.equals("add")){
			String  gradename=request.getParameter("gradename");
			String  gradePercent=request.getParameter("gradePercent");
			TeacherGrade grade=new TeacherGrade();
			grade.setGradename(gradename);
			grade.setGradePercent( Float.valueOf(gradePercent));
			base.gradeadd(grade);
			list(request, response);
			request.getRequestDispatcher("/T7/teachList.jsp").forward(request,response);	
		}else if(cation.equals("del")){
			int gradeid=Integer.parseInt(request.getParameter("gradeid"));
			base.gradeDel(gradeid);
			list(request, response);
			request.getRequestDispatcher("/T7/teachList.jsp").forward(request,response);
		}else if(cation.equals("update")){
			String gradeid=request.getParameter("gradeid");
			TeacherGrade grade=base.gradeup(gradeid);
			request.setAttribute("grade",grade);
			request.getRequestDispatcher("/T7/teachup.jsp").forward(request,response);
		}else if(cation.equals("updateSave")){
			int gradeid=Integer.parseInt(request.getParameter("gradeid"));
			String gradename=request.getParameter("gradename");
			String gradePercent=request.getParameter("gradePercent");
			TeacherGrade grade=new TeacherGrade();
			grade.setGradeid(gradeid);
			grade.setGradename(gradename);
			grade.setGradePercent(Float.parseFloat(gradePercent));
			base.gradeUpdate(grade);
			list(request, response);
			request.getRequestDispatcher("/T7/teachList.jsp").forward(request,response);
		}
		
	}
	public void list(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		List<TeacherGrade> gradeLit =base.gradeList();
		request.setAttribute("gradeLit", gradeLit);
	}

}
