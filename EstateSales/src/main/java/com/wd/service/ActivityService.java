package com.wd.service;

import java.io.File;
import java.util.List;

import com.wd.bean.ActivityVO;
import com.wd.bean.BuildingsVO;
import com.wd.common.PageByEasyUi;

public interface ActivityService extends BaseService<Integer,ActivityVO>{
	//保存活动图片地址
	public String saveActivityLogoUrl(String logoFileName,File logo);
	//初始化新增活动页面的楼盘下拉框
	public List<BuildingsVO> buildList(String agencyId);
	//活动冻结或激活
	public void inOractive(ActivityVO activityVO);
	//修改活动图片
	public void modifyActivityLogo(ActivityVO activityVO);
	//活动分页
	public PageByEasyUi<ActivityVO> pageByid(PageByEasyUi<ActivityVO> page, String id);
	
	//活动全部记录条数
	public int allCount();
	public PageByEasyUi<ActivityVO> queryByPageByArticleTitle(PageByEasyUi<ActivityVO> page,String activityTile);
	public int getCountByArticleTitle(String activityTile);
	//活动全部
	public PageByEasyUi<ActivityVO> allqueryByPage(PageByEasyUi<ActivityVO> page);
	
}
