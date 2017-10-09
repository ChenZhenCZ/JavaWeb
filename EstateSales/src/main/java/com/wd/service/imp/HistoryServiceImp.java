package com.wd.service.imp;

import java.util.Date;

import org.hibernate.Session;

import com.wd.bean.HistoryVO;
import com.wd.common.PageByEasyUi;
import com.wd.dao.HistoryDao;
import com.wd.service.HistoryService;

public class HistoryServiceImp implements HistoryService{
	private HistoryDao historyDao;
	public HistoryDao getHistoryDao() {
		return historyDao;
	}
	public void setHistoryDao(HistoryDao historyDao) {
		this.historyDao = historyDao;
	}
	@Override
	public HistoryVO queryById(String id) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public void saveOrUpdate(HistoryVO t) {
		t.setCreated_time(new Date());
		historyDao.saveOrUpdate(t);
	}
	@Override
	public HistoryVO login(HistoryVO t) {
		// TODO Auto-generated method stub
		return null;
	}
	
	//通过分页查询历史记录
	@Override
	public PageByEasyUi<HistoryVO> queryByPage(PageByEasyUi<HistoryVO> page) {
		// TODO Auto-generated method stub
		return null;
	}
	//统计记录条数
	@Override
	public int count() {
		// TODO Auto-generated method stub
		return 0;
	}
	//历史记录列表
	@Override
	public void list(HistoryVO history) {
		historyDao.list(history);		
	}
	@Override
	public PageByEasyUi<HistoryVO> pageByid(PageByEasyUi<HistoryVO> page, String userid) {
		return historyDao.pageByid(page, userid);
	}
	//删除历史记录
	@Override
	public void del(HistoryVO t) {
		historyDao.del(t);
		
	}
	@Override
	public boolean queryBymsg(HistoryVO history) {
		// TODO Auto-generated method stub
		return historyDao.queryBymsg(history);
	}
}
