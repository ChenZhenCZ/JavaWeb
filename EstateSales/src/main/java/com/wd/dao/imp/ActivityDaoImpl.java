package com.wd.dao.imp;

import java.io.File;
import java.io.IOException;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import com.wd.bean.ActivityVO;
import com.wd.bean.BuildingsVO;
import com.wd.common.PageByEasyUi;
import com.wd.dao.ActivityDao;

public class ActivityDaoImpl implements ActivityDao{

	private SessionFactory sessionFactory;
	
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	@Override
	public ActivityVO queryById(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void saveOrUpdate(ActivityVO t) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(t);
	}

	@Override
	public void del(ActivityVO t) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public PageByEasyUi<ActivityVO> queryByPage(PageByEasyUi<ActivityVO> page) {
		Session session=sessionFactory.getCurrentSession();
		String hql="from ActivityVO  where buildings_id=null";
		Query query=session.createQuery(hql);
		query.setFirstResult(page.getBeginIndex());
		query.setMaxResults(page.getPageSize());
		List<ActivityVO> list = query.list();
		page.setRows(list);
		page.setTotal(count());
		return page;
	}

	@Override
	public int count() {
		Session session=sessionFactory.getCurrentSession();
		String sql="select count(*) from t_activity where buildings_id=null";
		Query query=session.createNativeQuery(sql);
		List list=query.list();
		BigInteger cnt=(BigInteger)list.get(0);
		return cnt.intValue();
	}

	@Override
	public String saveActivityLogoUrl(String logoFileName, File logo) {
		String path = ServletActionContext.getRequest().getRealPath("/attached/agency");
		int pos = logoFileName.lastIndexOf('.');
		String ext = logoFileName.substring(pos); 
		String newFileName = System.nanoTime()+ext;
		try {
			FileUtils.copyFile(logo, new File(path,newFileName));//保存楼栋图片
		} catch (IOException e) {
			e.printStackTrace();
		}
		String logoUrl=ServletActionContext.getRequest().getContextPath()+"/attached/agency";
		return logoUrl+"/"+newFileName;
	}

	@Override
	public List<BuildingsVO> buildList(String agencyId) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from BuildingsVO where agency_id='"+agencyId+"'");
		List<BuildingsVO> buildList = query.list();
		return buildList;
	}

	@Override
	public void inOractive(ActivityVO activityVO) {
		Session session = sessionFactory.getCurrentSession();
		String sql = "update t_activity set a_status='"+activityVO.getStatus()+"' where id='"+activityVO.getId()+"'";
		session.createSQLQuery(sql).executeUpdate();
		
	}

	@Override
	public void modifyActivityLogo(ActivityVO activityVO) {
		Session session = sessionFactory.getCurrentSession();
		String sql = "update t_activity set logo='"+activityVO.getLogo()+"' where id='"+activityVO.getId()+"'";
		session.createSQLQuery(sql).executeUpdate();
	}

	@Override
	public ActivityVO login(ActivityVO t) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public PageByEasyUi<ActivityVO> pageByid(PageByEasyUi<ActivityVO> page, String id) {
		Session session=sessionFactory.getCurrentSession();
		String hql="select a from ActivityVO as a,BuildingsVO as b where buildings_id=b.id and agency_id=:id";
		Query query=session.createQuery(hql);
		query.setParameter("id",id);
		query.setFirstResult(page.getBeginIndex());
		query.setMaxResults(page.getPageSize());
		List<ActivityVO> list = query.list();
		page.setRows(list);
		page.setTotal(count());
		return page;
	}

	@Override
	public int allCount() {
		Session session = sessionFactory.getCurrentSession();
		String sql="select count(*) from t_activity order by start_time desc";
		Query query = session.createNativeQuery(sql);
		BigInteger cnt = (BigInteger) query.uniqueResult();
		return cnt.intValue();
	}

	@Override
	public PageByEasyUi<ActivityVO> queryByPageByArticleTitle(PageByEasyUi<ActivityVO> page, String activityTile) {
		Session session = sessionFactory.getCurrentSession();
		String hql="from ActivityVO where title like:title order by start_time desc";
		Query query = session.createQuery(hql);
		query.setParameter("title","%"+activityTile+"%");
		query.setFirstResult(page.getBeginIndex());
		query.setMaxResults(page.getPageSize());
		page.setRows(query.list());
		return page;
	}

	@Override
	public int getCountByArticleTitle(String activityTile) {
		Session session = sessionFactory.getCurrentSession();
		String sql="select count(*) from t_activity where title like'%"+activityTile+"%' order by start_time desc";
		Query query = session.createNativeQuery(sql);
		BigInteger cnt = (BigInteger) query.uniqueResult();
		return cnt.intValue();
	}

	@Override
	public PageByEasyUi<ActivityVO> allqueryByPage(PageByEasyUi<ActivityVO> page) {
		Session session=sessionFactory.getCurrentSession();
		String hql="from ActivityVO";
		Query query=session.createQuery(hql);
		query.setFirstResult(page.getBeginIndex());
		query.setMaxResults(page.getPageSize());
		List<ActivityVO> list = query.list();
		page.setRows(list);
		page.setTotal(allCount());
		return page;
	}
	
}
