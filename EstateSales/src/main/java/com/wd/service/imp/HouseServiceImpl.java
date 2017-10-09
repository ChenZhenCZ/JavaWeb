package com.wd.service.imp;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import com.wd.bean.BuildingsVO;
import com.wd.bean.HourseVO;
import com.wd.common.PageByEasyUi;
import com.wd.dao.HouseDao;
import com.wd.service.HouseService;

public class HouseServiceImpl implements HouseService {
	
	private HouseDao houseDao;
	
	
	public void setHouseDao(HouseDao houseDao) {
		this.houseDao = houseDao;
	}

	@Override
	public HourseVO queryById(String id) {
		return houseDao.queryById(id);
	}

	@Override
	public void saveOrUpdate(HourseVO t) {
		houseDao.saveOrUpdate(t);
	}

	@Override
	public void del(HourseVO t) {
		// TODO Auto-generated method stub

	}

	@Override
	public PageByEasyUi<HourseVO> queryByPage(PageByEasyUi<HourseVO> page) {
		return houseDao.queryByPage(page);
	}

	@Override
	public int count() {
		return houseDao.count();
	}

	@Override
	public HourseVO login(HourseVO t) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<BuildingsVO> buildList(String agencyId) {
		return houseDao.buildList(agencyId);
	}

	@Override
	public void save(HourseVO hourseVO, String imgName, File imgContent) {
		hourseVO.setStatus("激活");
		hourseVO.setCreated_time(new Date(new java.util.Date().getTime()));
		hourseVO.setLogo(getImgUrl(imgName, imgContent));
		houseDao.saveOrUpdate(hourseVO);
	}
	
	@Override
	public String getImgUrl(String imgName, File imgContent) {
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
	public PageByEasyUi<HourseVO> pageByid(PageByEasyUi<HourseVO> page, String agencyId) {
		return houseDao.pageByid(page, agencyId);
	}

	@Override
	public void inOractive(HourseVO houseVO) {
		houseDao.inOractive(houseVO);
	}

	@Override
	public void modifyHouseImg(String houseId, String imgName, File imgContent) {
		HourseVO houseVO = new HourseVO();
		houseVO.setId(houseId);
		houseVO.setLogo(getImgUrl(imgName, imgContent));
		houseDao.modifyHouseImg(houseVO);
	}

	@Override
	public PageByEasyUi<HourseVO> pageByid(PageByEasyUi<HourseVO> page, String agencyId, String buildsName) {
		return houseDao.pageByid(page, agencyId, buildsName);
	}

	@Override
	public int getCountByHouseName(String houseName) {
		return houseDao.getCountByHouseName(houseName);
	}

	@Override
	public PageByEasyUi<HourseVO> queryByPageByHouseName(PageByEasyUi<HourseVO> page, String houseName) {
		return houseDao.queryByPageByHouseName(page, houseName);
	}

	@Override	//用户查看户型(按时间排序，前五个)
	public List<HourseVO> queryListByTime() {
		
		return houseDao.queryListByTime();
	}

	@Override
	public List<HourseVO> houseByarea() {
		return houseDao.houseByarea();
	}

	@Override
	public boolean isExistHouseName(String houseName,String buildsid) {
		
		return houseDao.isExistHouseName(houseName,buildsid);
	}
	
}
