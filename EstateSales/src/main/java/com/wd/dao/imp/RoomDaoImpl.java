package com.wd.dao.imp;

import java.math.BigInteger;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.engine.transaction.jta.platform.internal.SynchronizationRegistryBasedSynchronizationStrategy;
import org.hibernate.query.Query;

import com.wd.bean.AddRoomVO;
import com.wd.bean.BuildingVO;
import com.wd.bean.HourseVO;
import com.wd.bean.RoomVO;
import com.wd.common.PageByEasyUi;
import com.wd.dao.RoomDao;

public class RoomDaoImpl implements RoomDao {

	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}


	@Override
	public RoomVO queryById(String name) {
		Session session=sessionFactory.getCurrentSession();
		Query query=session.createQuery("from RoomVO where name=:name");
		query.setParameter("name",name);
		return (RoomVO)query.uniqueResult();
	}

	@Override
	public void saveOrUpdate(RoomVO t) {
		// TODO Auto-generated method stub

	}

	@Override
	public void del(RoomVO t) {
		// TODO Auto-generated method stub

	}

	@Override
	public PageByEasyUi<RoomVO> queryByPage(PageByEasyUi<RoomVO> page) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int count() {
		Session session=sessionFactory.getCurrentSession();
		String sql="select count(id) from t_room";
		Query query=session.createNativeQuery(sql);
		List list=query.list();
		BigInteger cnt=(BigInteger)list.get(0);
		return cnt.intValue();
	}

	@Override
	public RoomVO login(RoomVO t) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public BuildingVO buildingInfo(String buildingId) {
		Session session = sessionFactory.getCurrentSession();
		Query<BuildingVO> query = session.createQuery("from BuildingVO where id='"+buildingId+"'");
		List<BuildingVO> list = query.list();
		BuildingVO buildingVO = list.get(0);
		return buildingVO;
	}

	@Override
	public List<HourseVO> houseList(String buildingsId) {
		Session session = sessionFactory.getCurrentSession();
		Query<HourseVO> query = session.createQuery("from HourseVO where buildings_id='"+buildingsId+"'");
		return query.getResultList();
	}
	@Override
	public void saveRooms(RoomVO roomVO) {
		Session session = sessionFactory.getCurrentSession();
		session.clear();
		session.save(roomVO);
	}


	@Override
	public boolean isExistRoom(AddRoomVO addRoomVO) {
		String roomNumber = addRoomVO.getBuildingName()+"1"+addRoomVO.getHouseNumber();
		System.out.println("已存在房号："+roomNumber);
		Session session  = sessionFactory.getCurrentSession();
		String sql = "select * from t_room where building_id='"+addRoomVO.getBuildingId()+"' and t_name='"+roomNumber+"'";
		Query<RoomVO> query = session.createSQLQuery(sql);
		List<RoomVO> list = query.list();
		if(list.size()>0){
			return true;
		}else{
			return false;
		}
	}


	@Override
	public PageByEasyUi<RoomVO> pageByid(PageByEasyUi<RoomVO> page, String buildingId) {
		Session session=sessionFactory.getCurrentSession();
		String hql="from RoomVO where building_id=:id";
		Query query=session.createQuery(hql);
		query.setParameter("id",buildingId);
		query.setFirstResult(page.getBeginIndex());
		query.setMaxResults(page.getPageSize());
		List<RoomVO> list = query.list();
		page.setRows(list);
		page.setTotal(count());
		return page;
	}
	@Override
	public void modifyRoomStatus(RoomVO roomVO) {
		Session session = sessionFactory.getCurrentSession();
		String sql ="update t_room set sale_status='"+roomVO.getSale_status()+"' where id='"+roomVO.getId()+"'";
		session.createNativeQuery(sql).executeUpdate();
	}
	@Override//经销商房屋销售报表
	public int empcount(String name,String id) {
		Session session=sessionFactory.getCurrentSession();
		String sql="select count(r.id) from t_room as r,t_building as b,t_buildings as t where r.sale_status='"+name+"' "
				+ "and r.building_id=b.id and b.buildings_id=t.id and t.agency_id='"+id+"'";
		Query query=session.createNativeQuery(sql);
		List list=query.list();
		BigInteger cnt=(BigInteger)list.get(0);
		return cnt.intValue();
	}
	@Override
	public int count(String name, String id) {
		Session session=sessionFactory.getCurrentSession();
		String sql="select count(r.id) from t_room as r,t_building as b where sale_status='"+name+"' and r.building_id=b.id and b.buildings_id='"+id+"'";
		Query query=session.createNativeQuery(sql);
		List list=query.list();
		BigInteger cnt=(BigInteger)list.get(0);
		return cnt.intValue();
	}
	@Override
	public RoomVO empRoom(String name, String id) {
		
		Session session=sessionFactory.getCurrentSession();
		Query query=session.createQuery("select r from RoomVO as r ,BuildingVO as b where r.name=:rname and building_id=b.id and buildings_id=:bid");
		query.setParameter("rname",name);
		query.setParameter("bid",id);
		return (RoomVO)query.uniqueResult();
	}
	@Override//户型
	public int allcount(String status, String name) {
		Session session=sessionFactory.getCurrentSession();
		String sql="select * from t_room as r,t_hourse as h where r.sale_status='"+status+"' and h.t_name='"+name+"'";
		Query query=session.createNativeQuery(sql);
		List list=query.list();
		BigInteger cnt=(BigInteger)list.get(0);
		return cnt.intValue();
	}
	
}
