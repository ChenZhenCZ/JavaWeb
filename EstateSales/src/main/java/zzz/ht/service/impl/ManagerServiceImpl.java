package zzz.ht.service.impl;

import java.util.List;

import zzz.ht.bean.ManagerVo;
import zzz.ht.dao.ManagerDao;
import zzz.ht.service.ManagerService;

public class ManagerServiceImpl implements ManagerService {
	
	private ManagerDao managerDao;

	public ManagerDao getManagerDao() {
		return managerDao;
	}

	public void setManagerDao(ManagerDao managerDao) {
		this.managerDao = managerDao;
	}

	@Override
	public List<ManagerVo> findManagerByPage(int startPos,int pageSize) {
		return managerDao.findManagerByPage(startPos,pageSize);
	}

	@Override
	public int getCount(String sql) {
		return managerDao.getCount(sql);
	}
	
	
}
