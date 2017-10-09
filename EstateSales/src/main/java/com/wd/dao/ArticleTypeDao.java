package com.wd.dao;

import java.util.List;

import com.wd.bean.ArticleTypeVO;

public interface ArticleTypeDao extends BaseDao<String,ArticleTypeVO>{
	public List<ArticleTypeVO>list();
}
