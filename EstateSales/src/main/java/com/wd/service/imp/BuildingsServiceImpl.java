package com.wd.service.imp;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import com.wd.bean.BuildingsImgVO;
import com.wd.bean.BuildingsVO;
import com.wd.bean.FindObject;
import com.wd.common.PageByEasyUi;
import com.wd.dao.BuildingsDao;
import com.wd.service.BuildingsService;

public class BuildingsServiceImpl implements BuildingsService{

	private BuildingsDao buildindsDao;
	private BuildingsImgVO buildingsImgVO;
	
	public BuildingsDao getBuildindsDao() {
		return buildindsDao;
	}

	public void setBuildindsDao(BuildingsDao buildindsDao) {
		this.buildindsDao = buildindsDao;
	}

	@Override
	public BuildingsVO queryById(String id) {
		return buildindsDao.queryById(id);
	}

	@Override
	public void saveOrUpdate(BuildingsVO t) {
		buildindsDao.saveOrUpdate(t);
	}

	@Override
	public void del(BuildingsVO t) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public PageByEasyUi<BuildingsVO> queryByPage(PageByEasyUi<BuildingsVO> page) {
		return buildindsDao.queryByPage(page);
	}

	@Override
	public int count() {
		return buildindsDao.count();
	}

	@Override	//保存楼栋图片地址
	public String saveBuildUrl(String logoFileName, File logo) {
		return buildindsDao.saveBuildUrl(logoFileName, logo);
	}

	@Override	//冻结或激活楼盘
	public void inOractive(BuildingsVO buildingsVo) {
		buildindsDao.inOractive(buildingsVo);
	}

	@Override
	public void batchUploadImg(String buildId, String[] batchImgFileName, File[] batchImg) {
		buildingsImgVO = new BuildingsImgVO();
		BuildingsVO  buildingsVO = new BuildingsVO();
		buildingsVO.setId(buildId);
		buildingsImgVO.setBuildings(buildingsVO);
		for(int i=0;i<batchImgFileName.length;i++){
			String imgName = batchImgFileName[i];
			File imgContent = batchImg[i];
			buildingsImgVO.setImg_path(getImgUrl(imgName,imgContent)); 
			buildingsImgVO.setCreated_time(new java.sql.Date(new Date().getTime()));
			buildindsDao.batchUploadImg(buildingsImgVO);
		}
	}
	@Override  //获取保存进数据库的图片路径
	public String getImgUrl(String imgName,File imgContent){
		String path = ServletActionContext.getRequest().getRealPath("/attached/agency");
		int pos = imgName.lastIndexOf('.');
		String ext = imgName.substring(pos); 
		String newFileName = System.nanoTime()+ext;
		try {
			FileUtils.copyFile(imgContent, new File(path,newFileName));//保存楼栋图片
		} catch (IOException e) {
			e.printStackTrace();
		}
		String logoUrl=ServletActionContext.getRequest().getContextPath()+"/attached/agency";
		return logoUrl+"/"+newFileName;
	}

	
	
	@Override
	public BuildingsVO login(BuildingsVO t) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<String> buildsMapList() {
		return buildindsDao.buildsMapList();
	}

	@Override
	public PageByEasyUi<BuildingsVO> pageByAgency(PageByEasyUi<BuildingsVO>page,String id) {
		return buildindsDao.pageByAgency(page, id);
	}

	@Override
	public BuildingsVO lookBuildsDetail(String buildingsId) {
		return buildindsDao.lookBuildsDetail(buildingsId);
	}

	@Override
	public List buildsListMap(String id) {
		return buildindsDao.buildsListMap(id);
	}

	@Override
	public void agencyModifyImg(String buildsId,String agnecyModifyImgFileName,File agnecyModifyImg) {
		String imgUrl = getImgUrl(agnecyModifyImgFileName, agnecyModifyImg);
		BuildingsVO buildingsVO = new BuildingsVO();
		buildingsVO.setId(buildsId);
		buildingsVO.setLogo(imgUrl);
		buildindsDao.agencyModifyImg(buildingsVO);
	}

	@Override
	public List buildsListByagency(String agencyId) {
		return buildindsDao.buildsListByagency(agencyId);
	}
	@Override
	public List buildsListByTime() {
		return buildindsDao.buildsListByTime();
	}
	@Override
	public List<BuildingsVO> pageBysql(FindObject find, int startPos, int pageSize) {
		return buildindsDao.pageBysql(find, startPos, pageSize);
	}

	@Override
	public List<BuildingsVO> buildsListByactivity() {
		return buildindsDao.buildsListByactivity();
	}

	@Override
	public List<BuildingsVO> buildsBySaleTIme() {
		return buildindsDao.buildsBySaleTime();
	}

	@Override
	public List<Object[]> buildsAvgPrice() {
		return buildindsDao.buildsAvgPrice();
	}

	@Override
	public List<BuildingsVO> hotBuilds() {
		return buildindsDao.hotBuilds();
	}
}
