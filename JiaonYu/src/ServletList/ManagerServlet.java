package ServletList;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import base.AesUtils;
import base.BaseDAOimp;
import base.IBaseDAO;
import bean.CityVo;
import bean.ManagerVo;
import bean.PageVo;

public class ManagerServlet extends HttpServlet {
	IBaseDAO base=new BaseDAOimp();
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			String action =request.getParameter("action");
			//HttpSession session = request.getSession();
			HttpSession session =request.getSession();
			System.out.println(action);
			if(action.equals("add")){
			ManagerVo manager=new ManagerVo();
			manager.setManagerAccount(request.getParameter("managerAccount").toString());
			String pwb=request.getParameter("managerPassword").toString();
			//对密码进行加密处理
			pwb=AesUtils.encryptStr(pwb, AesUtils.SECRETKEY).trim();
			manager.setManagerPassword(pwb);
			manager.setManagerName(request.getParameter("managerName").toString());
			manager.setSex(Integer.parseInt(request.getParameter("sex").toString()));
			manager.setContact(request.getParameter("contact").toString());
			manager.setStatu(1);//有效
			base.Manageradd(manager);
			listPage(request, response);
			request.getRequestDispatcher("/T11/manList.jsp").forward(request, response);	
			}else if(action.equals("list")){	
			listPage(request, response);
			request.getRequestDispatcher("/T11/manList.jsp").forward(request, response);
			}else if(action.equals("up")){
				String managerId=request.getParameter("managerId");
				ManagerVo manager=base.Managerup(managerId);
				request.setAttribute("manager",manager);
				request.getRequestDispatcher("/T11/manupdate.jsp").forward(request, response);
		}else if(action.equals("update")){//修改
			ManagerVo manager=new ManagerVo();
			manager.setManagerId(Integer.parseInt(request.getParameter("managerId")));
			manager.setManagerAccount(request.getParameter("managerAccount").toString());
			manager.setManagerName(request.getParameter("managerName").toString());
			manager.setSex(Integer.parseInt(request.getParameter("sex").toString()));
			manager.setContact(request.getParameter("contact").toString());
			base.ManagerUpdate(manager);
			listPage(request, response);
			request.getRequestDispatcher("/T11/manList.jsp").forward(request, response);	
		}else if(action.equals("del")){//删除
			int managerId=Integer.parseInt(request.getParameter("managerId"));
			base.ManagerDel(managerId);
			listPage(request, response);
			request.getRequestDispatcher("/T11/manList.jsp").forward(request, response);	
		}else if(action.equals("mopwd")){
			String managerId=request.getParameter("managerId");
			String onpwd=request.getParameter("onpwd");
			String newpwd=request.getParameter("newpwd");
			//对密码进行加密处理
			String olpwd=AesUtils.encryptStr(newpwd,AesUtils.SECRETKEY).trim();
			String pwd=AesUtils.encryptStr(onpwd,AesUtils.SECRETKEY).trim();
			if(base.falselise(managerId,pwd)){
			//修改密码
				base.falseaup(managerId, olpwd);
				request.setAttribute("msg", "恭喜你，密码修改成功，请妥善保管");
			}else{
				request.setAttribute("msg", "旧密码错误，请重新输入");		
			}
		listPage(request, response);
		request.getRequestDispatcher("/T11/manList.jsp").forward(request, response);	
		}else if(action.equals("inpwd")){//密码初始化
			String managerId=request.getParameter("managerId");
			base.falseaup(managerId,AesUtils.encryptStr("88888888",AesUtils.SECRETKEY));
			request.setAttribute("msg", "密码初始化，88888888");	
			listPage(request, response);
			request.getRequestDispatcher("/T11/manList.jsp").forward(request, response);	
		}else if(action.equals("status")){//更改状态
			String managerId=request.getParameter("managerId");
			String statu=request.getParameter("status");
			base.stutaup(managerId, statu);
			listPage(request, response);
			request.getRequestDispatcher("/T11/manList.jsp").forward(request, response);
		}else if(action.equals("longin")){
			String name =request.getParameter("managerAccount");
			String pwd  =request.getParameter("managerPassword");
			//对密码进行加密处理
			pwd=AesUtils.encryptStr(pwd, AesUtils.SECRETKEY);
			//验证码
			String code = request.getParameter("code").trim();
			String rand =session.getAttribute("rand").toString();
			//判断验证码是否一致
			if(!code.toUpperCase().equals(rand.toUpperCase())){
				request.setAttribute("msg", "验证码错误，请重新输入");
				request.getRequestDispatcher("/login.jsp").forward(request, response);
			}else{
				ManagerVo manager=base.login(name, pwd);
				if(manager==null){
					request.setAttribute("msg", "用户名,密码或者账号被禁用，请确认");
					request.getRequestDispatcher("/login.jsp").forward(request, response);
				}else{
				//保存登录信息
				session.setAttribute("manager",manager);
				request.getRequestDispatcher("/htCenter.jsp").forward(request,response);
				}
			}
		}
	}
	public void listPage(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		//获取页面参数
		String pageDaen=request.getParameter("pageDaen");//当前页
		String por=request.getParameter("por");
		//获取记录总数
		int cnd=base.getCount("select count(*) cnt from  Manager");
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
		int pageInt=page.getPageInt();
		int pageSize=page.getPageSize();
		//获取所有城市
		List<ManagerVo> ManagerLit=base.findManagerByPage(pageSize, pageInt);
		//定义request变量，保存的是所以的城市数据
		request.setAttribute("ManagerLit",ManagerLit);
		request.setAttribute("page",page);
	}
}
