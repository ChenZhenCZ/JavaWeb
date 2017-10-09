package com.wd.service;

import java.util.List;

import com.wd.bean.BuildingsVO;
import com.wd.bean.EmployeeVO;
import com.wd.common.PageByEasyUi;

public interface StaffService extends BaseService<String,EmployeeVO>{
	public void sava(EmployeeVO t);
	public void xxupdate(EmployeeVO t);
	public EmployeeVO updata(EmployeeVO t);
	public void inpwd(EmployeeVO t);
	public void updateSta(EmployeeVO t);
	public void mylogo(String id,String nwelogo);
	
	public PageByEasyUi<EmployeeVO> pageAgencyId(PageByEasyUi<EmployeeVO>page,String id);
	public int countAgencyId(String id);
	public void updataindex(EmployeeVO t);
	//初始化新增员工的楼盘下拉框
	public List<BuildingsVO> buildList(String agencyId);
}
