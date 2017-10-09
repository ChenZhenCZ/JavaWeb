package com.wd.service;

import java.io.File;
import java.util.List;

import com.wd.bean.BuildingsVO;
import com.wd.bean.CommentVO;
import com.wd.bean.FindObject;
import com.wd.common.PageByEasyUi;
import com.wd.dao.BaseDao;

public interface BuildingsService extends BaseDao<String,BuildingsVO> {

	//保存楼栋图片地址
	public String saveBuildUrl(String logoFileName,File logo);
	//楼盘冻结或修改
	public void inOractive(BuildingsVO buildingsVo);
	//批量上传楼盘图片
	public void batchUploadImg(String buildId,String[] batchImgFileName,File[] batchImg);
	//获取保存进数据库的图片路径
	public String getImgUrl(String imgName,File imgContent);
	//经销商修改楼盘图片
	public void agencyModifyImg(String buildsId,String agnecyModifyImgFileName,File agnecyModifyImg);
	
	public List<String> buildsMapList();
	public PageByEasyUi<BuildingsVO> pageByAgency(PageByEasyUi<BuildingsVO>page,String id);
	//查看楼盘详情
	public BuildingsVO lookBuildsDetail(String buildingsId);
	public List buildsListMap(String id);
	public List buildsListByagency(String agencyId);
	public List buildsListByTime();
	public List<BuildingsVO> pageBysql(FindObject find,int startPos,int pageSize);
	public List<BuildingsVO> buildsListByactivity();
	public List<BuildingsVO> buildsBySaleTIme();
	public List<Object[]> buildsAvgPrice();
	public List<BuildingsVO>hotBuilds();
}
