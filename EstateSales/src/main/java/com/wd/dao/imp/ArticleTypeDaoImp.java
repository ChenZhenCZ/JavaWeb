package com.wd.dao.imp;

import java.math.BigInteger;
import java.util.List;

import org.hibernate.query.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.wd.bean.ArticleTypeVO;
import com.wd.common.PageByEasyUi;
import com.wd.dao.ArticleTypeDao;

public class ArticleTypeDaoImp implements ArticleTypeDao{
	private SessionFactory sessionFactory;
	@Override
	public ArticleTypeVO queryById(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void saveOrUpdate(ArticleTypeVO t) {
		Session session=sessionFactory.getCurrentSession();
		session.saveOrUpdate(t);
	}

	@Override
	public void del(ArticleTypeVO t) {
		Session session=sessionFactory.getCurrentSession();
		session.delete(t);
	}

	@Override
	public PageByEasyUi<ArticleTypeVO> queryByPage(PageByEasyUi<ArticleTypeVO> page) {
		Session session=sessionFactory.getCurrentSession();
		Query query=session.createQuery("from ArticleTypeVO");
		query.setFirstResult(page.getBeginIndex());
		query.setMaxResults(page.getPageSize());
		List<ArticleTypeVO>list=query.list();
		page.setRows(list);
		page.setTotal(count());
		return page;
	}

	@Override
	public int count() {
		Session session=sessionFactory.getCurrentSession();
		String sql="select count(*) from t_article_type";
		Query query=session.createNativeQuery(sql);
		BigInteger cnt=(BigInteger)query.uniqueResult();
		return cnt.intValue();
	}

	@Override
	public ArticleTypeVO login(ArticleTypeVO t) {
		// TODO Auto-generated method stub
		return null;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public List<ArticleTypeVO> list() {
		Session session=sessionFactory.getCurrentSession();
		List<ArticleTypeVO>list=session.createQuery("from ArticleTypeVO").list();
		return list;
	}
}
