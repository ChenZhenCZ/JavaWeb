package com.wd.dao.imp;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.List;

import javax.jms.ServerSession;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import com.sun.org.apache.regexp.internal.recompile;
import com.wd.bean.ActivityVO;
import com.wd.bean.BuildingsVO;
import com.wd.bean.HourseVO;
import com.wd.common.PageByEasyUi;
import com.wd.dao.HouseDao;

public class HouseDaoImp implements HouseDao {

	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public HourseVO queryById(String id) {
		Session session=sessionFactory.getCurrentSession();
		return session.get(HourseVO.class,id);
	}

	@Override
	public void saveOrUpdate(HourseVO t) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(t);
	}

	@Override
	public void del(HourseVO t) {
		// TODO Auto-generated method stub

	}

	@Override
	public PageByEasyUi<HourseVO> queryByPage(PageByEasyUi<HourseVO> page) {
		Session session=sessionFactory.getCurrentSession();
		Query query=session.createQuery("from HourseVO");
		query.setFirstResult(page.getBeginIndex());
		query.setMaxResults(page.getPageSize());
		page.setRows(query.list());
		page.setTotal(count());
		return page;
	}

	@Override
	public int count() {
		Session session=sessionFactory.getCurrentSession();
		String sql="select count(id) from t_hourse";
		Query query=session.createNativeQuery(sql);
		List list=query.list();
		BigInteger cnt=(BigInteger)list.get(0);
		return cnt.intValue();
	}

	@Override
	public HourseVO login(HourseVO t) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<BuildingsVO> buildList(String agencyId) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from BuildingsVO where agency_id='"+agencyId+"'");
		List<BuildingsVO> buildList = query.list();
		return buildList;
	}

	@Override
	public PageByEasyUi<HourseVO> pageByid(PageByEasyUi<HourseVO> page, String agencyId) {
		Session session=sessionFactory.getCurrentSession();
		String hql="select a from HourseVO as a,BuildingsVO as b where buildings_id=b.id and agency_id=:id";
		Query query=session.createQuery(hql);
		query.setParameter("id",agencyId);
		query.setFirstResult(page.getBeginIndex());
		query.setMaxResults(page.getPageSize());
		List<HourseVO> list = query.list();
		page.setRows(list);
		page.setTotal(countByAgencyId(agencyId));
		return page;
	}
	public int countByAgencyId(String agencyId){
		Session session=sessionFactory.getCurrentSession();
		String hql="select count(a.id) from HourseVO as a,BuildingsVO as b where buildings_id=b.id and agency_id=:id";
		Query query=session.createQuery(hql);
		query.setParameter("id",agencyId);
		return Integer.valueOf(query.list().get(0).toString());
	}
	
	@Override
	public PageByEasyUi<HourseVO> pageByid(PageByEasyUi<HourseVO> page, String agencyId, String buildsName) {
		Session session=sessionFactory.getCurrentSession();
		String hql="select a from HourseVO as a,BuildingsVO as b where buildings_id=b.id and agency_id=:id and b.name like:name";
		Query query=session.createQuery(hql);
		query.setParameter("id",agencyId);
		query.setParameter("name", "%"+buildsName+"%");
		query.setFirstResult(page.getBeginIndex());
		query.setMaxResults(page.getPageSize());
		List<HourseVO> list = query.list();
		page.setRows(list);
		page.setTotal(countByAgencyIdAndBuildsName(agencyId,buildsName));
		return page;
	}
	public int countByAgencyIdAndBuildsName(String agencyId,String buildsName){
		Session session=sessionFactory.getCurrentSession();
		String hql="select count(a.id) from HourseVO as a,BuildingsVO as b where buildings_id=b.id and agency_id=:id and b.name like:name";
		Query query=session.createQuery(hql);
		query.setParameter("id",agencyId);
		query.setParameter("name", "%"+buildsName+"%");
		return Integer.valueOf(query.list().get(0).toString());
	}
	
	@Override
	public void inOractive(HourseVO houseVO) {
		Session session = sessionFactory.getCurrentSession();
		String sql = " update t_hourse set h_status='"+houseVO.getStatus()+"' where id='"+houseVO.getId()+"'";
		session.createSQLQuery(sql).executeUpdate();
	}

	@Override
	public void modifyHouseImg(HourseVO houseVO) {
		Session session = sessionFactory.getCurrentSession();
		String sql = "update t_hourse set logo='"+houseVO.getLogo()+"' where id='"+houseVO.getId()+"'";
		session.createSQLQuery(sql).executeUpdate();
	}

	
	@Override
	public int getCountByHouseName(String houseName) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "select count(id) from HourseVO where name like:houseName";
		Query query = session.createQuery(hql);
		query.setParameter("houseName","%"+houseName+"%");
		List<HourseVO> list = query.list();
		return list.size();
	}

	@Override
	public PageByEasyUi<HourseVO> queryByPageByHouseName(PageByEasyUi<HourseVO> page, String houseName) {
		Session session = sessionFactory.getCurrentSession();
		String hql="from HourseVO where name like:houseName";
		Query query = session.createQuery(hql);
		query.setParameter("houseName","%"+houseName+"%");
		query.setFirstResult(page.getBeginIndex());
		query.setMaxResults(page.getPageSize());
		List<HourseVO> list = query.list();
		page.setRows(list);
		return page;
	}

	@Override	//用户查看户型(按时间排序，前五个)
	public List<HourseVO> queryListByTime() {
		Session session = sessionFactory.getCurrentSession();
		String hql="from HourseVO order by created_time desc";
		Query query = session.createQuery(hql);
		query.setFirstResult(0);
		query.setMaxResults(5);
		List<HourseVO> list = query.list();
		return list;
	}

	@Override
	public List<HourseVO> houseByarea() {
		Session session=sessionFactory.getCurrentSession();
		Query query=session.createQuery("from HourseVO order by area desc");
		query.setFirstResult(0);
		query.setMaxResults(6);
		return query.list();
	}

	@Override
	public boolean isExistHouseName(String houseName,String buildsid) {
		Session session = sessionFactory.getCurrentSession();
		String sql = "select t_name from t_hourse where t_name='"+houseName+"' and buildings_id=(select id from t_buildings where id='"+buildsid+"');";
		Query query = session.createNativeQuery(sql);
		if(query.list().size()>0){
			return true;
		}else{
			return false;
		}
	}

}
