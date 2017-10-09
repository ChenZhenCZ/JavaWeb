package com.wd.dao.imp;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import com.wd.bean.BuildingsVO;
import com.wd.bean.CommentVO;
import com.wd.common.PageByEasyUi;
import com.wd.dao.CommentDao;
import com.wd.service.CommentService;

import zzz.ht.bean.ManagerVo;

public class CommentDaoImp implements CommentDao{
	private SessionFactory sessionFactory;
	private CommentVO comment;
	public CommentVO getComment() {
		return comment;
	}

	public void setComment(CommentVO comment) {
		this.comment = comment;
	}

	public void setCommentService(CommentService commentService) {
		this.commentService = commentService;
	}

	private CommentService commentService;
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
		@Override
		public CommentVO queryById(String id) {
			// TODO Auto-generated method stub
			return null;
		}
	@Override
	public CommentVO login(CommentVO t) {
		// TODO Auto-generated method stub
		return null;
	}

	//添加评论
	@Override
	public void saveOrUpdate(CommentVO t) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(t);
	}
	//删除评论
	@Override
	public void del(CommentVO t) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(t);
	}
	//通过分页查询评论
	@Override
	public PageByEasyUi<CommentVO> queryByPage(PageByEasyUi<CommentVO> page) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from CommentVO");
		query.setFirstResult(page.getBeginIndex());
		query.setMaxResults(page.getPageSize());
		List<CommentVO> list = query.list();
		page.setRows(list);
		page.setTotal(count());
		return page;
	}
	//统计评论条数
	@Override
	public int count() {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createNativeQuery("select count(id) from t_comment");
		BigInteger cnt = (BigInteger) query.uniqueResult();
		return cnt.intValue();
	}
	//评论列表
	@Override
	public void list(CommentVO comment) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from CommentVO");
	}
	//用户评论
	@Override
	public PageByEasyUi<CommentVO> pageByUserid(PageByEasyUi<CommentVO> page, String userid) {
		Session session = sessionFactory.getCurrentSession();
		String hql=" from CommentVO  where user_id=:id order by comment_time desc";
		Query query = session.createQuery(hql);
		query.setParameter("id", userid);
		query.setFirstResult(page.getBeginIndex());
		query.setMaxResults(page.getPageSize());
		List<CommentVO> list = query.list();
		page.setRows(list);
		page.setTotal(countByid(userid));
		return page;
	}
	@Override
	public int countByid(String id) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createNativeQuery("select count(id) from t_comment where user_id='"+id+"'");
		BigInteger cnt = (BigInteger) query.uniqueResult();
		return cnt.intValue();
	}
	
	@Override
	public PageByEasyUi<CommentVO> pageByAgencyId(PageByEasyUi<CommentVO> page, String agencyId) {
		Session session = sessionFactory.getCurrentSession();
		String hql="select a from CommentVO as a,BuildingsVO as b where buildings_id=b.id and agency_id=:id";
		Query query = session.createQuery(hql);
		query.setParameter("id", agencyId);
		query.setFirstResult(page.getBeginIndex());
		query.setMaxResults(page.getPageSize());
		List<CommentVO> list = query.list();
		page.setRows(list);
		page.setTotal(countByAgencyId(agencyId));
		return page;
	}
	public int countByAgencyId(String agencyId) {	
		Session session = sessionFactory.getCurrentSession();
		String sql ="select count(*) from t_comment  as c,t_buildings as b where c.buildings_id=b.id and b.agency_id='"+agencyId+"'";
		Query query = session.createNativeQuery(sql);
		BigInteger cnt = (BigInteger) query.uniqueResult();
		return cnt.intValue();
	}

	@Override
	public PageByEasyUi<CommentVO> pageByAgencyId(PageByEasyUi<CommentVO> page, String agencyId, String buildsName) {
		Session session = sessionFactory.getCurrentSession();
		String hql="select a from CommentVO as a,BuildingsVO as b where buildings_id=b.id and agency_id=:id and b.name like:name";
		Query query = session.createQuery(hql);
		query.setParameter("id", agencyId);
		query.setParameter("name", "%"+buildsName+"%");
		query.setFirstResult(page.getBeginIndex());
		query.setMaxResults(page.getPageSize());
		List<CommentVO> list = query.list();
		page.setRows(list);
		page.setTotal(countByAgencyIdAndBuildsName(agencyId,buildsName));
		return page;
	}
	//通过楼盘名称分页评价
	public int countByAgencyIdAndBuildsName(String agencyId,String buildsName){
		Session session = sessionFactory.getCurrentSession();
		String sql = "select count(*) from t_comment as c,t_buildings as b where c.buildings_id=b.id and b.agency_id='"+agencyId+"' and b.t_name like '%"+buildsName+"%'";
		System.out.println(sql);
		Query query = session.createNativeQuery(sql);
		BigInteger cnt = (BigInteger) query.uniqueResult();
		return cnt.intValue();
	}

	@Override
	public List<CommentVO> pageBysql(String buildingsid, int startPos, int pageSize) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "from CommentVO where buildings_id=:id order by comment_time desc";
		Query query = session.createQuery(hql);
		query.setParameter("id",buildingsid);
		query.setFirstResult(startPos);
		query.setMaxResults(pageSize);
		List<CommentVO> list = query.list();
		return list;
	}

	@Override
	public int getCount(String hql) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createNativeQuery(hql);
		BigInteger cnt = (BigInteger) query.uniqueResult();
		return cnt.intValue();
	}
}
