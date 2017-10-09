package com.wd.dao.imp;

import java.math.BigInteger;
import java.sql.Date;
import java.util.List;

import org.hibernate.query.Query;
import org.springframework.beans.BeanUtils;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.wd.bean.AppointmentVO;
import com.wd.bean.CommentVO;
import com.wd.bean.SaleVO;
import com.wd.common.PageByEasyUi;
import com.wd.dao.AppointmentDao;
import com.wd.service.SalaryService;

public class AppointmentDaoImp implements AppointmentDao{
	private SessionFactory sessionFactory;
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	@Override
	public AppointmentVO queryById(String id) {
		Session session =sessionFactory.getCurrentSession();
		String hql="from AppointmentVO where id=:id";
		Query query=session.createQuery(hql);
		query.setParameter("id",id);
		AppointmentVO list =(AppointmentVO)query.list().get(0);
		return list;
	}
	@Override
	public AppointmentVO login(AppointmentVO t) {
		// TODO Auto-generated method stub
		return null;
	}
	//新增或修改预约
	@Override
	public void saveOrUpdate(AppointmentVO t) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(t);
	}
	//取消预约
	@Override
	public void del(AppointmentVO t) {
		Session session =sessionFactory.getCurrentSession();
		String sql ="delete t_appointment where id="+t.getId();
		session.createNativeQuery(sql);
	}
	//通过分页查询预约
	@Override
	public PageByEasyUi<AppointmentVO> queryByPage(PageByEasyUi<AppointmentVO> page) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from AppoointmentVO");
		query.setFirstResult(page.getBeginIndex());
		query.setMaxResults(page.getPageSize());
		List<AppointmentVO> list = query.list();
		page.setRows(list);
		page.setTotal(count());
		return page;
	}
	//统计预约次数
	@Override
	public int count() {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createNativeQuery("select count(*) from t_appointment");
		BigInteger cnt = (BigInteger) query.uniqueResult();
		return cnt.intValue();
	}
	//预约记录列表
	@Override
	public void list(AppointmentVO appointment) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from AppointmentVO ");
	}
	@Override
	public PageByEasyUi<AppointmentVO> pageById(PageByEasyUi<AppointmentVO> page, String id) {
		System.out.println(id);
		Session session =sessionFactory.getCurrentSession();
		String hql="from AppointmentVO where emp_id=:id and status='激活'";
		Query query=session.createQuery(hql);
		query.setParameter("id",id);
		query.setFirstResult(page.getBeginIndex());
		query.setMaxResults(page.getPageSize());
		List list=query.list();
		page.setRows(list);
		page.setTotal(countById(id));
		return page;
	}

	@Override
	public int countById(String id) {//员工
		Session session =sessionFactory.getCurrentSession();
		String sql="select count(id) from t_appointment where emp_id='"+id+"' and status='激活'";
		BigInteger cnt=(BigInteger)session.createNativeQuery(sql).uniqueResult();
		return cnt.intValue();
	}

	//用户预约记录
	@Override
	public PageByEasyUi<AppointmentVO> pageByUserid(PageByEasyUi<AppointmentVO> page, String userid) {
		Session session = sessionFactory.getCurrentSession();
		String hql =" from AppointmentVO where customer_id=:id and status='激活' order by created_time desc";
		Query query = session.createQuery(hql);
		query.setParameter("id",userid);
		query.setFirstResult(page.getBeginIndex());
		query.setMaxResults(page.getPageSize());
		List<AppointmentVO> list = query.list();
		page.setRows(list);
		page.setTotal(countUserid(userid));
		return page;
	}
	//统计用户预约记录条数
	@Override
	public int countUserid(String id) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createNativeQuery("select count(id) from t_appointment where customer_id='"+id+"' and status='激活'");
		BigInteger cnt = (BigInteger) query.uniqueResult();
		return cnt.intValue();
	}
	//修改用户预约信息
	@Override
	public void updateUser(AppointmentVO appointment) {
		Session session = sessionFactory.getCurrentSession();
		String sql="update t_appointment set app_arrive_time='"+new Date(appointment.getApp_arrive_time().getTime())+"'  where id='"+appointment.getId()+"'";
		System.out.println(sql);
		session.createNativeQuery(sql).executeUpdate();	
	}
	//取消用户预约信息
	@Override
	public void updateUserStatus(AppointmentVO appointment) {
		Session session = sessionFactory.getCurrentSession();
		String sql = "update t_appointment set status='冻结' where id='"+appointment.getId()+"'";
		session.createNativeQuery(sql).executeUpdate();
	}

	@Override
	public void saleadd(SaleVO t) {//新增销售记录
		Session session =sessionFactory.getCurrentSession();
		session.saveOrUpdate(t);
	}
	@Override
	public void updateAppstatus(AppointmentVO t) {
		Session session =sessionFactory.getCurrentSession();
		String  sql="update t_appointment set app_status='"+t.getApp_status()+"' "
				+ " where id='"+t.getId()+"'";
		session.createNativeQuery(sql).executeUpdate();
		
	}
	@Override
	public boolean checkApp(AppointmentVO t) {//判断是否已预约
		Session session=sessionFactory.getCurrentSession();
		Query query=session.createQuery("from AppointmentVO where house_id=:h_id and  customer_id=:c_id ");
		query.setParameter("c_id",t.getCustomer_id());
		query.setParameter("h_id",t.getHouse_id());
		if(query.uniqueResult()==null){
			return false;
		}else{
			return true;
		}
	}
	

	@Override//经销商
	public PageByEasyUi<AppointmentVO> pageAgencyId(PageByEasyUi<AppointmentVO> page, String id) {
		Session session=sessionFactory.getCurrentSession();
		String hql="select c from AppointmentVO as c,EmployeeVO as e where ";
		hql+="emp_id=e.id and agency_id=:id and c.status='激活'";
		Query query=session.createQuery(hql);
		query.setParameter("id",id);
		query.setFirstResult(page.getBeginIndex());
		query.setMaxResults(page.getPageSize());
		page.setRows(query.list());
		page.setTotal(countAgencyId(id));
		return page;
	}
	
	@Override	//经销商条件查询
	public PageByEasyUi<AppointmentVO> pageByAgencyId(PageByEasyUi<AppointmentVO> page, String agencyId,String empName) {
		Session session = sessionFactory.getCurrentSession();
		String hql="select a from AppointmentVO as a,EmployeeVO as e where emp_id=e.id and agency_id=:id and a.status='激活' and e.name like:name ";
		Query query = session.createQuery(hql);
		query.setParameter("id", agencyId);
		query.setParameter("name", "%"+empName+"%");
		query.setFirstResult(page.getBeginIndex());
		query.setMaxResults(page.getPageSize());
		List<AppointmentVO> list = query.list();
		page.setRows(list);
		page.setTotal(countAgencyIdAndEmpName(agencyId,empName));
		return page;
	}
	
	@Override
	public int countAgencyId(String id) {
		Session session =sessionFactory.getCurrentSession();
		String sql="select count(c.id) from t_appointment as c,t_employee as e where "
				+ "c.emp_id=e.id and e.agency_id='"+id+"' and c.status='激活'";
		BigInteger cnt=(BigInteger)session.createNativeQuery(sql).uniqueResult();
		return cnt.intValue();
	}
	//经销商按员工姓名查询并分页
	public int countAgencyIdAndEmpName(String agencyId,String empName) {
		Session session =sessionFactory.getCurrentSession();
		String sql="select count(c.id) from t_appointment as c,t_employee as e where "
				+ "c.emp_id=e.id and e.agency_id='"+agencyId+"' and c.status='激活' and e.t_name like '%"+empName+"%'";
		BigInteger cnt=(BigInteger)session.createNativeQuery(sql).uniqueResult();
		return cnt.intValue();
	}
	@Override
	public List<AppointmentVO> appListByUser() {
		Session session=sessionFactory.getCurrentSession();
		Query query=session.createQuery("from AppointmentVO where app_status=:appStatus order by created_time desc");
		query.setParameter("appStatus","已购房");
		query.setFirstResult(0);
		query.setMaxResults(6);
		return query.list();
	}
	@Override
	public List pageEmpList(String id) {
		Session session = sessionFactory.getCurrentSession();
		String sql="select a.house_id,h.t_name,COUNT(a.id) from t_hourse as h,t_appointment as a where emp_id='"+id+"' "
				+ "AND h.id=a.house_id GROUP BY a.house_id";
		Query query=session.createNativeQuery(sql);
		return query.list();
	}

}
