package com.cz.service;

import com.cz.bean.User;

public interface UserService extends BaseService{
    User getByPhonePwd(String mail,String pwd);
}
