package com.wd.service;

import com.wd.bean.LikeVO;
import com.wd.common.PageByEasyUi;

public interface LikeService extends BaseService<String, LikeVO>{
	//用户点赞记录
	public PageByEasyUi<LikeVO> pageByUserid(PageByEasyUi<LikeVO> page, String userid);
	public boolean isLike(String buildId,String userId);
}
