package com.wd.dao.imp;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;


import com.wd.bean.SalaryVO;
import com.wd.bean.SaleVO;
import com.wd.common.PageByEasyUi;
import com.wd.dao.SaleDAo;

public class SaleDaoImp implements SaleDAo{
	
	private SessionFactory sessionFactory;
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	@Override
	public SaleVO queryById(String id) {
		Session session =sessionFactory.getCurrentSession();
		Query query=session.createQuery("from SaleVO where id=:id");
		query.setParameter("id", id);
		return (SaleVO)query.uniqueResult();
	}

	@Override
	public void saveOrUpdate(SaleVO t) {
		double total_cost=t.getUnit_price()*t.getDiscount();//销售总价
		t.setTotal_cost(total_cost);
		Session session =sessionFactory.getCurrentSession();
		String sql="update t_sale set room_id='"+t.getRoom().getId()+"', unit_price='"+t.getUnit_price()+"',"
				+ "discount='"+t.getDiscount()+"',total_cost='"+t.getTotal_cost()+"' where id='"+t.getId()+"'";
		session.createSQLQuery(sql).executeUpdate();
	}

	@Override
	public void del(SaleVO t) {
		
		Session session =sessionFactory.getCurrentSession();
		String sql="update t_sale set status='0' where id='"+t.getId()+"'";
		session.createSQLQuery(sql).executeUpdate();
	}

	@Override
	public PageByEasyUi<SaleVO> queryByPage(PageByEasyUi<SaleVO> page) {//销售记录
		Session session=sessionFactory.getCurrentSession();
		Query query=session.createQuery("from SaleVO");
		query.setFirstResult(page.getBeginIndex());
		query.setMaxResults(page.getPageSize());
		List<SaleVO>list=query.list();
		page.setRows(list);
		page.setTotal(count());
		return page;
	}

	@Override
	public int count() {
		Session session=sessionFactory.getCurrentSession();
		Query query =session.createNativeQuery("select count(id) from t_sale");
		BigInteger cnt = (BigInteger) query.uniqueResult();	
		return cnt.intValue();
	}

	@Override
	public SaleVO login(SaleVO t) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public void updateSale(SaleVO t) {
		t.setTotal_cost(t.getDiscount()*t.getUnit_price());//销售总价
		Session session=sessionFactory.getCurrentSession();
		String sql="update t_sale set unit_price='"+t.getUnit_price()+"',room_id='"+t.getRoom_id()+"'"
				+ ",discount='"+t.getDiscount()+"',total_cost='"+t.getTotal_cost()+"'  where id='"+t.getId()+"'";
		session.createSQLQuery(sql).executeUpdate();
		
	}
	@Override
	public PageByEasyUi<SaleVO> pageById(PageByEasyUi<SaleVO> page, String id) {//员工销售记录
		Session session =sessionFactory.getCurrentSession();
		String hql="from SaleVO where emp_id=:id";
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
		String sql="select count(id) from t_sale where emp_id='"+id+"'";
		BigInteger cnt=(BigInteger)session.createNativeQuery(sql).uniqueResult();
		return cnt.intValue();
	}
	//查询所有经销商销售记录
	@Override
	public PageByEasyUi<SaleVO> pageAgencyId(PageByEasyUi<SaleVO> page, String id) {
		Session session =sessionFactory.getCurrentSession();
		String hql="select s from SaleVO as s,EmployeeVO as e where emp_id=e.id and agency_id=:id";
		Query query=session.createQuery(hql);
		query.setParameter("id",id);
		query.setFirstResult(page.getBeginIndex());
		query.setMaxResults(page.getPageSize());
		List<SaleVO> list = query.list();
		page.setRows(list);
		page.setTotal(countAgencyId(id));
		return page;
	}
	@Override
	public int countAgencyId(String id) {
		Session session =sessionFactory.getCurrentSession();
		String sql="select count(s.id) from t_sale as s,t_employee as e where s.emp_id=e.id and e.agency_id='"+id+"'";
		BigInteger cnt=(BigInteger)session.createNativeQuery(sql).uniqueResult();
		return cnt.intValue();
	}

	@Override//销售总额
	public double performance(String id, String yue) {
		Session session =sessionFactory.getCurrentSession();
		String sql="select sum(total_cost) from t_sale  where emp_id='"+id+"' and sale_time like '"+yue+"%'";
		BigInteger cnt=(BigInteger)session.createNativeQuery(sql).uniqueResult();
		return cnt.doubleValue();
	}

}
