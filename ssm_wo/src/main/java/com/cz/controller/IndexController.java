package com.cz.controller;

import com.cz.common.Http;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("/")
public class IndexController extends HttpServlet {
    
    @RequestMapping("")
    public String index(HttpServletRequest request, HttpServletResponse response){
        String json1 = "";//获取access_token
        String json2 = "";//获取用户信息
        String state = request.getParameter("state");//跳转页面标识
        String code = request.getParameter("code");//通过code获取access_token
        String httpurl = "https://api.weixin.qq.com/sns/oauth2/access_token";
        String param = "appid=wx44552d6afd0f1ee7&secret=9c171b1f0ada9cf05225a05130081f6f&code=081mABb50eX0TI1ST3e50aVnb50mABbf"+"&grant_type=authorization_code";

        try {
            json1 = Http.methodGet(httpurl,param);
        } catch (Exception e) {

            e.printStackTrace();
        }
        JSONObject jsonToken = new JSONObject(json1);
        String access_token = jsonToken.getString("access_token");
        String openid = jsonToken.getString("openid");

        //通过access_token和openid请求获取用户信息https://api.weixin.qq.com/sns/userinfo?access_token=ACCESS_TOKEN&openid=OPENID&lang=zh_CN
        try {
            json2 = Http.methodGet("https://api.weixin.qq.com/sns/userinfo","access_token="+access_token+"&openid="+openid+"");
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        JSONObject jsonUser = new JSONObject(json2);
        return "index";
    }
    @RequestMapping("home")
    public String home(){

        return "home/home";
    }
}
