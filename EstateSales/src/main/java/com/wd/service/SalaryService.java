package com.wd.service;

import java.util.List;

import com.wd.bean.SalaryVO;
import com.wd.bean.SaleVO;
import com.wd.common.PageByEasyUi;

public interface SalaryService extends BaseService<String,SalaryVO>{
	public void saveSalary(SaleVO s);
	public PageByEasyUi<SalaryVO> pageByEmpSalary(PageByEasyUi<SalaryVO>page,String empId);
	//经销商查看所有员工绩效
	public PageByEasyUi<SalaryVO> pageByAgencyEmpId(PageByEasyUi<SalaryVO>page,String agencyId);
	//经销商按条件查看所有员工绩效
	public PageByEasyUi<SalaryVO> agencyLookEmpSalaryListByNameOrtTime(PageByEasyUi<SalaryVO>page,String agencyId,String empName,String time);
	
	//员工通过月份查看工资
	public PageByEasyUi<SalaryVO> pageByEmpId(PageByEasyUi<SalaryVO>page,String empId,String yue);
	public List<SalaryVO>empListBySalary();
}
