package com.wd.dao.imp;

import java.math.BigInteger;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import com.wd.bean.AgencyVO;
import com.wd.bean.ArticleVO;
import com.wd.common.PageByEasyUi;
import com.wd.dao.AgencyDao;

public class AgencyDaoImpl implements AgencyDao {

	private SessionFactory sessionFactory;
	
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public AgencyVO queryById(String id) {
		Session session = sessionFactory.getCurrentSession();
		return session.get(AgencyVO.class, id);
	}

	@Override
	public void saveOrUpdate(AgencyVO t) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(t);
	}

	@Override
	public void del(AgencyVO t) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public PageByEasyUi<AgencyVO> queryByPage(PageByEasyUi<AgencyVO> page) {
		Session session=sessionFactory.getCurrentSession();
		Query query=session.createQuery("from AgencyVO order by created_time desc");
		query.setFirstResult(page.getBeginIndex());
		query.setMaxResults(page.getPageSize());
		List<AgencyVO>list=query.list();
		page.setRows(list);
		page.setTotal(count());
		return page;
	}

	@Override
	public int count() {
		Session session=sessionFactory.getCurrentSession();
		String sql="select count(id) from t_agency";
		Query query=session.createNativeQuery(sql);
		List list=query.list();
		BigInteger cnt=(BigInteger)list.get(0);
		return cnt.intValue();
	}

	@Override
	public int queryByPhone(String phone) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from AgencyVO where phone=?");
		query.setString(0,phone);
		List<AgencyVO> list = query.list();
		if(list.size()>0){
			return 1;	//返回1 表示该账号已被注册过
		}else{
			return 0;	//返回0 表示该账号已被注册过
		}
	}
	
	@Override
	public AgencyVO loginValidate(String phone,String pwd) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from AgencyVO where phone=? and pwd=?");
		query.setString(0,phone);
		query.setString(1,pwd);
		List<AgencyVO> agenList = query.list(); 
		AgencyVO agencyVO;
		if(agenList.size()>0){
			return agencyVO = agenList.get(0);
		}else {
			return null;
		}
	}
	
	//经销商修改密码
	@Override 
	public void forgetPwd(String phone, String pwd) {
		Session session = sessionFactory.getCurrentSession();
		String sql ="update t_agency set pwd="+pwd+" where phone="+phone;
		session.createSQLQuery(sql).executeUpdate();
	}

	@Override
	public AgencyVO lookImg(String id) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from AgencyVO where id=?");
		query.setString(0,id);
		List<AgencyVO> agencyList = query.list();
		return agencyList.get(0);
	}

	@Override
	public void modifyImg(String id, AgencyVO agency) {
		Session session = sessionFactory.getCurrentSession();
		String sql ="update t_agency set t_name='"+agency.getName()+"',email='"+agency.getEmail() +"',leader='"+agency.getLeader()+"',phone='"+agency.getPhone()+"',tel='"+agency.getTel()+"',address='"+agency.getAddress()+"',intro='"+agency.getIntro()+"' where id='"+id+"'";
		session.createSQLQuery(sql).executeUpdate();
	}

	@Override
	public void modifyLogo(String id, String logoUrl) {
		Session session = sessionFactory.getCurrentSession();
		String sql ="update t_agency set logo='"+logoUrl+"' where id='"+id+"'";
		session.createSQLQuery(sql).executeUpdate();
	}

	@Override
	public AgencyVO login(AgencyVO t) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateStatus(AgencyVO a) {
		Session session = sessionFactory.getCurrentSession();
		String sql ="update t_agency set a_status='"+a.getStatus()+"' where id='"+a.getId()+"'";
		session.createNativeQuery(sql).executeUpdate();
	}

	@Override
	public List agencyList() {
		Session session=sessionFactory.getCurrentSession();
		return session.createQuery("from AgencyVO as a").list();
	}

	@Override
	public List<AgencyVO> agencyBySale() {
		Session session=sessionFactory.getCurrentSession();
		String hql="select DISTINCT a from AgencyVO as a,EmployeeVO as e,SalaryVO as s where a.id=agency_id and e.id=emp_id and a.status=:stua  order by s.sum desc";
		Query query=session.createQuery(hql);
		query.setParameter("stua","激活");
		query.setFirstResult(0);
		query.setMaxResults(3);
		return query.list();
	}
}
