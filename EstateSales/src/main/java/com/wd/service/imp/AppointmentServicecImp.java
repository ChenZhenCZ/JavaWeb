package com.wd.service.imp;

import java.sql.Date;
import java.util.List;

import com.wd.bean.AppointmentVO;
import com.wd.bean.SaleVO;
import com.wd.common.PageByEasyUi;
import com.wd.dao.AppointmentDao;
import com.wd.service.AppointmentService;
import com.wd.service.SalaryService;

public class AppointmentServicecImp implements AppointmentService{
	private AppointmentDao appointmentDao;
	private SalaryService salaryService;
	public void setSalaryService(SalaryService salaryService) {
		this.salaryService = salaryService;
	}
	public AppointmentDao getAppointmentDao() {
		return appointmentDao;
	}
	public void setAppointmentDao(AppointmentDao appointmentDao) {
		this.appointmentDao = appointmentDao;
	}
	@Override
	public AppointmentVO queryById(String id) {
		
		return appointmentDao.queryById(id);
	}
	@Override
	public AppointmentVO login(AppointmentVO t) {
		// TODO Auto-generated method stub
		return null;
	}

	//预约的新增或修改
	@Override
	public void saveOrUpdate(AppointmentVO t) {
		t.setApp_status("已预约");
		t.setCreated_time(new Date(new java.util.Date().getTime()));
		t.setStatus("激活");
		appointmentDao.saveOrUpdate(t);
	}
	//取消预约
	@Override
	public void del(AppointmentVO t) {
		appointmentDao.del(t);		
	}
	//通过分页查询预约情况
	@Override
	public PageByEasyUi<AppointmentVO> queryByPage(PageByEasyUi<AppointmentVO> page) {
		
		return appointmentDao.queryByPage(page);
	}
	//统计预约次数
	@Override
	public int count() {
		// TODO Auto-generated method stub
		return 0;
	}
	//预约记录列表
	@Override
	public void list(AppointmentVO appointment) {
		appointmentDao.list(appointment);
	}
	@Override
	public PageByEasyUi<AppointmentVO> pageById(PageByEasyUi<AppointmentVO> page, String id) {
		
		return appointmentDao.pageById(page, id);
	}
	@Override
	public int countById(String id) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public PageByEasyUi<AppointmentVO> pageAgencyId(PageByEasyUi<AppointmentVO> page, String id) {
		
		return appointmentDao.pageAgencyId(page, id);
	}
	@Override
	public int countAgencyId(String id) {
		// TODO Auto-generated method stub
		return 0;
	}
	//用户预约记录
	@Override
	public PageByEasyUi<AppointmentVO> pageByUserid(PageByEasyUi<AppointmentVO> page, String userid) {
		return appointmentDao.pageByUserid(page, userid);
	}
	//修改用户预约信息
	@Override
	public void updateUser(AppointmentVO appointment) {
		appointmentDao.updateUser(appointment);
	}
	////冻结或激活用户预约信息
	@Override
	public void updateUserStatus(AppointmentVO appointment) {
		appointmentDao.updateUserStatus(appointment);		
	}
	@Override
	public void saleadd(AppointmentVO t) {
		//新增销售记录
		SaleVO sale =new SaleVO();
		sale.setCreated_time(new java.util.Date());//创建时间
		sale.setSale_time(t.getCreated_time());//销售时间
		sale.setStatus("激活");
		sale.setEmp(t.getEmp());
		sale.setCustomer(t.getCustomer());
		sale.setUnit_price(t.getHouse().getUnit_price());//销售单价
		sale.setDiscount(0.9);//折扣
		double price=t.getHouse().getUnit_price()*0.9;//销售总价
		sale.setTotal_cost(price);
		appointmentDao.saleadd(sale);
		salaryService.saveSalary(sale);
		
	}
	@Override
	public void updateAppstatus(AppointmentVO t) {//购房
		appointmentDao.updateAppstatus(t);
	}
	@Override
	public boolean checkApp(AppointmentVO t) {
		return appointmentDao.checkApp(t);
	}
	@Override
	public PageByEasyUi<AppointmentVO> pageByAgencyId(PageByEasyUi<AppointmentVO> page, String agencyId,String empName) {
		
		return appointmentDao.pageByAgencyId(page, agencyId, empName);
	}
	@Override
	public List<AppointmentVO> appListByUser() {
		return appointmentDao.appListByUser();
	}
	@Override
	public List pageEmpList(String id) {
		
		return appointmentDao.pageEmpList(id);
	}
}
