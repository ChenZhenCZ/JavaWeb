package com.wd.dao.imp;

import java.math.BigInteger;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import com.wd.bean.SalaryVO;
import com.wd.bean.SaleVO;
import com.wd.common.PageByEasyUi;
import com.wd.dao.SalaryDao;

public class SalaryDaoImp implements SalaryDao{
	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public SalaryVO queryById(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void saveOrUpdate(SalaryVO t) {
		Session session=sessionFactory.getCurrentSession();
		session.saveOrUpdate(t);
	}

	@Override
	public void del(SalaryVO t) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public PageByEasyUi<SalaryVO> queryByPage(PageByEasyUi<SalaryVO> page) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int count() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public SalaryVO login(SalaryVO t) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean checkSalary(SaleVO s) {
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM");
		String t=sdf.format(s.getSale_time());
		String hql="from SalaryVO where emp_id=:id and time=:tm";
		Session session=sessionFactory.getCurrentSession();
		Query query=session.createQuery(hql);
		query.setParameter("id",s.getEmp().getId());
		query.setParameter("tm",t);
		if(query.uniqueResult()==null){
			return false;
		}else{
			return true;
		}
	}

	@Override
	public void update(SaleVO s) {
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM");
		String t=sdf.format(s.getSale_time());
		String sql="update t_salary set count=count+1,sum=sum+"+s.getTotal_cost()+""
				+"  where emp_id='"+s.getEmp().getId()+"' and"
						+ " time='"+t+"'";
		Session session=sessionFactory.getCurrentSession();
		session.createNativeQuery(sql).executeUpdate();
	}

	@Override
	public PageByEasyUi<SalaryVO> pageByEmpId(PageByEasyUi<SalaryVO> page, String empId) {
		Session session=sessionFactory.getCurrentSession();
		String hql="from SalaryVO where emp_id=:id";
		Query query=session.createQuery(hql);
		query.setParameter("id",empId);
		query.setFirstResult(page.getBeginIndex());
		query.setMaxResults(page.getPageSize());
		page.setRows(query.list());
		page.setTotal(query.list().size());
		return page;
	}

	@Override
	public PageByEasyUi<SalaryVO> pageByEmpId(PageByEasyUi<SalaryVO> page, String empId, String yue) {
		Session session=sessionFactory.getCurrentSession();
		String hql="from SalaryVO where emp_id=:id and time=:yue";
		Query query=session.createQuery(hql);
		query.setParameter("id",empId);
		query.setParameter("yue", yue);
		query.setFirstResult(page.getBeginIndex());
		query.setMaxResults(page.getPageSize());
		page.setRows(query.list());
		page.setTotal(query.list().size());
		return page;
	}

	@Override	//经销商查看员工绩效
	public PageByEasyUi<SalaryVO> pageByAgencyEmpId(PageByEasyUi<SalaryVO> page, String agencyId) {
		Session session=sessionFactory.getCurrentSession();
		String hql="select s from SalaryVO as s,EmployeeVO as e where emp_id=e.id and agency_id=:id";
		Query query=session.createQuery(hql);
		query.setParameter("id",agencyId);
		query.setFirstResult(page.getBeginIndex());
		query.setMaxResults(page.getPageSize());
		page.setRows(query.list());
		page.setTotal(contByAgencyId(agencyId));
		return page;
	}
	//经销商通过自己Id统计绩效记录数
	public int contByAgencyId(String agencyId){
		Session session=sessionFactory.getCurrentSession();
		String hql="select count(s.id) from SalaryVO as s,EmployeeVO as e where emp_id=e.id and agency_id=:id";
		System.out.println(hql);
		Query query=session.createQuery(hql);
		query.setParameter("id",agencyId);
		return Integer.valueOf(query.list().get(0).toString());
	}

	@Override
	public PageByEasyUi<SalaryVO> agencyLookEmpSalaryListByNameOrtTime(PageByEasyUi<SalaryVO> page, String agencyId,String empName, String time) {
		Session session=sessionFactory.getCurrentSession();
		String hql="select s from SalaryVO as s,EmployeeVO as e where emp_id=e.id and agency_id=:id and e.name like:empName and s.time like:time";
		Query query=session.createQuery(hql);
		query.setParameter("id",agencyId);
		query.setParameter("empName","%"+empName+"%");
		query.setParameter("time","%"+time+"%");
		query.setFirstResult(page.getBeginIndex());
		query.setMaxResults(page.getPageSize());
		page.setRows(query.list());
		page.setTotal(contByAgencyIdAndEmpNameAndTime(agencyId,empName,time));
		return page;
	}
	//经销商通过员工或时间统计绩效记录数
	public int contByAgencyIdAndEmpNameAndTime(String agencyId,String empName, String time){
		Session session=sessionFactory.getCurrentSession();
		String hql="select count(s.id) from SalaryVO as s,EmployeeVO as e where emp_id=e.id and agency_id=:id and e.name like:empName and s.time like:time";
		Query query=session.createQuery(hql);
		query.setParameter("id",agencyId);
		query.setParameter("empName","%"+empName+"%");
		query.setParameter("time","%"+time+"%");
		return Integer.valueOf(query.list().get(0).toString());
	}

	@Override
	public List<SalaryVO> empListBySalary() {
		Session session=sessionFactory.getCurrentSession();
		String hql="select s from SalaryVO as s where s.time=:t order by s.sum desc";
		Query query=session.createQuery(hql);
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM");
		String t=sdf.format(new Date());
		query.setParameter("t",t);
		query.setFirstResult(0);
		query.setMaxResults(3);
		return query.list();
	}

}
