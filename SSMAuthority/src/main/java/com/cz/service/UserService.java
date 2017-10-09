package com.cz.service;

import com.cz.bean.User;
import com.cz.dao.UserDAO;
import org.apache.ibatis.annotations.Param;

/**
 * Created by Administrator on 2017/9/25.
 */
public interface UserService {
    User getByPhonePwd(String phone, String pwd);
}
