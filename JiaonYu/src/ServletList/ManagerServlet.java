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
			//��������м��ܴ���
			pwb=AesUtils.encryptStr(pwb, AesUtils.SECRETKEY).trim();
			manager.setManagerPassword(pwb);
			manager.setManagerName(request.getParameter("managerName").toString());
			manager.setSex(Integer.parseInt(request.getParameter("sex").toString()));
			manager.setContact(request.getParameter("contact").toString());
			manager.setStatu(1);//��Ч
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
		}else if(action.equals("update")){//�޸�
			ManagerVo manager=new ManagerVo();
			manager.setManagerId(Integer.parseInt(request.getParameter("managerId")));
			manager.setManagerAccount(request.getParameter("managerAccount").toString());
			manager.setManagerName(request.getParameter("managerName").toString());
			manager.setSex(Integer.parseInt(request.getParameter("sex").toString()));
			manager.setContact(request.getParameter("contact").toString());
			base.ManagerUpdate(manager);
			listPage(request, response);
			request.getRequestDispatcher("/T11/manList.jsp").forward(request, response);	
		}else if(action.equals("del")){//ɾ��
			int managerId=Integer.parseInt(request.getParameter("managerId"));
			base.ManagerDel(managerId);
			listPage(request, response);
			request.getRequestDispatcher("/T11/manList.jsp").forward(request, response);	
		}else if(action.equals("mopwd")){
			String managerId=request.getParameter("managerId");
			String onpwd=request.getParameter("onpwd");
			String newpwd=request.getParameter("newpwd");
			//��������м��ܴ���
			String olpwd=AesUtils.encryptStr(newpwd,AesUtils.SECRETKEY).trim();
			String pwd=AesUtils.encryptStr(onpwd,AesUtils.SECRETKEY).trim();
			if(base.falselise(managerId,pwd)){
			//�޸�����
				base.falseaup(managerId, olpwd);
				request.setAttribute("msg", "��ϲ�㣬�����޸ĳɹ��������Ʊ���");
			}else{
				request.setAttribute("msg", "�������������������");		
			}
		listPage(request, response);
		request.getRequestDispatcher("/T11/manList.jsp").forward(request, response);	
		}else if(action.equals("inpwd")){//�����ʼ��
			String managerId=request.getParameter("managerId");
			base.falseaup(managerId,AesUtils.encryptStr("88888888",AesUtils.SECRETKEY));
			request.setAttribute("msg", "�����ʼ����88888888");	
			listPage(request, response);
			request.getRequestDispatcher("/T11/manList.jsp").forward(request, response);	
		}else if(action.equals("status")){//����״̬
			String managerId=request.getParameter("managerId");
			String statu=request.getParameter("status");
			base.stutaup(managerId, statu);
			listPage(request, response);
			request.getRequestDispatcher("/T11/manList.jsp").forward(request, response);
		}else if(action.equals("longin")){
			String name =request.getParameter("managerAccount");
			String pwd  =request.getParameter("managerPassword");
			//��������м��ܴ���
			pwd=AesUtils.encryptStr(pwd, AesUtils.SECRETKEY);
			//��֤��
			String code = request.getParameter("code").trim();
			String rand =session.getAttribute("rand").toString();
			//�ж���֤���Ƿ�һ��
			if(!code.toUpperCase().equals(rand.toUpperCase())){
				request.setAttribute("msg", "��֤���������������");
				request.getRequestDispatcher("/login.jsp").forward(request, response);
			}else{
				ManagerVo manager=base.login(name, pwd);
				if(manager==null){
					request.setAttribute("msg", "�û���,��������˺ű����ã���ȷ��");
					request.getRequestDispatcher("/login.jsp").forward(request, response);
				}else{
				//�����¼��Ϣ
				session.setAttribute("manager",manager);
				request.getRequestDispatcher("/htCenter.jsp").forward(request,response);
				}
			}
		}
	}
	public void listPage(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		//��ȡҳ�����
		String pageDaen=request.getParameter("pageDaen");//��ǰҳ
		String por=request.getParameter("por");
		//��ȡ��¼����
		int cnd=base.getCount("select count(*) cnt from  Manager");
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
		List<ManagerVo> ManagerLit=base.findManagerByPage(pageSize, pageInt);
		//����request����������������Եĳ�������
		request.setAttribute("ManagerLit",ManagerLit);
		request.setAttribute("page",page);
	}
}
