package com.cz.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/holl")
public class Test {

    @RequestMapping("h")
    public String holl(){
        return"holle";
    }

    @RequestMapping("hi")
    public String hi(){
        return "hi";
    }

}
