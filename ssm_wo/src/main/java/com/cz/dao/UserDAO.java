package com.cz.dao;

import com.cz.bean.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface UserDAO extends BaseDAO {
   User getByPhonePwd(@Param("mail") String mail,@Param("pwd") String pwd);
}
