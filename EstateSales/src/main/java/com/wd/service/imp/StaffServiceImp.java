package com.wd.service.imp;


import java.util.List;

import com.wd.bean.BuildingsVO;
import com.wd.bean.EmployeeVO;
import com.wd.common.PageByEasyUi;
import com.wd.dao.StaffDAo;
import com.wd.service.StaffService;

public class StaffServiceImp implements StaffService{
	private StaffDAo base;
	@Override
	public EmployeeVO queryById(String id) {
		
		return base.queryById(id);
	}
	
	public void setBase(StaffDAo base) {
		this.base = base;
	}

	@Override
	public void saveOrUpdate(EmployeeVO t) {
		base.saveOrUpdate(t);
	}

	@Override
	public void del(EmployeeVO t) {
		base.del(t);
		
	}

	@Override
	public PageByEasyUi<EmployeeVO> queryByPage(PageByEasyUi<EmployeeVO> page) {
		return base.queryByPage(page);
	}

	@Override
	public int count() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public EmployeeVO login(EmployeeVO t) {
		EmployeeVO emp =base.login(t);
		return emp;
	}


	@Override
	public EmployeeVO updata(EmployeeVO t) {
		EmployeeVO emp=base.updata(t);
		return emp;
	}


	@Override
	public void sava(EmployeeVO t) {
		base.sava(t);
		
	}


	@Override
	public void xxupdate(EmployeeVO t) {
		base.xxupdate(t);
		
	}


	@Override
	public void inpwd(EmployeeVO t) {
		base.inpwd(t);
	}


	@Override
	public void updateSta(EmployeeVO t) {
		base.updateSta(t);;
	}


	@Override
	public void mylogo(String id, String nwelogo) {
		base.mylogo(id, nwelogo);
	}


	@Override
	public PageByEasyUi<EmployeeVO> pageAgencyId(PageByEasyUi<EmployeeVO> page, String id) {
		
		return base.pageAgencyId(page, id);
	}


	@Override
	public int countAgencyId(String id) {
	
		return base.countAgencyId(id);
	}


	@Override
	public void updataindex(EmployeeVO t) {
		 base.updataindex(t);
	}
	@Override
	public List<BuildingsVO> buildList(String agencyId) {
		return base.buildList(agencyId);
	}
}
