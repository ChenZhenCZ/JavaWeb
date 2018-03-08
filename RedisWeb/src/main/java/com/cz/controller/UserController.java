package com.cz.controller;

import com.cz.bean.User;
import com.cz.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    @GetMapping("get/{id}")
    @ResponseBody
    public User get(@PathVariable("id") Long id) {
        Object obj = userService.getById(id);
        return obj == null ? null : (User) obj;
    }

}
