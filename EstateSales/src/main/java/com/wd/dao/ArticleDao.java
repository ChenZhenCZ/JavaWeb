package com.wd.dao;

import java.util.List;

import com.wd.bean.ArticleVO;
import com.wd.common.PageByEasyUi;

public interface ArticleDao extends BaseDao<String,ArticleVO>{
	public void updateStatus(ArticleVO article);
	public List<ArticleVO> listOrderBy();
	//用户查看所有的文章(资讯)类型
	public PageByEasyUi<ArticleVO> queryByAllPage(PageByEasyUi<ArticleVO> page);
	//文章类型全部记录条数
	public int allCount();
	public PageByEasyUi<ArticleVO> queryByPageByArticleTitle(PageByEasyUi<ArticleVO> page,String articleTile);
	public int getCountByArticleTitle(String articleTile);
	public List<ArticleVO>articleByTime();
}
