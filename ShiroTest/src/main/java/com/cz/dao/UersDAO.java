package com.cz.dao;

import com.cz.baen.Uers;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface UersDAO {

    Uers getByNamePwd(@Param("name") String name,@Param("pwd") String pwd);
}
