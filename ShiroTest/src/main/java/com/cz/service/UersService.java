package com.cz.service;

import com.cz.baen.Uers;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface UersService {

    Uers getByNamePwd(String name,String pwd);
}
