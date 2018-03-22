package com.cz.dao;

import com.cz.bean.User;
import com.cz.bean.Userdetail;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface UserdetailDAO extends BaseDAO {

    @Override
    Userdetail getById(@Param("id") Long id);
}
