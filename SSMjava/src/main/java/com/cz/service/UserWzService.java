package com.cz.service;

import com.cz.bean.UserWz;
import org.apache.ibatis.annotations.Param;

import java.util.Date;

public interface UserWzService {
    //登录
    public UserWz login(String name, String password);
    //增加英雄
    public void addIng(String ingName);
    //购买道具
    public void  addDao(Integer ingId, Integer userId, Date date);

    //玩家信息
    public  UserWz ById(@Param("id") Integer id);
}
