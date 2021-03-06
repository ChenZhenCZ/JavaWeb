package com.ht.dao.impl;

import com.ht.dao.MissionDAO;
import com.ht.pojo.TMission;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;

import java.util.List;

public class MissionDAOimpl implements MissionDAO{

	private SessionFactory sessionFactory;
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	
	public TMission queryById(String id) {
		Session session = sessionFactory.getCurrentSession();
		return session.get(TMission.class, id);
	}

	
	public void update(TMission t) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(t);
	}

	
	public void add(TMission t) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(t);
		
	}

	
	public int count(String column, String ifvalue) {
		Session session = sessionFactory.getCurrentSession();
		DetachedCriteria dc = DetachedCriteria.forClass(TMission.class);
		dc.setProjection(Projections.rowCount());
		dc.add(Restrictions.eq(column,ifvalue));
		Criteria criteria = dc.getExecutableCriteria(session);
		return Integer.parseInt(criteria.uniqueResult().toString());
	}

	
	public void delete(TMission t) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(t);
	}

	
	public List<TMission> pagelist(DetachedCriteria dc, int startpage, int pagesize) {
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = dc.getExecutableCriteria(session);
		@SuppressWarnings("unchecked")
		List<TMission> list = criteria.setFirstResult(startpage).setMaxResults(pagesize).list();
		return list;
	}

	
	public List<TMission> findmission(String column, String ifvalue) {
		Session session = sessionFactory.getCurrentSession();
		DetachedCriteria dc = DetachedCriteria.forClass(TMission.class);
		dc.add(Restrictions.eq(column,ifvalue));
		Criteria criteria = dc.getExecutableCriteria(session);
		List<TMission> list = criteria.list();
		return list;
	}

	
	public void updatelastquentity(TMission t) {
		Session session = sessionFactory.getCurrentSession();
		Query<TMission> query = session.createQuery("update TMission t set t.lastQuantityInt=t.lastQuantityInt+1  where t.empIdString ='"+t.getEmpIdString()+"'");
		query.executeUpdate();
	}

}
