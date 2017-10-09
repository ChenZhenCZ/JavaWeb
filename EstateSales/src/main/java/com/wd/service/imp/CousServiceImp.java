package com.wd.service.imp;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.struts2.interceptor.SessionAware;

import com.wd.bean.CustomerVO;
import com.wd.bean.EmployeeVO;
import com.wd.common.PageByEasyUi;
import com.wd.dao.CousDAo;
import com.wd.service.CousService;

public class CousServiceImp implements CousService{
	
	private CousDAo cousDao;
	private Map session;
	public void setCousDao(CousDAo cousDao) {
		this.cousDao = cousDao;
	}
	@Override
	public CustomerVO queryById(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void saveOrUpdate(CustomerVO t) {
		t.setStatus("激活");//默认状态
		t.setCreated_time(new Date(new java.util.Date().getTime()));
		t.setCustomer_type("已预约");
		cousDao.saveOrUpdate(t);
	}

	@Override
	public void del(CustomerVO t) {
		cousDao.del(t);
		
	}

	@Override
	public PageByEasyUi<CustomerVO> queryByPage(PageByEasyUi<CustomerVO> page) {
	
		return cousDao.queryByPage(page);
	}

	@Override
	public int count() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public CustomerVO login(CustomerVO t) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public List<CustomerVO> couslist() {
	List<CustomerVO> cou=cousDao.couslist();
		return cou;
	}
	@Override
	public void update(CustomerVO t) {
		cousDao.update(t);
	}
	@Override//员工客户分页
	public PageByEasyUi<CustomerVO> pageById(PageByEasyUi<CustomerVO>page,String id) {
		page=cousDao.pageById(page,id);
		return page;
	}
	@Override
	public PageByEasyUi<CustomerVO> pageAgencyId(PageByEasyUi<CustomerVO> page, String id) {
		
		return cousDao.pageAgencyId(page, id);
	}
	@Override
	public void contarct(String img, String id) {
		cousDao.contarct(img, id);
		
	}

	@Override
	public void Jihuo(String cousId) {
		cousDao.Jihuo(cousId);
	}
	@Override
	public void agencyModifyCous(CustomerVO cus) {
		cousDao.agencyModifyCous(cus);
	}
}
