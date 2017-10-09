package com.wd.service.imp;


import com.wd.bean.LikeVO;
import com.wd.common.PageByEasyUi;
import com.wd.dao.LikeDao;
import com.wd.service.LikeService;

public class LikeServiceImp implements LikeService{
	private LikeDao likeDao;
	public void setLikeDao(LikeDao likeDao) {
		this.likeDao = likeDao;
	}
	@Override
	public LikeVO queryById(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void saveOrUpdate(LikeVO t) {
		likeDao.saveOrUpdate(t);
	}

	
	@Override
	public PageByEasyUi<LikeVO> queryByPage(PageByEasyUi<LikeVO> page) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int count() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public LikeVO login(LikeVO t) {
		// TODO Auto-generated method stub
		return null;
	}
	//用户点赞记录
	@Override
	public PageByEasyUi<LikeVO> pageByUserid(PageByEasyUi<LikeVO> page, String userid) {
		return likeDao.pageByUserid(page, userid);
	}
	//用户点赞的删除
	@Override
	public void del(LikeVO t) {
		likeDao.del(t);	
	}
	@Override
	public boolean isLike(String buildId, String userId) {
		return likeDao.isLike(buildId, userId);
	}

}
