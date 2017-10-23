package ServletList;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
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
import bean.ProVo;
import bean.TeacherGrade;
import bean.TeacherVo;
import bean.UersVo;

public class UersServlet extends HttpServlet {
	IBaseDAO base=new BaseDAOimp();
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String action =request.getParameter("action");
		HttpSession session=request.getSession();
		
		if(action.equals("init")){
			String provinceid =request.getParameter("provinceId");
			//��ѯ����ʡ��
			List<ProVo> proList=base.ProvoList();
			//��ѯָ��ʡ�ĳ���
			List<CityVo> cityList=null;
			if(provinceid!=null){
				cityList=base.CityList(Integer.parseInt(provinceid));
			}else if(proList.size()>0){
				ProVo p=proList.get(0);
				cityList =base.CityList(p.getProvinceid());
			}
			request.setAttribute("proList",proList);
			request.setAttribute("cityList",cityList);
			request.setAttribute("provinceid",provinceid);
			getServletContext().getRequestDispatcher("/T14/uerseadd.jsp").forward(request,response);
		}else if(action.equals("add")){
			UersVo uers=new UersVo();
			uers.setProvinceId(Integer.parseInt(request.getParameter("provinceId").trim()));
			uers.setCityId(Integer.parseInt(request.getParameter("cityId").trim()));
			String d=request.getParameter("mobile").trim();
			System.out.println(d);
			uers.setMobile(request.getParameter("mobile").trim());
			String pwd = request.getParameter("password").trim();
			//��������м��ܴ���
			pwd=AesUtils.encryptStr(pwd, AesUtils.SECRETKEY);
			uers.setPassword(pwd);
			uers.setUsersName(request.getParameter("userName").trim());
			uers.setSex(Integer.parseInt(request.getParameter("sex").trim()));
			uers.setEmail(request.getParameter("email").trim());
			uers.setHomeAddress(request.getParameter("homeAddress").trim());
			uers.setRemainMoney(Float.parseFloat("0.0"));//���
			uers.setUserType(1);//ѧ��
			try{
				base.uersadd(uers);
//				listPage(request, response);
//				request.getRequestDispatcher("/T14/uersList.jsp").forward(request, response);	
			}catch(Exception e){
				e.printStackTrace();
				request.setAttribute("msg", "���ֻ������Ѿ�ע����ˣ������������ֻ�����");
				String provinceid =request.getParameter("provinceId");
				//��ѯ����ʡ��
				List<ProVo> proList=base.ProvoList();
				//��ѯָ��ʡ�ĳ���
				List<CityVo> cityList=null;
				if(provinceid!=null){
					cityList=base.CityList(Integer.parseInt(provinceid));
				}else if(proList.size()>0){
					ProVo p=proList.get(0);
					cityList =base.CityList(p.getProvinceid());
				}
				request.setAttribute("proList",proList);
				request.setAttribute("cityList",cityList);
				request.setAttribute("provinceid",provinceid);
				getServletContext().getRequestDispatcher("/T14/uerseadd.jsp").forward(request,response);	
				return;
			}
			uers.setRegisterDate(new Date());
			//�����û���Ϣ
			session.setAttribute("user", uers);
			setCookie(request,response,uers.getMobile(),uers.getPassword());
			request.getRequestDispatcher("/web/webCenter.jsp").forward(request, response);
		}else if(action.equals("del")){
			String userid=request.getParameter("userid");
			base.uersdel(Integer.parseInt(userid));
			listPage(request, response);
			request.getRequestDispatcher("/T14/uersList.jsp").forward(request, response);	
		}else if(action.equals("up")){
			String userid=request.getParameter("userid");
			UersVo userList=base.uersup(Integer.parseInt(userid));
			request.setAttribute("userList", userList);
			getServletContext().getRequestDispatcher("/T14/uerseup.jsp").forward(request,response);	
		}else if(action.equals("up1")){
			String userid=request.getParameter("userid");
			UersVo userList=base.uersup(Integer.parseInt(userid));
			request.setAttribute("userList", userList);
			getServletContext().getRequestDispatcher("/T11/chz.jsp").forward(request,response);	
		}else if(action.equals("up2")){
			String userid=request.getParameter("userid");
			UersVo userList=base.uersup(Integer.parseInt(userid));
			request.setAttribute("userList", userList);
			getServletContext().getRequestDispatcher("/T11/dz.jsp").forward(request,response);	
		}else if(action.equals("update")){
			String userid=request.getParameter("userid");
			String mobile=request.getParameter("mobile");
			String  sex=request.getParameter("sex");
			String usersName=request.getParameter("usersName");
			String homeAddress=request.getParameter("homeAddress");
			String email=request.getParameter("email");
			String remainMoney=request.getParameter("email");
			UersVo uers=new UersVo();
			uers.setUserid(Integer.parseInt(userid));
			uers.setMobile(mobile);
			uers.setSex(Integer.parseInt(sex));
			uers.setUsersName(usersName);
			uers.setHomeAddress(homeAddress);
			uers.setEmail(email);
			base.uersupde(uers);
			listPage(request, response);
			request.getRequestDispatcher("/T14/uersList.jsp").forward(request, response);	
		}else if(action.equals("login")){
			String mobile = request.getParameter("mobile").trim();
			String pwd = request.getParameter("password").trim();
			//��������м��ܴ���
			pwd=AesUtils.encryptStr(pwd, AesUtils.SECRETKEY);
			UersVo user = base.login1(mobile, pwd);
			if(user==null){
				request.setAttribute("msg", "�û�����������󣬵�¼ʧ�ܣ�");
				request.getRequestDispatcher("/web/login.jsp").forward(request, response);
			}else{
				setCookie(request,response,user.getMobile(),pwd);
				session.setAttribute("user", user);
				request.getRequestDispatcher("/web/webCenter.jsp").forward(request, response);
			}
		}else if(action.equals("addmoney")){
			//��ֵ
			float money=Float.parseFloat(request.getParameter("remainMoney"));
			float payMoney=Float.parseFloat(request.getParameter("addmoney"));
			int userid=Integer.parseInt(request.getParameter("userid"));
			money=money+payMoney;
			String mobile = request.getParameter("moblie").trim();
			String pwd = request.getParameter("password").trim();
			int managerId=Integer.parseInt(request.getParameter("userid"));
			//��������м��ܴ���
			pwd=AesUtils.encryptStr(pwd, AesUtils.SECRETKEY);
			UersVo user2 = base.login1(mobile, pwd);
			if(user2==null){
				request.setAttribute("msg", "�û�����������󣬳�ֵʧ�ܣ�");
				request.getRequestDispatcher("/web/webCenter.jsp").forward(request, response);
			}
				String sql="update users set remainMoney='"+money+"' where userid="+userid;
				System.out.println(sql);
				base.chz(sql);
				session.setAttribute("user", user2);
				request.getRequestDispatcher("/web/webCenter.jsp").forward(request, response);
		}else if(action.equals("login2")){
			String mobile = request.getParameter("mobile").trim();
			String pwd = request.getParameter("password").trim();
			int remainMoney=Integer.parseInt(request.getParameter("remainMoney"));
			int managerId=Integer.parseInt(request.getParameter("managerId"));
			String Money=request.getParameter("Money");
			System.out.println(Money);
			//��������м��ܴ���
			pwd=AesUtils.encryptStr(pwd, AesUtils.SECRETKEY);
			UersVo user = base.login1(mobile, pwd);
			if(user==null){
				request.setAttribute("msg", "�û�����������󣬳�ֵʧ�ܣ�");
				request.getRequestDispatcher("/T11/chz.jsp?&userid="+managerId).forward(request, response);
			}else{
				setCookie(request,response,user.getMobile(),pwd);
				int remain=0;
				if(Money!=null){
					 remain=remainMoney+Integer.parseInt(Money);
				}else {
					 remain=remainMoney;
			
				}
				String sql="insert into CashRecord  values('"+managerId+"',getdate()," +
						""+remain+",'10.0','0','') ";
				System.out.println(sql);
				base.chz(sql);
				session.setAttribute("user", user);
				request.getRequestDispatcher("/web/webCenter.jsp").forward(request, response);
			}
		}else if(action.equals("autologin")){
			String mobile = request.getParameter("mobile").trim();
			String pwd = request.getParameter("password").trim();
			UersVo user = base.login1(mobile, pwd);
			if(user==null){
				request.setAttribute("msg", "�û�����������󣬵�¼ʧ�ܣ�");
				request.getRequestDispatcher("/web/login.jsp").forward(request, response);
			}else{
				setCookie(request,response,user.getMobile(),pwd);
				session.setAttribute("user", user);
				request.getRequestDispatcher("/web/webCenter.jsp").forward(request, response);
			}
		}else if(action.equals("exit")){
			session.invalidate();
			Cookie cookie1 = new Cookie("mobile",URLEncoder.encode(""));
	    	Cookie cookie2 = new Cookie("password",URLEncoder.encode(""));
	    	//����һ�����Ч��,��λ����
			cookie1.setMaxAge(0);
			//����һ�����Ч��
			cookie2.setMaxAge(0);
	    	//���ñ���·��
	    	cookie1.setPath(request.getContextPath());
	    	cookie2.setPath(request.getContextPath());
	    	response.addCookie(cookie1);
	    	response.addCookie(cookie2);
	    	request.getRequestDispatcher("/web/index.jsp").forward(request, response);
		}else if(action.equals("list")){
			listPage(request, response);
			request.getRequestDispatcher("/T14/uersList.jsp").forward(request, response);	
		}
	}
	public void listPage(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		//��ȡҳ�����
		String pageDaen=request.getParameter("pageDaen");//��ǰҳ
		String por=request.getParameter("por");
		//��ȡ��¼����
		int cnd=base.getCount("select count(*) cnt from users");
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
		int startPos=page.getPageInt();
		int pageSize=page.getPageSize();
		//��ȡ���г���
		List<UersVo> userLit=base.findUserByPage1(pageSize, startPos);
		//����request����������������Եĳ�������
		request.setAttribute("userLit",userLit);
		request.setAttribute("page",page);
	}
	private void setCookie(HttpServletRequest request, HttpServletResponse response, String mobile,String password){
		Cookie cookie1 = new Cookie("mobile",URLEncoder.encode(mobile));
    	Cookie cookie2 = new Cookie("password",URLEncoder.encode(password));
    	//����һ�����Ч��,��λ����
		cookie1.setMaxAge(24*60*60*30);
		//����һ�����Ч��
		cookie2.setMaxAge(24*60*60*30);
//    	System.out.println(cookie1.getName()+"="+cookie1.getValue());
//    	System.out.println(cookie2.getName()+"="+cookie2.getValue());
    	//���ñ���·��
    	cookie1.setPath(request.getContextPath());
    	cookie2.setPath(request.getContextPath());
    	response.addCookie(cookie1);
    	response.addCookie(cookie2);
	}
}
