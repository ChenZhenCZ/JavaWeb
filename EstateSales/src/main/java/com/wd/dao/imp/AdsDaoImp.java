package com.wd.dao.imp;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.wd.bean.AdsVO;
import com.wd.common.PageByEasyUi;
import com.wd.dao.AdsDao;

public class AdsDaoImp implements AdsDao{
	public SessionFactory sessionFactory;
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public AdsVO queryById(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void saveOrUpdate(AdsVO t) {
		Session session=sessionFactory.getCurrentSession();
		session.saveOrUpdate(t);
	}

	@Override
	public void del(AdsVO t) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public PageByEasyUi<AdsVO> queryByPage(PageByEasyUi<AdsVO> page) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int count() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public AdsVO login(AdsVO t) {
		// TODO Auto-generated method stub
		return null;
	}

}
