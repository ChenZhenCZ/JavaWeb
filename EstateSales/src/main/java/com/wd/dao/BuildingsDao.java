package com.wd.dao;

import java.io.File;
import java.util.List;

import com.wd.bean.BuildingsImgVO;
import com.wd.bean.BuildingsVO;
import com.wd.bean.FindObject;
import com.wd.common.PageByEasyUi;

public interface BuildingsDao extends BaseDao<String, BuildingsVO>{
	
	//保存楼栋图片地址
	public String saveBuildUrl(String logoFileName,File logo);
	//楼盘冻结或修改
	public void inOractive(BuildingsVO buildingsVo);
	//批量上传楼盘图片
	public void batchUploadImg(BuildingsImgVO buildingsImgVO);
	//修改楼盘图片
	public void agencyModifyImg(BuildingsVO buildingsVo);
	
	public List<String> buildsMapList();
	public PageByEasyUi<BuildingsVO> pageByAgency(PageByEasyUi<BuildingsVO>page,String id);
	public int countByAgency(String id);
	//查看楼盘详情
	public BuildingsVO lookBuildsDetail(String buildingsId);
	public List buildsListMap(String id);
	public List buildsListByagency(String agencyId);
	public List buildsListByTime();
	public List<BuildingsVO> pageBysql(FindObject find, int startPos, int pageSize);
	public List<BuildingsVO> buildsListByactivity();
	public List<BuildingsVO> buildsBySaleTime();
	public List<Object[]> buildsAvgPrice();
	public List<BuildingsVO>hotBuilds();
}
