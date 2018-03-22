package com.cz.service.impl;

import com.cz.common.Pager;
import com.cz.dao.MessageDAO;
import com.cz.service.MessageService;

import java.util.List;

public class MessageServixeImpl implements MessageService {
    private MessageDAO messageDAO;

    @Override
    public void save(Object t) {
        messageDAO.save(t);
    }

    @Override
    public void remove(Object t) {

    }

    @Override
    public void remove(Long id) {

    }

    @Override
    public void update(Object t) {
        messageDAO.update(t);
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
      Pager pager=new Pager(pageNo,pageSize);
      pager.setRows(messageDAO.listPagerCriteria(pager,t));
      pager.setTotal(messageDAO.countCriteria(t));
        return pager;
    }
}
