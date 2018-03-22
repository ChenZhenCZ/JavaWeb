package com.cz.common;

import com.cz.bean.User;
import com.cz.dao.UserDAO;
import com.cz.service.UserService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

public class UserTest extends  BaseTest{
    @Autowired
    private UserDAO userDAO;

    @Test
    public void svae(){
        User user =new User();
        user.setPhone("15270640035");
        user.setPwd(EncryptUtils.md5("123456"));
        user.setMail("2908903432@qq.com");
        user.setUserType(0);
        user.setUserName("陈桢");

        userDAO.save(user);
    }
    @Test
    public void getByid(){

        User user= userDAO.getByPhonePwd("15270640035",EncryptUtils.md5("123456"));

        if (user!=null){
            System.out.println(user.getId());
        }else {
            System.out.println("出错！");
        }
    }
}
