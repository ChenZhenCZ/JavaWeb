package com.wd.dao.imp;

import java.math.BigInteger;
import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import com.mysql.fabric.xmlrpc.base.Data;
import com.wd.bean.BuildingsVO;
import com.wd.bean.EmployeeVO;
import com.wd.common.PageByEasyUi;
import com.wd.dao.StaffDAo;

public class StaffDaoImp implements StaffDAo{
	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public EmployeeVO queryById(String id) {
		Session session =sessionFactory.getCurrentSession();
		String sql="select * from t_employee where id='"+id+"'";
		Query query=session.createNativeQuery(sql);
		List<EmployeeVO> list=query.list();
		EmployeeVO emp=list.get(0);
		return emp;
	}

	@Override
	public void saveOrUpdate(EmployeeVO t) {
		Session session =sessionFactory.getCurrentSession();
		String sql="update t_employee set pwd='"+t.getPwd()+"' where id='"+t.getId()+"'";
		session.createSQLQuery(sql).executeUpdate();
	}
	@Override
	public void del(EmployeeVO t) {
	 Session session =sessionFactory.getCurrentSession();
	 String sql=" update t_employee set e_status='"+t.getStatus()+"' where id='"+t.getId()+"'";
	 session.createSQLQuery(sql).executeUpdate();
	}

	@Override
	public PageByEasyUi<EmployeeVO> queryByPage(PageByEasyUi<EmployeeVO> page) {
		Session session=sessionFactory.getCurrentSession();
		Query query=session.createQuery("from EmployeeVO");
		query.setFirstResult(page.getBeginIndex());
		query.setMaxResults(page.getPageSize());
		List<EmployeeVO>list=query.list();
		 page.setRows(list);
		page.setTotal(count());
		return page;
	}

	@Override
	public int count() {
		Session session=sessionFactory.getCurrentSession();
		String sql="select count(*) from t_employee";
		Query query=session.createNativeQuery(sql);
		List list=query.list();
		BigInteger cnt=(BigInteger)list.get(0);
		return cnt.intValue();
	}

	@Override
	public EmployeeVO login(EmployeeVO t) {
		Session session =sessionFactory.getCurrentSession();
		String hql="from EmployeeVO e where e.phone=? and e.pwd=? ";
		Query query =session.createQuery(hql);
		query.setString(0,t.getPhone());
		query.setString(1,t.getPwd());
		if(query!=null){		
			EmployeeVO emp =(EmployeeVO)query.uniqueResult();
			return emp;
		}else{
			return null;
		}
	}
	@Override
	public void sava(EmployeeVO t) {
		Session session=sessionFactory.getCurrentSession();
		session.save(t);
	}

	@Override
	public void xxupdate(EmployeeVO t) {
		Date date =new Date();
		t.setPwd("123456");
		t.setStatus("冻结");
		t.setCreated_time(date);
		
		Session session=sessionFactory.getCurrentSession();
		session.saveOrUpdate(t);
	}

	@Override
	public EmployeeVO updata(EmployeeVO t) {
		Session session =sessionFactory.getCurrentSession();
		String hql="from EmployeeVO e where e.id=?";
		Query query =session.createQuery(hql);
		query.setString(0,t.getId());
		List<EmployeeVO> list=query.list();
		if(list.size()>0){		
			EmployeeVO emp =list.get(0);
			return emp;
		}else{
			return null;
		}
	}

	@Override
	public void inpwd(EmployeeVO t) {//初始化密码
		 Session session =sessionFactory.getCurrentSession();
		 String sql="update t_employee set pwd='123456' where id='"+t.getId()+"'";
		 session.createSQLQuery(sql).executeUpdate();
	}


	@Override
	public void mylogo(String id, String nwelogo) {
		 Session session =sessionFactory.getCurrentSession();
		 String sql="update t_employee set headicon='"+nwelogo+"' where id='"+id+"'";
		 session.createSQLQuery(sql).executeUpdate();
		
	}

	@Override
	public void updateSta(EmployeeVO t) { //经销商修改员工资料
		 Session session =sessionFactory.getCurrentSession();
		 String sql=" update t_employee set  t_name='"+t.getName()+"',email='"+t.getEmail()+"',"
		 		+ "gender='"+t.getGender()+"',address='"+t.getAddress()+"',basic_salary='"+t.getBasic_salary()+"',"
		 		+ "building_id='"+t.getBuildings().getId()+"',percent='"+t.getPercent()+"'"
		 		+ " where id='"+t.getId()+"'";
		 session.createSQLQuery(sql).executeUpdate();
	}

	@Override
	public PageByEasyUi<EmployeeVO> pageAgencyId(PageByEasyUi<EmployeeVO> page, String id) {
		Session session =sessionFactory.getCurrentSession();
		String hql="from EmployeeVO where agency_id=:id";
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
		String sql="select count(id) from t_employee where agency_id='"+id+"'";
		BigInteger cnt=(BigInteger)session.createNativeQuery(sql).uniqueResult();
		return cnt.intValue();
	}

	@Override
	public void updataindex(EmployeeVO t) {
		 Session session =sessionFactory.getCurrentSession();
		 String sql=" update t_employee set  t_name='"+t.getName()+"',email='"+t.getEmail()+"',"
			 		+ "gender='"+t.getGender()+"',wechat='"+t.getWechat()+"',qq='"+t.getQq()+"',"
			 		+ "address='"+t.getAddress()+"',des='"+t.getDes()+"',exp='"+t.getExp()+"'"
			 		+ " where id='"+t.getId()+"'";
		 session.createSQLQuery(sql).executeUpdate();
	}
	@Override
	public List<BuildingsVO> buildList(String agencyId) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from BuildingsVO where agency_id='"+agencyId+"'");
		List<BuildingsVO> buildList = query.list();
		return buildList;
	}
}
