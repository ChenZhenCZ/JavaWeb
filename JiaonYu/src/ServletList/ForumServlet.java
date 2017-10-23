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
import bean.ForumVo;

public class ForumServlet extends HttpServlet {

	IBaseDAO base=new BaseDAOimp();
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			doPost(request, response);
		
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			String action=request.getParameter("action");
			if(action.equals("add")){
			String userid =request.getParameter("userid");
			String teacherId =request.getParameter("teacherId");
			String courseid =request.getParameter("courseid");
			String txet  =request.getParameter("txet");
			String sql="insert into forum values('"+userid+"','"+teacherId+"'," +
			"'"+1+"','"+txet+"',getdate(),'老师','等待老师回复...')";
			base.chz(sql);
			System.out.println(sql);
			request.getRequestDispatcher("/listServlet?action=course&courseId="+courseid).forward(request,response);
			}else if(action.equals("up")){
			String forumid=request.getParameter("forumid");
			System.out.println(forumid);
			String id=request.getParameter("id");
			String usersName=request.getParameter("usersName");
			String text=request.getParameter("text");
			String sql="update forum set forumtext='"+usersName+"',textde='"+text+"',fourm_type='2' where  forum_id="+forumid;
			base.chz(sql);
			System.out.println(sql);
			request.getRequestDispatcher("/forumServlet?action=list1&id="+id).forward(request,response);
				
			}else if(action.equals("list")){
				String id=request.getParameter("id");
				String sql="select * from forum where userid="+id;
				List<ForumVo> forlist=base.Forlist(sql);
				request.setAttribute("forlist", forlist);
				request.getRequestDispatcher("/T15/forlist.jsp").forward(request, response);
			}else if(action.equals("list1")){
				String id=request.getParameter("id");
				String sql="select * from forum where   fourm_type=1 and ReplayUserId="+id;
				List<ForumVo> forlist=base.Forlist(sql);
				request.setAttribute("forlist", forlist);
				request.getRequestDispatcher("/T15/forlist1.jsp").forward(request, response);
			}
	
	}

}
