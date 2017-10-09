package com.wd.service;

import com.wd.bean.UsersVO;

public interface UserService extends BaseService<String,UsersVO>{
	//查询该手机号有没有被注册过
	public int queryByPhone(String phone);
	//更改密码
	public boolean changePwd(UsersVO user);
	//修改用户信息
	public void update(UsersVO user);
	//忘记密码
	public void forgetPwd(String phone,String pwd);
	//修改用户头像
	public void modifyHeadicon(String id,String logoUrl);

}
