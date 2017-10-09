package com.wd.dao.imp;

import org.hibernate.query.Query;

import java.math.BigInteger;
import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.wd.bean.HistoryVO;
import com.wd.common.PageByEasyUi;
import com.wd.dao.HistoryDao;

public class HistoryDaoImp implements HistoryDao{
	private SessionFactory sessionFactory;
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	@Override
	public HistoryVO login(HistoryVO t) {
			return null;
	}
	@Override
	public HistoryVO queryById(String id) {
		return null;
	}
	@Override
	public void saveOrUpdate(HistoryVO t) {		
		Session session=sessionFactory.getCurrentSession();
		session.save(t);
	}
	//删除历史记录
	@Override
	public void del(HistoryVO t) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(t);
	}
	//通过分页查询历史记录
	@Override
	public PageByEasyUi<HistoryVO> queryByPage(PageByEasyUi<HistoryVO> page) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from HistoryVO");
		query.setFirstResult(page.getBeginIndex());
		query.setMaxResults(page.getPageSize());
		List<HistoryVO> list = query.list();
		page.setRows(list);
		page.setTotal(count());
		return page;
	}
	//统计历史记录条数
	@Override
	public int count() {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createSQLQuery("select count(id) from t_history");
		BigInteger cnt = (BigInteger) query.uniqueResult();
		return cnt.intValue();
	}
	//历史记录列表
	@Override
	public void list(HistoryVO history) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from HistoryVO");
	}
	@Override
	public PageByEasyUi<HistoryVO> pageByid(PageByEasyUi<HistoryVO> page, String userid) {
		Session session=sessionFactory.getCurrentSession();
		String hql="from HistoryVO where user_id=:id order by created_time desc";
		Query query=session.createQuery(hql);
		query.setParameter("id",userid);
		query.setFirstResult(page.getBeginIndex());
		query.setMaxResults(page.getPageSize());
		List<HistoryVO> list = query.list();
		page.setRows(list);
		page.setTotal(countByid(userid));
		return page;
	}
	@Override
	public int countByid(String id) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createNativeQuery("select count(id) from t_history where user_id='"+id+"'");
		BigInteger cnt = (BigInteger) query.uniqueResult();
		return cnt.intValue();
	}
	@Override
	public boolean queryBymsg(HistoryVO history) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from HistoryVO where user_id=:id and buildings_id=:build and created_time=:t");
    	query.setParameter("id",history.getUser_id());
    	query.setParameter("build",history.getBuildings_id());
    	query.setParameter("t",new java.sql.Date(new Date().getTime()));
    	System.out.println("list集合："+query.list().size());
    	if(query.list().size()>0){
    		return true;
    	}else{
    		return false;
    	}
	}
	
}
