package com.wd.service.imp;

import java.util.List;

import com.wd.bean.ArticleTypeVO;
import com.wd.common.PageByEasyUi;
import com.wd.dao.ArticleTypeDao;
import com.wd.service.ArticleTypeService;

public class ArticleTypeServiceImp implements ArticleTypeService{
	private ArticleTypeDao articleTypeDao;
	@Override
	public ArticleTypeVO queryById(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void saveOrUpdate(ArticleTypeVO t) {
		articleTypeDao.saveOrUpdate(t);
	}

	@Override
	public void del(ArticleTypeVO t) {
		articleTypeDao.del(t);
	}

	@Override
	public PageByEasyUi<ArticleTypeVO> queryByPage(PageByEasyUi<ArticleTypeVO> page) {
		page=articleTypeDao.queryByPage(page);
		return page;
	}

	@Override
	public int count() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArticleTypeVO login(ArticleTypeVO t) {
		// TODO Auto-generated method stub
		return null;
	}

	public void setArticleTypeDao(ArticleTypeDao articleTypeDao) {
		this.articleTypeDao = articleTypeDao;
	}

	@Override
	public List<ArticleTypeVO> articleTypeList() {
		List<ArticleTypeVO>list=articleTypeDao.list();
		return list;
	}
}
