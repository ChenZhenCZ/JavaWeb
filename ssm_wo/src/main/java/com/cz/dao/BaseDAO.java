package com.cz.dao;


import com.cz.common.Pager;

import java.util.List;

public interface BaseDAO {
    void save(Object t);
    void remove(Object t);
    void remove(Long id);
    void update(Object t);

    Object getById(Long id);
    List<Object> listAll();

    List<Object> listPager(Pager pager);
    Long count();

    List<Object> listPagerCriteria(Pager pager, Object obj);
    Long countCriteria(Object obj);

}
