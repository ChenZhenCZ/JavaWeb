package com.wd.service.imp;

import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;

import com.wd.bean.UsersVO;
import com.wd.common.PageByEasyUi;
import com.wd.common.util.MyMD5Util;
import com.wd.dao.UserDao;
import com.wd.service.UserService;

public class UserServiceImp implements UserService{
	private UserDao userDao;
	
	public UserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	@Override
	public UsersVO queryById(String id) {
		return userDao.queryById(id);
	}
	//注册
	@Override
	public void saveOrUpdate(UsersVO t) {
		String pwd=t.getPwd();
		try {
			pwd=MyMD5Util.getEncryptedPwd(pwd);
			t.setPwd(pwd);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		userDao.saveOrUpdate(t);
	}

	@Override
	public void del(UsersVO t) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public PageByEasyUi<UsersVO> queryByPage(PageByEasyUi<UsersVO> page) {
		PageByEasyUi<UsersVO> pager=userDao.queryByPage(page);
		return pager;
	}

	@Override
	public int count() {
		int cnt=userDao.count();
		return cnt;
	}
	//用户登录
	@Override
	public UsersVO login(UsersVO t) {
		return userDao.login(t);
	}
	//判断手机号是否被注册过
	@Override
	public int queryByPhone(String phone) {
		int cnt = userDao.queryByPhone(phone);
		return cnt;
	}
	//更改密码
	@Override
	public boolean changePwd(UsersVO user) {
			try {
				user.setPwd(MyMD5Util.getEncryptedPwd(user.getQq()));
				userDao.changePwd(user.getId(),user.getPwd());
			} catch (NoSuchAlgorithmException e) {
				e.printStackTrace();
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			return true;
	}
	//修改用户信息
	@Override
	public void update(UsersVO user) {
		userDao.update(user);
	}
	//忘记密码
	@Override
	public void forgetPwd(String phone, String pwd) {
				try {
					pwd=MyMD5Util.getEncryptedPwd(pwd);
					userDao.forgetPwd(phone, pwd);	
				} catch (NoSuchAlgorithmException e) {
					e.printStackTrace();
				} catch (UnsupportedEncodingException e) {
					e.printStackTrace();
				}
	}
	//修改用户头像
	@Override
	public void modifyHeadicon(String id, String logoUrl) {
		userDao.modifyHeadicon(id, logoUrl);	
	}
}