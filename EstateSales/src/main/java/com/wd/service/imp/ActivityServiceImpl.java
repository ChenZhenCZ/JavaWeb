package com.wd.service.imp;

import java.io.File;
import java.util.List;

import com.wd.bean.ActivityVO;
import com.wd.bean.AgencyVO;
import com.wd.bean.BuildingsVO;
import com.wd.bean.EmployeeVO;
import com.wd.common.PageByEasyUi;
import com.wd.dao.ActivityDao;
import com.wd.service.ActivityService;

public class ActivityServiceImpl implements ActivityService{

	private ActivityDao activityDao;
	
	public ActivityDao getActivityDao() {
		return activityDao;
	}

	public void setActivityDao(ActivityDao activityDao) {
		this.activityDao = activityDao;
	}

	@Override
	public ActivityVO queryById(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void saveOrUpdate(ActivityVO t) {
		activityDao.saveOrUpdate(t);
		
	}

	@Override
	public void del(ActivityVO t) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public PageByEasyUi<ActivityVO> queryByPage(PageByEasyUi<ActivityVO> page) {
		return activityDao.queryByPage(page);
	}

	@Override
	public int count() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public String saveActivityLogoUrl(String logoFileName, File logo) {
		return activityDao.saveActivityLogoUrl(logoFileName, logo);
	}

	@Override
	public List<BuildingsVO> buildList(String agencyId) {
		return activityDao.buildList(agencyId);
	}

	@Override
	public void inOractive(ActivityVO activityVO) {
		activityDao.inOractive(activityVO);
	}

	@Override
	public void modifyActivityLogo(ActivityVO activityVO) {
		activityDao.modifyActivityLogo(activityVO);
	}

	@Override
	public ActivityVO login(ActivityVO t) {  
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public PageByEasyUi<ActivityVO> pageByid(PageByEasyUi<ActivityVO> page, String id) {
		return activityDao.pageByid(page, id);
	}

	@Override
	public int allCount() {
	
		return activityDao.allCount();
	}

	@Override
	public PageByEasyUi<ActivityVO> queryByPageByArticleTitle(PageByEasyUi<ActivityVO> page, String activityTile) {
		
		return activityDao.queryByPageByArticleTitle(page, activityTile);
	}

	@Override
	public int getCountByArticleTitle(String activityTile) {
	
		return activityDao.getCountByArticleTitle(activityTile);
	}

	@Override
	public PageByEasyUi<ActivityVO> allqueryByPage(PageByEasyUi<ActivityVO> page) {
		
		return activityDao.allqueryByPage(page);
	}
}
