package com.wd.dao.imp;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.query.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.wd.bean.CustomerVO;
import com.wd.bean.EmployeeVO;
import com.wd.common.PageByEasyUi;
import com.wd.dao.CousDAo;

public class CousDaoImp implements CousDAo{
	private SessionFactory sessionFactory;
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	@Override
	public void saveOrUpdate(CustomerVO t) {
		Session session =sessionFactory.getCurrentSession();
		session.saveOrUpdate(t);
				
	}

	@Override
	public void del(CustomerVO t) {
		 Session session =sessionFactory.getCurrentSession();
		 String sql="update t_customer set c_status='冻结' where id='"+t.getId()+"'";
		 session.createNativeQuery(sql).executeUpdate();
	}
	
	@Override
	public PageByEasyUi<CustomerVO> queryByPage(PageByEasyUi<CustomerVO> page) {
		Session session=sessionFactory.getCurrentSession();
		Query query=session.createQuery("from CustomerVO");
		query.setFirstResult(page.getBeginIndex());
		query.setMaxResults(page.getPageSize());
		List<CustomerVO>list=query.list();
		page.setRows(list);
		page.setTotal(count());
		return page;
	}

	@Override
	public int count() {
		Session session=sessionFactory.getCurrentSession();
		String sql="select count(id) from t_customer";
		Query query=session.createNativeQuery(sql);
		BigInteger cnt=(BigInteger)query.uniqueResult();
		return cnt.intValue();
	}

	@Override
	public CustomerVO login(CustomerVO t) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public CustomerVO queryById(String id) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public List<CustomerVO> couslist() {
		List<CustomerVO> cou=new ArrayList<CustomerVO>();
		Session session=sessionFactory.getCurrentSession();
		Query query =session.createQuery("from CustomerVO");
		cou=query.list();
		return cou;
	}
	@Override
	public void update(CustomerVO t) {
		 Session session =sessionFactory.getCurrentSession();
		 String sql="update t_customer set "
		 		+ "t_name='"+t.getName()+"',gender='"+t.getGender()+"',"
		 		+ "email='"+t.getEmail()+"',identity_id='"+t.getIdentity_id()+"',phone='"+t.getPhone()+"',"
		 		+ "address='"+t.getAddress()+"',together='"+t.getTogether()+"',customer_type='"+t.getCustomer_type()+"'"
		 		+ " where id='"+t.getId()+"'";
		   session.createNativeQuery(sql).executeUpdate();
		
	}
	@Override //员工客户分页
	public PageByEasyUi<CustomerVO> pageById(PageByEasyUi<CustomerVO>page,String id) {
		Session session =sessionFactory.getCurrentSession();
		String hql="from CustomerVO where emp_id=:id";
		Query query=session.createQuery(hql);
		query.setParameter("id",id);
		query.setFirstResult(page.getBeginIndex());
		query.setMaxResults(page.getPageSize());
		page.setRows(query.list());
		page.setTotal(countById(id));
		return page;
	}
	@Override
	public int countById(String id) {
		Session session =sessionFactory.getCurrentSession();
		String sql="select count(id) from t_customer where emp_id='"+id+"'";
		BigInteger cnt=(BigInteger)session.createNativeQuery(sql).uniqueResult();
		return cnt.intValue();
	}
	@Override
	public PageByEasyUi<CustomerVO> pageAgencyId(PageByEasyUi<CustomerVO> page, String id) {
		Session session=sessionFactory.getCurrentSession();
		String hql="select c from CustomerVO as c,EmployeeVO as e where ";
		hql+="emp_id=e.id and agency_id=:id";
		Query query=session.createQuery(hql);
		query.setParameter("id",id);
		query.setFirstResult(page.getBeginIndex());
		query.setMaxResults(page.getPageSize());
		page.setRows(query.list());
		page.setTotal(countAgencyId(id));
		return page;
	}
	@Override
	public int countAgencyId(String id) {
		Session session =sessionFactory.getCurrentSession();
		String sql="select count(c.id) from t_customer as c,t_employee as e where "
				+ "c.emp_id=e.id and e.agency_id='"+id+"'";
		BigInteger cnt=(BigInteger)session.createNativeQuery(sql).uniqueResult();
		return cnt.intValue();
	}
	@Override
	public void Jihuo(String cousId) {
		Session session = sessionFactory.getCurrentSession();
		String sql="update t_customer set c_status='激活' where id='"+cousId+"'";
		session.createNativeQuery(sql).executeUpdate();
	}
	@Override
	public void agencyModifyCous(CustomerVO cus) {
		Session session = sessionFactory.getCurrentSession();
		String sql ="update t_customer set t_name='"+cus.getName()+"',gender='"+cus.getGender()+"'";
			   sql+=",email='"+cus.getEmail()+"',phone='"+cus.getPhone()+"',address='"+cus.getAddress()+"',identity_id='"+cus.getIdentity_id()+"' where id='"+cus.getId()+"'";
		session.createNativeQuery(sql).executeUpdate();
		
	}
	@Override
	public void contarct(String img, String id) {
		 Session session =sessionFactory.getCurrentSession();
		 String sql="update t_customer set  contract='"+img+"' where id='"+id+"'";
		 session.createNativeQuery(sql).executeUpdate();
		
	}

}
