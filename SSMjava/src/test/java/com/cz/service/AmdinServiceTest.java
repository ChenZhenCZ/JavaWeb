package com.cz.service;

import com.cz.bean.Amdin;
import com.cz.bean.PageObject;
import com.cz.bean.Uers;
import com.cz.bean.User;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(value = {"classpath:/config/spring-context.xml",
                               "classpath:/config/spring-mybatis.xml"})
public class AmdinServiceTest {
    @Resource
    private  AmdinService amdinService;

    @Resource
    private  UersService uersService;

    @Test
    public void listAmdinById(){
        Amdin amdin=new Amdin();
        amdin.setPhone("15270640035");
        amdin.setPassword("123456");

        amdinService.save(amdin);    }
    @Test
    public  void listById(){
        amdinService.getById("15270640035");
    }
    @Test
    public void updataAmdin(){
        amdinService.update("15270640035","654123");
    }
    @Test
    public  void deleteAmdin(){
        amdinService.removeById("15270640035");
    }
    @Test
    public  void AmdinById(){
        List<Integer> byId =new ArrayList<Integer>();
        byId.add(1);
        List<Amdin> amdinList=amdinService.listByIds(byId);
        for (Amdin amdin:amdinList ){
            System.out.println(amdin.getPhone());
        }
    }
    @Test
    public  void  ListUser(){
        PageObject page=new PageObject();
       List<Uers> userList= uersService.pageUerdList(page);

       for (Uers uers:userList){
           System.out.println(uers.getName());
       }
    }
}
