package com.wd.dao.imp;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import com.wd.bean.AdminVO;
import com.wd.bean.ArticleVO;
import com.wd.common.PageByEasyUi;
import com.wd.dao.AdminDao;

public class AdminDaoImp implements AdminDao{
	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
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
		Session session=sessionFactory.getCurrentSession();
		String hql="from AdminVO a where a.adminName=? and a.adminPwd=?";
		Query query=session.createQuery(hql);
		query.setString(0,t.getAdminName());
		query.setString(1, t.getAdminPwd());
		List<AdminVO>list=query.list();
		if(list.size()>0){
			AdminVO admin=list.get(0);
			return admin;
		}else{
			return null;
		}
	}

	

	
}
