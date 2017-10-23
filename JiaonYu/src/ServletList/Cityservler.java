package ServletList;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.java_cup.internal.action_part;
import com.sun.org.apache.bcel.internal.generic.Select;

import base.BaseDAOimp;
import base.IBaseDAO;
import bean.CityVo;
import bean.PageVo;
import bean.ProVo;

public class Cityservler extends HttpServlet {
	IBaseDAO baseDao=new BaseDAOimp();
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			doPost(request, response);
		
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//����һ�������������ֲ�ͬ�Ĳ�����ִ�в�ͬ�Ĵ���action
		/*
		 * action="list"����ִ�в�ѯ�Ĵ���
		 * action="init"����ִ������ҳ��ĳ�ʼ��
		 * action="add"����ִ���������еĴ���
		 * action="update"�����ȡ��Ҫ���µĳ�������
		 * action="updateSave"�����������
		 * action="del" ����ִ��ɾ������
		 * */
		//���봦��
		request.setCharacterEncoding("utf-8");
		String action=request.getParameter("cation");
		System.out.println(action);
		if(action.equals("list")){
		//��ѯ���е�����
		listPage(request, response);
		//ת��jspҳ��
		request.getRequestDispatcher("/T7/cityList.jsp").forward(request, response);
		}else if(action.equals("init")){
		//��ȡʡ������
		List<ProVo> provoList=baseDao.ProvoList();
		request.setAttribute("provoList",provoList);
		//ת��������jspҳ��
		request.getRequestDispatcher("/T7/cityadd.jsp").forward(request,response);	
		}else if(action.equals("add")){
		//������������
		String cityname=request.getParameter("cityname");
		String provoinceid=request.getParameter("Provinceid");
		CityVo city=new CityVo();
		city.setProvinceid(Integer.parseInt(provoinceid));
		city.setCityname(cityname);
		baseDao.Cityadd(city);
        //��ѯ
		listPage(request, response);
		//ת��jspҳ��
		request.getRequestDispatcher("/T7/cityList.jsp").forward(request, response);	
			
		}else if(action.equals("del")){
		//ɾ������
		String cityid=request.getParameter("cityid");
		baseDao.CityDel(Integer.parseInt(cityid));
		listPage(request, response);
		//ת��jspҳ��
		request.getRequestDispatcher("/T7/cityList.jsp").forward(request, response);	

		}else if(action.equals("update")){
			//��ȡʡ������
		List<ProVo> provoList=baseDao.ProvoList();
		request.setAttribute("provoList",provoList);
			//������Ҫ�޸ĵĳ�������
		String cityid=request.getParameter("cityid");
		CityVo city=baseDao.Cityup(cityid);
		request.setAttribute("city",city);
			//ת��jspҳ��
		request.getRequestDispatcher("/T7/cityup.jsp").forward(request, response);	
					
		}else if(action.equals("updateSave")){
		//�޸ĳ�������
		String cityid=request.getParameter("cityid");
		String cityname=request.getParameter("cityname").trim();
		String provinceid=request.getParameter("Provinceid");
		CityVo city=new CityVo();
		city.setCityid(Integer.parseInt(cityid));
		city.setCityname(cityname);
		city.setProvinceid(Integer.parseInt(provinceid));
		baseDao.CityUpdate(city);
		
		listPage(request, response);
		//ת��jspҳ��
		request.getRequestDispatcher("/T7/cityList.jsp").forward(request, response);
		
		}
			
			
	}
	public void list(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		List<CityVo> cityList=baseDao.CityList();
		request.setAttribute("cityList", cityList);
		System.out.println(cityList);

	}
	public void listPage(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		//��ȡҳ�����
		String pageDaen=request.getParameter("pageDaen");//��ǰҳ
		String por=request.getParameter("por");
		//��ȡ��¼����
		int cnd=baseDao.getCount("select count(*) cnt from city");
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
		//��ȡ���г���
		List<CityVo> cityLit=baseDao.CityList(pageInt, pageSize);
		//����request����������������Եĳ�������
		request.setAttribute("cityLit",cityLit);
		request.setAttribute("page",page);
	}
}
