package com.wd.service;

import java.util.List;

import com.wd.bean.AppointmentVO;
import com.wd.bean.SaleVO;
import com.wd.common.PageByEasyUi;
import com.wd.service.BaseService;

public interface AppointmentService extends BaseService<String,AppointmentVO>{
	//预约记录列表
	public void list(AppointmentVO appointment);
	
	public PageByEasyUi<AppointmentVO> pageById(PageByEasyUi<AppointmentVO>page,String id);
	public int countById(String id);
	
	public PageByEasyUi<AppointmentVO> pageAgencyId(PageByEasyUi<AppointmentVO>page,String id);
	public int countAgencyId(String id);
	
	//用户预约记录
	public PageByEasyUi<AppointmentVO> pageByUserid(PageByEasyUi<AppointmentVO> page, String userid);

	//修改用户预约信息
	public void updateUser(AppointmentVO appointment);
	//冻结或激活用户预约信息
	public void updateUserStatus(AppointmentVO appointment);
	//修改状态
	public void updateAppstatus(AppointmentVO t);
	//销售记录
	public void saleadd(AppointmentVO t);
	public boolean checkApp(AppointmentVO t);
	//经销商查看预约记录(可通过员工姓名查询预约记录)
	public PageByEasyUi<AppointmentVO> pageByAgencyId(PageByEasyUi<AppointmentVO> page,String agencyId,String empName);
	public List<AppointmentVO> appListByUser();
	//预约统计
	public List pageEmpList(String id);
}
