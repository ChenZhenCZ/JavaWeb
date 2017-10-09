package com.wd.service.imp;

import com.wd.bean.AdminVO;
import com.wd.bean.ArticleVO;
import com.wd.common.PageByEasyUi;
import com.wd.dao.AdminDao;
import com.wd.service.AdminService;

public class AdminServiceImp implements AdminService {
	private AdminDao adminDao;
	
	public void setAdminDao(AdminDao adminDao) {
		this.adminDao = adminDao;
	}
	@Override
	public AdminVO queryById(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void saveOrUpdate(AdminVO t) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void del(AdminVO t) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public PageByEasyUi<AdminVO> queryByPage(PageByEasyUi<AdminVO> page) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int count() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public AdminVO login(AdminVO t) {
		AdminVO admin=adminDao.login(t);
		return admin;
	}
	
}
