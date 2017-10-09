package zzz.ht.dao.impl;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import zzz.ht.bean.ManagerVo;
import zzz.ht.dao.ManagerDao;

public class ManagerDaoImpl implements ManagerDao {
	
	private SessionFactory sessionFactory;
	
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public List<ManagerVo> findManagerByPage(int startPos,int pageSize) {
		Session session = sessionFactory.getCurrentSession();
		String sql = "select * from zzz limit "+startPos+","+pageSize;
		Query query=session.createNativeQuery(sql);
		List<Object[]> list = query.list();
		List<ManagerVo> managerList = new ArrayList<ManagerVo>( );
		for (Object[] obj : list) {
			ManagerVo manager = new ManagerVo();
			manager.setId(Integer.valueOf(obj[0].toString()));
			manager.setName(obj[1].toString());
			managerList.add(manager);
		}
		return managerList;
	}

	@Override
	public int getCount(String sql) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createNativeQuery(sql);
		BigInteger cnt = (BigInteger) query.uniqueResult();
		return cnt.intValue();
	}
	
	
}
