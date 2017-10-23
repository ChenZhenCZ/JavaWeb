package com.cz.shiro;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.config.IniSecurityManagerFactory;
import org.apache.shiro.mgt.SecurityManager;

import org.apache.shiro.subject.Subject;
import org.apache.shiro.util.Factory;

public class shiroMyRealmTest {

    public static  void main(String[] ager){
        Factory<SecurityManager> factory = new IniSecurityManagerFactory("classpath:shiro-myrealm.ini");
       SecurityManager securityManager = factory.getInstance();
        SecurityUtils.setSecurityManager(securityManager);
        Subject subject= SecurityUtils.getSubject();
        try {
            subject.login(new UsernamePasswordToken("amdin", "123456"));
            System.out.println("登录成功！");
            System.out.println(subject.getPrincipal().toString());//用户名称

            subject.logout(); // 退出登录
        }catch (UnknownError e){
            System.out.println("不存在此用户");
            e.printStackTrace();
        }catch (IncorrectCredentialsException e){
            System.out.println("密码错误");
            e.printStackTrace();
        }catch (AuthenticationException e){

            System.out.println("用户或密码错误！");
            e.printStackTrace();
        }
    }
}
