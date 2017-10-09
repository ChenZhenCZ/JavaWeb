package com.wd.service;

import java.util.List;

import com.wd.bean.ArticleTypeVO;

public interface ArticleTypeService extends BaseService<String,ArticleTypeVO>{
	public List<ArticleTypeVO>articleTypeList();
}
