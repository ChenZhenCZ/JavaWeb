package com.wd.common.util;

import java.io.File;
import java.io.IOException;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

public class Imguet {
	private String logoFileName; //文件名
	private File logo; //文件
	
	public String getLogoFileName() {
		return logoFileName;
	}

	public void setLogoFileName(String logoFileName) {
		this.logoFileName = logoFileName;
	}

	public File getLogo() {
		return logo;
	}

	public void setLogo(File logo) {
		this.logo = logo;
	}

	public String  getImglog(){
		String path = ServletActionContext.getRequest().getRealPath("/attached/agency");
		int pos = logoFileName.lastIndexOf('.');
		String ext = logoFileName.substring(pos); 
		String newFileName = System.nanoTime()+ext;
		try {
			FileUtils.copyFile(logo, new File(path,newFileName));//保存楼栋图片
			System.out.println("绝对路径："+path);
		} catch (IOException e) {
			e.printStackTrace();
		}
		String logoUrl=ServletActionContext.getRequest().getContextPath()+"/attached/agency";
		logoUrl=logoUrl+"/"+newFileName;
		System.out.println(logoUrl);
		return logoUrl;
	}
}
