package com.cz.service;

import com.cz.bean.Amdin;

import java.util.List;

public interface AmdinService {
    public void save(Amdin amdin);

    public Amdin getById(String phone);

    public void update(String hpone,String password);

    void removeById(String id);

    List<Amdin> listByIds(List<Integer> amdinId);
}
