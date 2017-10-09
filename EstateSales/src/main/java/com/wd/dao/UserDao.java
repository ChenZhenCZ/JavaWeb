package com.wd.dao;

import com.wd.bean.UsersVO;

public interface UserDao extends BaseDao<String,UsersVO>{
	//查询该手机号有没有被注册过
	public int queryByPhone(String phone);
	//更改密码
	public void changePwd(String id,String pwd);
	//修改用户信息
	public void update(UsersVO user);
	//忘记密码
	public void forgetPwd(String phone,String pwd);
	//修改用户头像
	public void modifyHeadicon(String id,String logoUrl);

}
