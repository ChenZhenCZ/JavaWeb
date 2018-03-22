package com.cz.service.impl;

import com.cz.bean.Userdetail;
import com.cz.common.Pager;
import com.cz.dao.UserdetailDAO;
import com.cz.service.UserdetailService;

import java.util.List;

public class UserdetailServiceImpl implements UserdetailService {
    private UserdetailDAO userdetailDAO;
    @Override
    public void save(Object t) {
        userdetailDAO.save(t);
    }

    @Override
    public void remove(Object t) {

    }

    @Override
    public void remove(Long id) {

    }

    @Override
    public void update(Object t) {
        userdetailDAO.update(t);
    }

    @Override
    public Userdetail getById(Long id) {
        Userdetail userdetail=userdetailDAO.getById(id);
        return userdetail;
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
}
