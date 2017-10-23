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
		//定义一个参数用来区分不同的操作，执行不同的代码action
		/*
		 * action="list"代表执行查询的代码
		 * action="init"代表执行新增页面的初始化
		 * action="add"代表执行新增城市的代码
		 * action="update"代表获取需要更新的城市数据
		 * action="updateSave"代表更新数据
		 * action="del" 代表执行删除数据
		 * */
		//乱码处理
		request.setCharacterEncoding("utf-8");
		String action=request.getParameter("cation");
		System.out.println(action);
		if(action.equals("list")){
		//查询所有的数据
		listPage(request, response);
		//转到jsp页面
		request.getRequestDispatcher("/T7/cityList.jsp").forward(request, response);
		}else if(action.equals("init")){
		//获取省份数据
		List<ProVo> provoList=baseDao.ProvoList();
		request.setAttribute("provoList",provoList);
		//转到新增的jsp页面
		request.getRequestDispatcher("/T7/cityadd.jsp").forward(request,response);	
		}else if(action.equals("add")){
		//新增城市数据
		String cityname=request.getParameter("cityname");
		String provoinceid=request.getParameter("Provinceid");
		CityVo city=new CityVo();
		city.setProvinceid(Integer.parseInt(provoinceid));
		city.setCityname(cityname);
		baseDao.Cityadd(city);
        //查询
		listPage(request, response);
		//转到jsp页面
		request.getRequestDispatcher("/T7/cityList.jsp").forward(request, response);	
			
		}else if(action.equals("del")){
		//删除数据
		String cityid=request.getParameter("cityid");
		baseDao.CityDel(Integer.parseInt(cityid));
		listPage(request, response);
		//转到jsp页面
		request.getRequestDispatcher("/T7/cityList.jsp").forward(request, response);	

		}else if(action.equals("update")){
			//获取省的资料
		List<ProVo> provoList=baseDao.ProvoList();
		request.setAttribute("provoList",provoList);
			//查找需要修改的城市资料
		String cityid=request.getParameter("cityid");
		CityVo city=baseDao.Cityup(cityid);
		request.setAttribute("city",city);
			//转到jsp页面
		request.getRequestDispatcher("/T7/cityup.jsp").forward(request, response);	
					
		}else if(action.equals("updateSave")){
		//修改城市数据
		String cityid=request.getParameter("cityid");
		String cityname=request.getParameter("cityname").trim();
		String provinceid=request.getParameter("Provinceid");
		CityVo city=new CityVo();
		city.setCityid(Integer.parseInt(cityid));
		city.setCityname(cityname);
		city.setProvinceid(Integer.parseInt(provinceid));
		baseDao.CityUpdate(city);
		
		listPage(request, response);
		//转到jsp页面
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
		//获取页面参数
		String pageDaen=request.getParameter("pageDaen");//当前页
		String por=request.getParameter("por");
		//获取记录总数
		int cnd=baseDao.getCount("select count(*) cnt from city");
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
		int pageD=page.getPageDaen();//获取当前页
		int pageInt=page.getPageInt();
		int pageSize=page.getPageSize();
		//获取所有城市
		List<CityVo> cityLit=baseDao.CityList(pageInt, pageSize);
		//定义request变量，保存的是所以的城市数据
		request.setAttribute("cityLit",cityLit);
		request.setAttribute("page",page);
	}
}
