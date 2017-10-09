package com.wd.service.imp;

import java.util.Date;
import java.util.List;

import com.wd.bean.CommentVO;
import com.wd.common.PageByEasyUi;
import com.wd.dao.CommentDao;
import com.wd.service.CommentService;

public class CommentServiceImp implements CommentService{
	private CommentDao commentDao;
	public CommentDao getCommentDao() {
		return commentDao;
	}
	public void setCommentDao(CommentDao commentDao) {
		this.commentDao = commentDao;
	}
	@Override
	public CommentVO queryById(String id) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public CommentVO login(CommentVO t) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public void saveOrUpdate(CommentVO t) {
		t.setComment_time(new Date());
		t.setContent(t.getContent().replaceAll("冰毒","**"));
		t.setContent(t.getContent().replaceAll("<","("));
		t.setContent(t.getContent().replaceAll(">",")"));
		commentDao.saveOrUpdate(t);
	}
	//删除评论
	@Override
	public void del(CommentVO t) {
		commentDao.del(t);		
	}
	//通过分页查询评论
	@Override
	public PageByEasyUi<CommentVO> queryByPage(PageByEasyUi<CommentVO> page) {
		// TODO Auto-generated method stub
		return null;
	}
	//统计评论条数
	@Override
	public int count() {
		
		return 0;
	}
	@Override
	public PageByEasyUi<CommentVO> pageByUserid(PageByEasyUi<CommentVO> page, String userid) {		
		return commentDao.pageByUserid(page, userid);
	}
	@Override
	public PageByEasyUi<CommentVO> pageByAgencyId(PageByEasyUi<CommentVO> page, String agencyId) {
		return commentDao.pageByAgencyId(page, agencyId);
	}
	@Override
	public PageByEasyUi<CommentVO> pageByAgencyId(PageByEasyUi<CommentVO> page, String agencyId, String buildsName) {
		return commentDao.pageByAgencyId(page, agencyId, buildsName);
	}
	@Override
	public List<CommentVO> pageBysql(String buildingsid, int startPos, int pageSize) {
		return commentDao.pageBysql(buildingsid, startPos, pageSize);
	}
	@Override
	public int getCount(String hql) {
		return commentDao.getCount(hql);
	}
	@Override
	public void list(CommentVO comment) {
		commentDao.list(comment);
	}
}
