package com.gs.service;

import com.gs.common.Pager;

import java.util.List;

/**
 * Created by Administrator on 2017/11/21.
 */
public interface BaseService<T> {

    void save(T t);
    void remove(T t);
    void removeById(Long id);
    void update(T t);

    T getById(Long id);
    List<T> listAll();
    Pager<T> listPager(int pageNo, int pageSize);

    Pager<T> listPagerCriteria(int pageNo, int pageSize, T t);

}
