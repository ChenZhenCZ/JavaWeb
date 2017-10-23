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
import bean.CityVo;
import bean.PageVo;
import bean.ProVo;

public class PoprServlet extends HttpServlet {
	IBaseDAO base=new BaseDAOimp();
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String action =request.getParameter("cation");
		System.out.println(action);
		if(action.equals("list")){
			listPage(request, response);
			request.getRequestDispatcher("/T4/propList.jsp").forward(request,response);
		}else if(action.equals("add")){
			String Provincename=request.getParameter("provincename");
			ProVo prop=new ProVo();
			prop.setProvincename(Provincename);
			base.propadd(prop);
			listPage(request, response);
			request.getRequestDispatcher("/T4/propList.jsp").forward(request,response);
		}else if(action.equals("del")){
			String provinceid=request.getParameter("provinceid");
			base.propDel(Integer.parseInt(provinceid));
			listPage(request, response);
			request.getRequestDispatcher("/T4/propList.jsp").forward(request,response);
		}
		
	}
	public void listPage(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		List<ProVo> propLit=base.propList();
		request.setAttribute("propLit", propLit);
	}
}
