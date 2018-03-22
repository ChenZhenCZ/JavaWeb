package com.cz.service;


import com.cz.common.Pager;

import java.util.List;

public interface BaseService {
    void save(Object t);
    void remove(Object t);
    void remove(Long id);
    void update(Object t);

    Object getById(Long id);
    List<Object> listAll();
    Pager listPager(int pageNo, int pageSize);

    Pager listPagerCriteria(int pageNo, int pageSize, Object t);

}
