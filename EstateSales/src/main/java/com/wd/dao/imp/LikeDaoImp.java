package com.wd.dao.imp;

import java.math.BigInteger;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import com.wd.bean.LikeVO;
import com.wd.common.PageByEasyUi;
import com.wd.dao.LikeDao;

public class LikeDaoImp implements LikeDao{
	
	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	@Override
	public LikeVO queryById(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void saveOrUpdate(LikeVO t) {
		Session session = sessionFactory.getCurrentSession();
		session.save(t);
	}
	@Override
	public PageByEasyUi<LikeVO> queryByPage(PageByEasyUi<LikeVO> page) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int count() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public LikeVO login(LikeVO t) {
		// TODO Auto-generated method stub
		return null;
	}
	//用户点赞记录
	@Override
	public PageByEasyUi<LikeVO> pageByUserid(PageByEasyUi<LikeVO> page, String userid) {
		Session session = sessionFactory.getCurrentSession();
		String hql=" from LikeVO where user_id=:id order by created_time desc";
		System.out.println(hql);
		Query query = session.createQuery(hql);
		query.setParameter("id", userid);
		query.setFirstResult(page.getBeginIndex());
		query.setMaxResults(page.getPageSize());
		List<LikeVO> list = query.list();
		page.setRows(list);
		page.setTotal(countUserid(userid));
		return page;
	}
	//用户点赞个数
	@Override
	public int countUserid(String id) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createNativeQuery("select count(id) from t_like  where user_id='"+id+"'");
		BigInteger cnt = (BigInteger) query.uniqueResult();
		return cnt.intValue();
	}
	//用户点赞的删除
	@Override
	public void del(LikeVO t) {
		Session session = sessionFactory.getCurrentSession();
		if(t.getBuildings_id()==null||t.getBuildings_id().equals("")){
			session.delete(t);
		}else{
			Query query=session.createQuery("delete LikeVO where user_id=:userid and buildings_id=:bid");		
			query.setParameter("userid",t.getUser().getId());
			query.setParameter("bid",t.getBuildings().getId());
			query.executeUpdate();
		}
		
	}
	@Override
	public boolean isLike(String buildId, String userId) {
		Session session=sessionFactory.getCurrentSession();
		Query query=session.createQuery("from LikeVO where buildings_id=:buildId and user_id=:userid");
		query.setParameter("buildId",buildId);
		query.setParameter("userid",userId);
		if(query.uniqueResult()==null){
			return false;
		}else{
			return true;
		}
	}
}
