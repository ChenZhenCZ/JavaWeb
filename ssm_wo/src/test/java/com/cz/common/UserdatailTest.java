package com.cz.common;

import com.cz.bean.Userdetail;

import com.cz.dao.UserdetailDAO;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

public class UserdatailTest extends  BaseTest{
    @Autowired
    private UserdetailDAO userdetailDAO;

    @Test
    public void svae(){
        Userdetail userdetail =new Userdetail();
        userdetail.setId(1);
        userdetail.setGender(20);
        userdetail.setSex(0);
        userdetail.setNameName("萌萌小怪");
        userdetail.setSignature("随机");
        userdetail.setDream("111");
        userdetailDAO.save(userdetail);
    }
    @Test
    public void getByid(){
        Userdetail userdetail =userdetailDAO.getById(1L);
        System.out.println(userdetail.getNameName());
    }
    @Test
    public void update(){
        Userdetail userdetail =new Userdetail();
        userdetail.setId(1);
        userdetail.setNameName("桢哥");
        userdetailDAO.update(userdetail);
    }
}
