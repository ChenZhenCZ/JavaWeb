package com.wd.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;
import com.wd.bean.AgencyVO;
import com.wd.bean.BuildingsVO;
import com.wd.bean.EmployeeVO;
import com.wd.bean.RoomVO;
import com.wd.bean.SalaryVO;
import com.wd.bean.SaleVO;
import com.wd.common.PageByEasyUi;
import com.wd.service.BuildingsService;
import com.wd.service.RoomService;
import com.wd.service.SaleService;

public class SaleAction extends ActionSupport implements SessionAware{
	private SaleVO sale;
	private SaleService saleService;
	private BuildingsService buildingsService;
	private BuildingsVO buildings;
	private EmployeeVO emp;
	private HttpServletRequest request;
	private String msg;
	private RoomService roomService;
	private List rows;
	private int total;
	private int pageNumber;
	private int pageSize;
	private Map session;
	private String buildsName;  //经销商通过楼盘查询销售记录
	private List<SalaryVO> salarys;
	public String allSaleList(){//管理员
		PageByEasyUi<SaleVO> page=new PageByEasyUi<>();
		page.setPage(pageNumber);
		page.setPageSize(pageSize);
		page=saleService.queryByPage(page);
		total=page.getTotal();
		rows=page.getRows();
		return "list";
	}
	
	public String salelist(){//员工销售记录
		PageByEasyUi<SaleVO> page=new PageByEasyUi<>();
		EmployeeVO employ= (EmployeeVO)session.get("emp");
		page.setPageSize(pageSize);
		page.setPage(pageNumber);
		page=saleService.pageById(page, employ.getId());
		rows=page.getRows();
		total=page.getTotal();
		return"list";
	}
	public String initAgencyTable(){
		return "agencyList";
	}
	public String agencyList(){//经销商
		PageByEasyUi<SaleVO> page=new PageByEasyUi<>();
		AgencyVO agency= (AgencyVO)session.get("agencyVO");
		page.setPageSize(pageSize);
		page.setPage(pageNumber);
		page=saleService.pageAgencyId(page, agency.getId());
		rows=page.getRows();
		total=page.getTotal();
		return"list";
	}
	

	public String updatesale(){//修改资料
		System.out.println(sale.getRoom().getBuilding_id());
		RoomVO room=roomService.empRoom(sale.getRoom().getName(),sale.getRoom().getBuilding_id());
		if(room!=null){
			sale.setRoom(room);
			saleService.saveOrUpdate(sale);
			room.setSale_status("已售");
			roomService.modifyRoomStatus(room);
			
		}else{
			msg="失败";
		}
		return"list";
	}
	public String cous(){//修改
		saleService.updateSale(sale);
		return "list";
	}
	public String init(){//员工销售记录列表页面
		EmployeeVO employ= (EmployeeVO)session.get("emp");
		session.put("emp",employ); //保存session
		return "init";
	}
	//查看详情
	public String  salexiangqing(){
		sale=saleService.queryById(sale.getId());
		EmployeeVO emp= (EmployeeVO)session.get("emp");
		buildings=buildingsService.lookBuildsDetail(emp.getBuildings().getId());
		return"xiangqing";
	}
	public String performanceList(){
		
		return"performant";
	}
	public SaleVO getSale() {
		
		return sale;
	}
	public void setSale(SaleVO sale) {
		this.sale = sale;
	}
	public void setSaleService(SaleService saleService) {
		this.saleService = saleService;
	}
	public List getRows() {
		return rows;
	}
	public int getTotal() {
		return total;
	}
	public void setPageNumber(int pageNumber) {
		this.pageNumber = pageNumber;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public void setSession(Map session) {
		this.session = session;
	}

	public void setRoomService(RoomService roomService) {
		this.roomService = roomService;
	}

	public String getMsg() {
		return msg;
	}


	public void setBuildsName(String buildsName) {
		this.buildsName = buildsName;
	}

	
	public void setBuildingsService(BuildingsService buildingsService) {
		this.buildingsService = buildingsService;
	}

	public BuildingsVO getBuildings() {
		return buildings;
	}

	public void setBuildings(BuildingsVO buildings) {
		this.buildings = buildings;
	}
	public EmployeeVO getEmp() {
		return emp;
	}
	public HttpServletRequest getRequest() {
		return request;
	}
	
}
