package com.gs.service.impl;

import com.gs.common.Pager;
import com.gs.dao.LoginLogDAO;
import com.gs.service.LoginLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2017/12/7.
 */
@Service
public class LoginLogServiceImpl implements LoginLogService{

    @Autowired
    private LoginLogDAO loginLogDAO;

    @Override
    public void save(Object obj) {
        loginLogDAO.save(obj);
    }

    @Override
    public void remove(Object obj) {

    }

    @Override
    public void removeById(Long id) {

    }

    @Override
    public void update(Object obj) {

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
    public Pager listPagerCriteria(int pageNo, int pageSize, Object obj) {
        Pager pager = new Pager(pageNo, pageSize);
        pager.setRows(loginLogDAO.listPagerCriteria(pager, obj));
        pager.setTotal(loginLogDAO.countCriteria(obj));
        return pager;
    }

    @Override
    public void updateByUserId(Long userId) {
        loginLogDAO.updateByUserId(userId);
    }
}
