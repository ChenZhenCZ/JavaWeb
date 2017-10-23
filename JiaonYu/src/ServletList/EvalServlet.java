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
import bean.UserCourseEvalVo;

public class EvalServlet extends HttpServlet {

	IBaseDAO base=new BaseDAOimp();
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			doPost(request, response);
		
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action =request.getParameter("action");
		if(action.equals("add")){
			String userid =request.getParameter("userid");
			String courseid =request.getParameter("courseid");
			String name =request.getParameter("name");
			String Fruit =request.getParameter("Fruit");
			String txet =request.getParameter("txet");
			String sql="insert into UserCourseEval values('"+userid+"','"+courseid+"'," +
			"'"+name+"','"+Fruit+"','"+txet+"',getdate())";
			base.chz(sql);
			List<UserCourseEvalVo> list=base.Evelyn(courseid);
			request.setAttribute("list",list);
			request.getRequestDispatcher("/sectionServlet?action=list1&courseId="+courseid).forward(request,response);
		}
	}

}
