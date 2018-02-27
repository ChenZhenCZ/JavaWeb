package com.gs.service.impl;

import com.gs.bean.Contract;
import com.gs.common.Pager;
import com.gs.dao.ContractDAO;
import com.gs.service.ContractService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2017/11/21.
 */
@Service
public class ContractServiceImpl implements ContractService {

    @Autowired
    private ContractDAO contractDAO;

    @Override
    public void save(Contract contract) {
        contractDAO.save(contract);
    }

    @Override
    public void remove(Contract contract) {
        contractDAO.remove(contract);
    }

    @Override
    public void removeById(Long id) {
        contractDAO.removeById(id);
    }

    @Override
    public void update(Contract contract) {
        contractDAO.update(contract);
    }

    @Override
    public Contract getById(Long id) {
        return contractDAO.getById(id);
    }

    @Override
    public List<Contract> listAll() {
        return contractDAO.listAll();
    }

    @Override
    public Pager<Contract> listPager(int pageNo, int pageSize) {
        Pager<Contract> pager = new Pager<>(pageNo, pageSize);
        pager = contractDAO.listPager(pager);
        pager.setTotal(contractDAO.count());
        return pager;
    }

    @Override
    public Pager<Contract> listPagerCriteria(int pageNo, int pageSize, Contract contract) {
        Pager<Contract> pager = new Pager<>(pageNo, pageSize);
        pager.setTotal(contractDAO.countCriteria(contract));
        return contractDAO.listPagerCriteria(pager, contract);
    }

}
