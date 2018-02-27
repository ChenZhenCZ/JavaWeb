package com.gs.service;

import com.gs.bean.User;

/**
 * Created by Administrator on 2017/12/7.
 */
public interface UserService extends BaseService {

    User getByPhonePwd(String phone, String pwd);

}
