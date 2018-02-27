package com.gs.dao;

import com.gs.bean.Clazz;
import com.gs.common.Pager;

import java.util.List;

/**
 * Created by Administrator on 2017/11/21.
 */
public interface BaseDAO<T> {

    void save(T t);
    void remove(T t);
    void removeById(Long id);
    void update(T t);

    T getById(Long id);
    List<T> listAll();
    Pager<T> listPager(Pager<T> pager);
    Long count();

    Pager<T> listPagerCriteria(Pager<T> pager, T t);
    Long countCriteria(T t);


}
