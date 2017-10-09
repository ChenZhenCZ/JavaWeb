package com.cz.controller;

import com.cz.bean.Page;
import com.cz.bean.PageObject;
import com.cz.bean.Uers;
import com.cz.bean.User;
import com.cz.service.UersService;
import jdk.internal.org.objectweb.asm.tree.analysis.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Controller
@RequestMapping("/uers")
public class Uerscontroller {
    @Resource
    private UersService uersService;
    @RequestMapping("login")
    public String longin(){

        return "login";
    }

    @RequestMapping("list")
    public String longinUers(){

        return "amdin/userList";
    }
    @PostMapping("log")
    public  String login1(@RequestParam("name") String name,@RequestParam("password") String  password){
        System.out.println(name);
        System.out.println(password);
        return"login";
    }
    @PostMapping("log2")
    public ModelAndView logina(String name,String password){
        if ("text".equals(name) && "123456".equals(password)){
            ModelAndView mv=new ModelAndView("hi");
            mv.addObject("name",name);
            return mv;
        }
        return new ModelAndView("login");
    }
    @PostMapping("log1")
    public String login2(String name,String password){
        System.out.println("namw:"+name+"password:"+password);
        return "login";
    }
    @GetMapping("del/{id}")
    public String delete(@PathVariable("id") String id){
        System.out.println(id);
        return "login";
    }
    @PostMapping("vo")
    public String loginvo(Uers uers){
        System.out.println("name="+uers.getName()+"password="+uers.getPassword());
        return "login";
    }
    @GetMapping("cookei")
    public String cookei(HttpServletResponse response){
        response.addCookie(new Cookie("cookie_name","cookie_value"));
        return "login";
    }
    @GetMapping("cookei1")
    public String  cookei1(@CookieValue("cookie_name") String anme){
        System.out.println(anme);
        return "login";
    }
    @GetMapping("header")
    public String header(@RequestHeader("Accept") String accept) {
        System.out.println(accept);
        return "login";
    }
    //分页
    @RequestMapping(value ="listUers",produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public Page<Uers> ListUers(){
        Page page =new Page();
        PageObject pageObject=new PageObject();
        List<Uers> uersList =uersService.pageUerdList(pageObject);
        page.setRows(uersList);
        page.setTotal(uersList.size());
        return page;
    }

    //分页
    @RequestMapping(value ="Uerslist",produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public Page<Uers> UersList(){
        Page page =new Page();
        List<Uers> uersList =uersService.pageListUers();
        page.setRows(uersList);
        page.setTotal(uersList.size());
        return page;
    }

    @GetMapping("list")
    public String pageList(){

        return "amdin/userList";
    }
}
