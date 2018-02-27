package com.gs.service.impl;

import com.gs.common.Pager;
import com.gs.dao.CashTypeDAO;
import com.gs.service.CashTypeService;
import com.gs.vo.CashTypeVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2017/12/7.
 */
@Service
public class CashTypeServiceImpl implements CashTypeService {

    @Autowired
    private CashTypeDAO cashTypeDAO;

    @Override
    public void save(Object obj) {

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
        return null;
    }

    @Override
    public List<CashTypeVO> getByPid(Long pid) {
        return cashTypeDAO.getByPid(pid);
    }
}
