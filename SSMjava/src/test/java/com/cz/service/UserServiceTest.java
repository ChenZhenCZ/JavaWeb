package com.cz.service;

import com.cz.bean.IngWz;
import com.cz.bean.UserWz;
import com.cz.controller.AddressUtils;
import net.sf.json.JSONObject;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.io.UnsupportedEncodingException;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.Date;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(value = {"classpath:/config/spring-context.xml",
        "classpath:/config/spring-mybatis.xml"})
public class UserServiceTest {
    @Resource
    private  UserWzService userWzService;

    @Test//登录
    public void login(){
        UserWz userWz =userWzService.login("李四","123");
        if (userWz!=null){
            System.out.println(userWz.getId());
            System.out.println("用户"+userWz.getName()+"： 登录成功！");
        }
    }

    @Test//增加英雄
    public void addjinx(){
        userWzService.addIng("鞋子抗战士");
    }

    @Test//交易记录
    public void add(){
        Date date =new Date();
        userWzService.addDao(1,1,date);
    }
    @Test//玩家信息
    public void user(){
        UserWz userWz =userWzService.ById(1);
        if (userWz!=null){
            System.out.println(userWz.getId());
            System.out.println("用户:"+userWz.getName());
            IngWz ingWz =userWz.getIngWz();
            System.out.println("英雄："+ingWz.getIngname());
            if(userWz.getHone().equals("0")){
                System.out.println("普通玩家");
            }else {
                System.out.println("vip玩家");
            }
        }
    }
    @Test
    public void main1()throws UnknownHostException {
        //获取本机IP地址
        System.out.println(InetAddress.getLocalHost().getHostAddress());
        //获取www.baidu.com的地址
        System.out.println(InetAddress.getByName("www.baidu.com"));
        //获取www.baidu.com的真实IP地址
        System.out.println(InetAddress.getByName("www.baidu.com").getHostAddress());
    }

    @Test
    public void getAddressByIp() throws Exception {
        // 参数ip
        String ip = "218.204.104.235";
        // json_result用于接收返回的json数据
        String json_result = null;
        try {
            json_result = AddressUtils.getAddresses("ip=" + ip, "utf-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        JSONObject json = JSONObject.fromObject(json_result);
      //  System.out.println("json数据： " + json);
        String country = JSONObject.fromObject(json.get("data")).get("country").toString();
        String region = JSONObject.fromObject(json.get("data")).get("region").toString();
        String city = JSONObject.fromObject(json.get("data")).get("city").toString();
        String county = JSONObject.fromObject(json.get("data")).get("county").toString();
        String isp = JSONObject.fromObject(json.get("data")).get("isp").toString();
        String area = JSONObject.fromObject(json.get("data")).get("area").toString();
        System.out.println("国家： " + country);
        System.out.println("地区： " + area);
        System.out.println("省份: " + region);
        System.out.println("城市： " + city);
        System.out.println("区/县： " + county);
        System.out.println("互联网服务提供商： " + isp);

        String address = country + "/";
        address += region + "/";
        address += city + "/";
        address += county;
        System.out.println(address);
    }
}
