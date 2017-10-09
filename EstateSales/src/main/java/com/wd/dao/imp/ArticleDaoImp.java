package com.wd.dao.imp;

import java.math.BigInteger;
import java.util.List;

import org.hibernate.query.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.wd.bean.ArticleTypeVO;
import com.wd.bean.ArticleVO;
import com.wd.common.PageByEasyUi;
import com.wd.dao.ArticleDao;

public class ArticleDaoImp implements ArticleDao{
	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	@Override
	public ArticleVO queryById(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void saveOrUpdate(ArticleVO t) {
		Session session=sessionFactory.getCurrentSession();
		session.saveOrUpdate(t);
	}

	@Override
	public void del(ArticleVO t) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public PageByEasyUi<ArticleVO> queryByPage(PageByEasyUi<ArticleVO> page) {
		Session session=sessionFactory.getCurrentSession();
		Query query=session.createQuery("from ArticleVO order by created_time desc");
		query.setFirstResult(page.getBeginIndex());
		query.setMaxResults(page.getPageSize());
		List<ArticleVO>list=query.list();
		page.setRows(list);
		page.setTotal(count());
		return page;
	}

	@Override
	public int count() {
		Session session=sessionFactory.getCurrentSession();
		String sql="select count(id) from t_article";
		Query query=session.createNativeQuery(sql);
		List list=query.list();
		BigInteger cnt=(BigInteger)list.get(0);
		return cnt.intValue();
	}

	@Override
	public ArticleVO login(ArticleVO t) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public void updateStatus(ArticleVO article) {
		Session session=sessionFactory.getCurrentSession();
		String sql="update t_article set msg_status='"+article.getMsg_status()+"' where id='"+article.getId()+"'";
		session.createNativeQuery(sql).executeUpdate();
	}
	@Override
	public List<ArticleVO> listOrderBy() {
		Session session=sessionFactory.getCurrentSession();
		String hql="from ArticleVO order by created_time desc,orderBy";
		Query query=session.createQuery(hql);
		query.setFirstResult(1);
		query.setMaxResults(10);
		return query.list();
	}
	@Override
	public PageByEasyUi<ArticleVO> queryByAllPage(PageByEasyUi<ArticleVO> page) {
		Session session = sessionFactory.getCurrentSession();
		String hql="from ArticleVO order by created_time desc";
		Query query = session.createQuery(hql);
		query.setFirstResult(page.getBeginIndex());
		query.setMaxResults(page.getPageSize());
		page.setRows(query.list());
		return page;
	}
	@Override
	public int allCount() {
		Session session = sessionFactory.getCurrentSession();
		String sql="select count(*) from t_article order by created_time desc";
		Query query = session.createNativeQuery(sql);
		BigInteger cnt = (BigInteger) query.uniqueResult();
		return cnt.intValue();
	}
	@Override
	public PageByEasyUi<ArticleVO> queryByPageByArticleTitle(PageByEasyUi<ArticleVO> page, String articleTile) {
		Session session = sessionFactory.getCurrentSession();
		String hql="from ArticleVO where title like:title order by created_time desc";
		Query query = session.createQuery(hql);
		query.setParameter("title","%"+articleTile+"%");
		query.setFirstResult(page.getBeginIndex());
		query.setMaxResults(page.getPageSize());
		page.setRows(query.list());
		return page;
	}
	@Override
	public int getCountByArticleTitle(String articleTile) {
		Session session = sessionFactory.getCurrentSession();
		String sql="select count(*) from t_article where title like'%"+articleTile+"%' order by created_time desc";
		Query query = session.createNativeQuery(sql);
		BigInteger cnt = (BigInteger) query.uniqueResult();
		return cnt.intValue();
	}
	@Override
	public List<ArticleVO> articleByTime() {
		Session session=sessionFactory.getCurrentSession();
		Query query=session.createQuery("from ArticleVO order by created_time desc");
		query.setFirstResult(0);
		query.setMaxResults(10);
		return query.list();
	}
}
