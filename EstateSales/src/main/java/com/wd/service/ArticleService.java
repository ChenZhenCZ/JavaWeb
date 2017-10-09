package com.wd.service;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.wd.bean.ArticleVO;
import com.wd.common.PageByEasyUi;

public interface ArticleService extends BaseService<String,ArticleVO>{
	public void save(ArticleVO t,String fileName,HttpServletRequest request,File logo);
	public void updateStatus(ArticleVO article);
	public List<ArticleVO> listOrderBy();
	
	//用户查看所有的文章(资讯)类型
	public PageByEasyUi<ArticleVO> queryByAllPage(PageByEasyUi<ArticleVO> page);
	//文章类型全部记录条数
	public int allCount();
	//用户查看所有的文章(资讯)类型按文章标题搜索
	public PageByEasyUi<ArticleVO> queryByPageByArticleTitle(PageByEasyUi<ArticleVO> page,String articleTile);
	public int getCountByArticleTitle(String articleTile);
	public List<ArticleVO>articleByTime();
}
