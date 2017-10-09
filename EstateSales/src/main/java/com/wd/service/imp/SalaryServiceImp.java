package com.wd.service.imp;

import java.text.SimpleDateFormat;
import java.util.List;

import com.wd.bean.SalaryVO;
import com.wd.bean.SaleVO;
import com.wd.common.PageByEasyUi;
import com.wd.dao.SalaryDao;
import com.wd.service.SalaryService;

public class SalaryServiceImp implements SalaryService{
	private SalaryDao salaryDao;
	public void setSalaryDao(SalaryDao salaryDao) {
		this.salaryDao = salaryDao;
	}

	@Override
	public SalaryVO queryById(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void saveOrUpdate(SalaryVO t) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void del(SalaryVO t) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public PageByEasyUi<SalaryVO> queryByPage(PageByEasyUi<SalaryVO> page) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int count() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public SalaryVO login(SalaryVO t) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void saveSalary(SaleVO s) {
		if(salaryDao.checkSalary(s)){
			salaryDao.update(s);
		}else{
			SalaryVO sv=new SalaryVO();
			sv.setCount(1);
			sv.setEmp(s.getEmp());
			sv.setPercent(s.getEmp().getPercent());
			sv.setSum((long)s.getTotal_cost());
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM");
			String t=sdf.format(s.getSale_time());
			sv.setTime(t);
			salaryDao.saveOrUpdate(sv);
		}
		
	}

	@Override
	public PageByEasyUi<SalaryVO> pageByEmpSalary(PageByEasyUi<SalaryVO> page, String empId) {
		return salaryDao.pageByEmpId(page, empId);
	}


	@Override
	public PageByEasyUi<SalaryVO> pageByAgencyEmpId(PageByEasyUi<SalaryVO> page, String agencyId) {
		return salaryDao.pageByAgencyEmpId(page, agencyId);
	}

	@Override
	public PageByEasyUi<SalaryVO> agencyLookEmpSalaryListByNameOrtTime(PageByEasyUi<SalaryVO> page, String agencyId,String empName, String time) {
		return salaryDao.agencyLookEmpSalaryListByNameOrtTime(page, agencyId, empName, time);
	}


	@Override
	public PageByEasyUi<SalaryVO> pageByEmpId(PageByEasyUi<SalaryVO> page, String empId, String yue) {
		return salaryDao.pageByEmpId(page, empId,yue);
	}

	@Override
	public List<SalaryVO> empListBySalary() {
		return salaryDao.empListBySalary();
	}


}
