package com.cz.dao;

import com.cz.bean.Amdin;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AmdinDAO {
     void save(Amdin amdin);

     Amdin getById(String phone);

     void update(@Param("phone") String phone,@Param("password") String password);

     void removeById(@Param("phone") String id);

     List<Amdin> listByIds(List<Integer> amdinId);

}
