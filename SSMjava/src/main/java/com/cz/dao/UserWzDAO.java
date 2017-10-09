package com.cz.dao;

import com.cz.bean.UserWz;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.Date;

@Repository
public interface UserWzDAO {

    //登录
    public UserWz login(@Param("name")String name,@Param("password") String password);
    //增加英雄
    public void addIng(@Param("ingName") String ingName);
    //玩家信息
    public  UserWz ById(@Param("id") Integer id);
    //购买道具
    public void  addDao(@Param("ingId") Integer ingId, @Param("userId") Integer userId, @Param("date") Date date);
}
