package com.cz.controller;

import com.cz.bean.ControllerResult;
import com.cz.bean.Uers;
import com.cz.service.UersService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
@RequestMapping("/amdin")
public class Amdincontroller {

    private Logger logger= LoggerFactory.getLogger(Amdincontroller.class);
    @Resource
    private UersService uersService;

    @GetMapping("/req")
    public  String req(){
        logger.info("req amdin");
        return "amdin/requ";
    }
    @PostMapping("re")
    @ResponseBody
    public String req1(){

        return "{\"re\":\"ok\"}";
    }

    @PostMapping("re1")
    @ResponseBody
    public ControllerResult req2(Uers uers){
        System.out.println("1111111111111111");
        uersService.sava(uers);
        return ControllerResult.getSUCCESSResult("注册成功");
    }

    @GetMapping("phone/{phone}")
    @ResponseBody
    public Uers getByPhone(@PathVariable("phone") String phone) {

        return uersService.ById(phone);
    }
    /**
     * 初始化绑定
     * @param binder
     */
    @InitBinder
    public void initBinder(WebDataBinder binder) {
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        dateFormat.setLenient(false);
        /**
         * 注册自定义编辑器
         */
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }

}
