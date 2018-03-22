package com.cz.service.impl;

import com.cz.bean.User;
import com.cz.common.Pager;
import com.cz.dao.UserDAO;
import com.cz.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDAO userDAO;

    @Override
    public void save(Object t) {
        userDAO.save(t);
    }

    @Override
    public void remove(Object t) {

    }

    @Override
    public void remove(Long id) {

    }

    @Override
    public void update(Object t) {

    }

    @Override
    public Object getById(Long id) {
        return null;
    }

    @Override
    public List<Object> listAll() {
        return null;
    }

    @Override
    public Pager listPager(int pageNo, int pageSize) {
        return null;
    }

    @Override
    public Pager listPagerCriteria(int pageNo, int pageSize, Object t) {
        return null;
    }

    @Override
    public User getByPhonePwd(String mail, String pwd) {
        return userDAO.getByPhonePwd(mail,pwd);
    }
}
