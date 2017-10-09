package com.wd.dao.imp;

import java.math.BigInteger;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import com.wd.bean.ActivityVO;
import com.wd.bean.BuildingVO;
import com.wd.bean.BuildingsVO;
import com.wd.bean.EmployeeVO;
import com.wd.common.PageByEasyUi;
import com.wd.dao.BuildingDao;

public class BuildingDaoImp implements BuildingDao{

	private SessionFactory sessionFactory;
	
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	@Override
	public BuildingVO queryById(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void saveOrUpdate(BuildingVO t) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(t);
	}

	@Override
	public void del(BuildingVO t) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public PageByEasyUi<BuildingVO> queryByPage(PageByEasyUi<BuildingVO> page) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int count() {
		Session session=sessionFactory.getCurrentSession();
		String sql="select count(*) from t_building";
		Query query=session.createNativeQuery(sql);
		List list=query.list();
		BigInteger cnt=(BigInteger)list.get(0);
		return cnt.intValue();
	}

	@Override
	public BuildingVO login(BuildingVO t) {
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
	public PageByEasyUi<BuildingVO> pageByid(PageByEasyUi<BuildingVO> page, String agencyId) {
		Session session=sessionFactory.getCurrentSession();
		String hql="select a from BuildingVO as a,BuildingsVO as b where buildings_id=b.id and agency_id=:id";
		Query query=session.createQuery(hql);
		query.setParameter("id",agencyId);
		query.setFirstResult(page.getBeginIndex());
		query.setMaxResults(page.getPageSize());
		List<BuildingVO> list = query.list();
		page.setRows(list);
		page.setTotal(countByAgencyId(agencyId));
		return page;
	}
	//通过经销商Id统计记录条数
	public int countByAgencyId(String agencyId){
		Session session=sessionFactory.getCurrentSession();
		String hql="select count(a.id) from BuildingVO as a,BuildingsVO as b where buildings_id=b.id and agency_id=:id";
		Query query=session.createQuery(hql);
		query.setParameter("id",agencyId);
		return Integer.valueOf(query.list().get(0).toString());
	}
	
	@Override
	public PageByEasyUi<BuildingVO> pageByid(PageByEasyUi<BuildingVO> page, String agencyId, String buildingsName) {
		Session session=sessionFactory.getCurrentSession();
		String hql="select a from BuildingVO as a,BuildingsVO as b where buildings_id=b.id and agency_id=:id and b.name like:name";
		Query query=session.createQuery(hql);
		query.setParameter("id",agencyId);
		query.setParameter("name","%"+buildingsName+"%");
		query.setFirstResult(page.getBeginIndex());
		query.setMaxResults(page.getPageSize());
		List<BuildingVO> list = query.list();
		page.setRows(list);
		page.setTotal(countByAgencyIdAndBuildsName(agencyId,buildingsName));
		return page;
	}
	//通过经销商Id和楼盘名称统计记录条数
	public int countByAgencyIdAndBuildsName(String agencyId,String buildingsName){
		Session session=sessionFactory.getCurrentSession();
		String hql="select count(a.id) from BuildingVO as a,BuildingsVO as b where buildings_id=b.id and agency_id=:id and b.name like:name";
		Query query=session.createQuery(hql);
		query.setParameter("id",agencyId);
		query.setParameter("name","%"+buildingsName+"%");
		return Integer.valueOf(query.list().get(0).toString());
	}

	@Override
	public void inOractive(BuildingVO buildingVO) {
		Session session = sessionFactory.getCurrentSession();
		String sql = "update t_building set b_status='"+buildingVO.getStatus()+"' where id='"+buildingVO.getId()+"'";
		session.createSQLQuery(sql).executeUpdate();
	}

	

	@Override
	public PageByEasyUi<BuildingVO> pageempid(PageByEasyUi<BuildingVO> page, String id) {
		Session session=sessionFactory.getCurrentSession();
		String hql="select a from BuildingVO as a,BuildingsVO as b where buildings_id=b.id and buildings_id=:id";
		Query query=session.createQuery(hql);
		query.setParameter("id",id);
		query.setFirstResult(page.getBeginIndex());
		query.setMaxResults(page.getPageSize());
		List<BuildingVO> list = query.list();
		page.setRows(list);
		page.setTotal(countByEmpId(id));
		return page;
	}

	@Override
	public PageByEasyUi<BuildingVO> pageempid(PageByEasyUi<BuildingVO> page, String id, String buildingsName) {
		Session session=sessionFactory.getCurrentSession();
		String hql="select a from BuildingVO as a,BuildingsVO as b where buildings_id=b.id and buildings_id=:id and b.name like:name";
		Query query=session.createQuery(hql);
		query.setParameter("id",id);
		query.setParameter("name","%"+buildingsName+"%");
		query.setFirstResult(page.getBeginIndex());
		query.setMaxResults(page.getPageSize());
		List<BuildingVO> list = query.list();
		page.setRows(list);
		page.setTotal(countByEmpNameId(id,buildingsName));
		return page;
	}

	@Override//员工查询楼栋记录条数
	public int countByEmpId(String id) {
		Session session=sessionFactory.getCurrentSession();
		String hql="select count(a.id) from BuildingVO as a,BuildingsVO as b where buildings_id=b.id and buildings_id=:id";
		Query query=session.createQuery(hql);
		query.setParameter("id",id);
		return Integer.valueOf(query.list().get(0).toString());
	}

	@Override//员工通过条件查询楼栋记录条数
	public int countByEmpNameId(String id, String name) {
		Session session=sessionFactory.getCurrentSession();
		String hql="select count(a.id) from BuildingVO as a,BuildingsVO as b where buildings_id=b.id and buildings_id=:id and b.name like:name";
		Query query=session.createQuery(hql);
		query.setParameter("id",id);
		query.setParameter("name","%"+name+"%");
		return Integer.valueOf(query.list().get(0).toString());
	}
}
