package com.wd.dao;

import java.util.List;

import com.wd.bean.CommentVO;

import com.wd.common.PageByEasyUi;

public interface CommentDao extends BaseDao<String,CommentVO>{
	public void list(CommentVO comment);
	//历史记录分页
	public PageByEasyUi<CommentVO> pageByUserid(PageByEasyUi<CommentVO> page, String userid);
	public int countByid(String id);
	//经销商评价分页
	public PageByEasyUi<CommentVO> pageByAgencyId(PageByEasyUi<CommentVO> page, String agencyId);
	//经销商通过楼盘查找评价并分页
	public PageByEasyUi<CommentVO> pageByAgencyId(PageByEasyUi<CommentVO> page, String agencyId,String buildsName);
	public List<CommentVO> pageBysql(String buildingsid, int startPos, int pageSize);
	public int getCount(String hql);
}
