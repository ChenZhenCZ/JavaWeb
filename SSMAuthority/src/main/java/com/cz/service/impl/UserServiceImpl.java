package com.cz.service.impl;

import com.cz.bean.User;
import com.cz.dao.UserDAO;
import com.cz.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by Administrator on 2017/9/25.
 */
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDAO userDAO;

    public User getByPhonePwd(String phone, String pwd) {
        return userDAO.getByPhonePwd(phone, pwd);
    }
}
