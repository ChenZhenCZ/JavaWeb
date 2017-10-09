package com.wd.dao;

import java.util.List;

import com.wd.bean.AgencyVO;

public interface AgencyDao extends BaseDao<String,AgencyVO>{

	//查询该手机号有没有被注册过
	public int queryByPhone(String phone);
	//经销商登录验证
	public AgencyVO loginValidate(String phone,String pwd);
	//经销商找回密码(修改密码)
	public void forgetPwd(String phone,String pwd);
	//经销商查看信息
	public AgencyVO lookImg(String id);
	//经销商修改信息
	public void modifyImg(String id,AgencyVO agenvocy);
	//经销商修改logo
	public void modifyLogo(String id,String logoUrl);
	//经销商审核
	public void updateStatus(AgencyVO a);
	public List agencyList();
	public List<AgencyVO>agencyBySale();
}
