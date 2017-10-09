package com.cz.service.impl;

import com.cz.bean.UserWz;
import com.cz.dao.UserWzDAO;
import com.cz.service.UserWzService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
@Service
public class UserWzServiceImpl implements UserWzService {
    @Resource
    private UserWzDAO userWzDAO;

    public UserWz login(String name, String password) {

           return userWzDAO.login(name,password);
    }

    public void addIng(String ingName) {
            userWzDAO.addIng(ingName);
    }

    public void addDao(Integer ingId, Integer userId, Date date) {
            userWzDAO.addDao(ingId,userId,date);
    }

    public UserWz ById(Integer id) {
        return userWzDAO.ById(id);
    }
}
