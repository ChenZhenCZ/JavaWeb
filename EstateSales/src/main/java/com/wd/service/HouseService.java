package com.wd.service;

import java.io.File;
import java.util.List;

import com.wd.bean.ActivityVO;
import com.wd.bean.BuildingsVO;
import com.wd.bean.HourseVO;
import com.wd.common.PageByEasyUi;

public interface HouseService extends BaseService<String,HourseVO> {
	//初始化新增户型页面的楼盘下拉框
	public List<BuildingsVO> buildList(String agencyId);
	//新增户型
	public void save(HourseVO hourseVO,String imgName,File imgContent);
	//获取保存进数据库的图片路径
	public String getImgUrl(String imgName,File imgContent);
	//户型分页
	public PageByEasyUi<HourseVO> pageByid(PageByEasyUi<HourseVO> page, String agencyId);
	//户型冻结或激活
	public void inOractive(HourseVO houseVO);
	//修改户型图片
	public void modifyHouseImg(String houseId,String imgName,File imgContent);
	//通过查询条件查询户型
	public PageByEasyUi<HourseVO> pageByid(PageByEasyUi<HourseVO> page, String agencyId,String buildsName);
	
	//用户搜索户型分页 统计条数
	public int getCountByHouseName(String houseName);
	//用户搜索户型分页
	public PageByEasyUi<HourseVO> queryByPageByHouseName( PageByEasyUi<HourseVO> page,String houseName);
	public List<HourseVO>houseByarea();
	//用户查看户型(按时间排序，前五个)
	public List<HourseVO> queryListByTime();
	//判断该户型有没有被添加
	public boolean isExistHouseName(String houseName,String buildsid);
}
