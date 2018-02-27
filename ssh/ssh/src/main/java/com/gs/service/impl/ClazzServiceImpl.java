package com.gs.service.impl;

import com.gs.bean.Clazz;
import com.gs.common.Pager;
import com.gs.dao.ClazzDAO;
import com.gs.service.ClazzService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2017/11/21.
 */
@Service
public class ClazzServiceImpl implements ClazzService {

    @Autowired
    private ClazzDAO clazzDAO;

    @Override
    public void save(Clazz clazz) {
        clazzDAO.save(clazz);
    }

    @Override
    public void remove(Clazz clazz) {
        clazzDAO.remove(clazz);
    }

    @Override
    public void removeById(Long id) {
        clazzDAO.removeById(id);
    }

    @Override
    public void update(Clazz clazz) {
        clazzDAO.update(clazz);
    }

    @Override
    public Clazz getById(Long id) {
        return clazzDAO.getById(id);
    }

    @Override
    public List<Clazz> listAll() {
        return clazzDAO.listAll();
    }

    @Override
    public Pager<Clazz> listPager(int pageNo, int pageSize) {
        Pager<Clazz> pager = new Pager<Clazz>(pageNo, pageSize);
        pager = clazzDAO.listPager(pager);
        pager.setTotal(clazzDAO.count());
        return pager;
    }

    @Override
    public Pager<Clazz> listPagerCriteria(int pageNo, int pageSize, Clazz clazz) {
        Pager<Clazz> pager = new Pager<>(pageNo, pageSize);
        pager.setTotal(clazzDAO.countCriteria(clazz));
        return clazzDAO.listPagerCriteria(pager, clazz);
    }
}
