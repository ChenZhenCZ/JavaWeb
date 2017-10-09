package com.wd.dao;

import com.wd.bean.LikeVO;
import com.wd.common.PageByEasyUi;

public interface LikeDao extends BaseDao<String,LikeVO>{
	//用户点赞记录
	public PageByEasyUi<LikeVO> pageByUserid(PageByEasyUi<LikeVO> page, String userid);
	//获取点赞个数
	public int countUserid(String id);
	public boolean isLike(String buildId,String userId);
}
