package com.cz.service.impl;

import com.cz.bean.Amdin;
import com.cz.dao.AmdinDAO;
import com.cz.service.AmdinService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.sql.CommonDataSource;
import java.util.List;

@Service
public class AmdinServiceimpl implements AmdinService {

    @Resource
    private AmdinDAO amdinDAO;

    @Resource
    private CommonDataSource commonDataSource;

    public void save(Amdin amdin) {
        amdinDAO.save(amdin);
    }

    public Amdin getById(String phone) {
        return amdinDAO.getById(phone);

    }

    public void update(String hpone, String password) {
        amdinDAO.update(hpone,password);
    }

    public void removeById(String id) {
        amdinDAO.removeById(id);
    }

    public List<Amdin> listByIds(List<Integer> amdinId) {
        return amdinDAO.listByIds(amdinId);
    }
}
