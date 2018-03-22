package com.cz.controller;

import com.cz.bean.User;
import com.cz.common.Constants;
import com.cz.common.EncryptUtils;
import com.cz.enums.ControllerStatusEnum;
import com.cz.service.UserService;
import com.cz.vo.ControllerStatusVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    private ControllerStatusVO statusVO;

    private User user;
    
    @RequestMapping("")
    public String index(){

        return "index";
    }
    @RequestMapping("login")
    public String login(){

        return "login/login";
    }

    @RequestMapping("login_no")
    public String login_no(){

        return "login/loginon";
    }
    @PostMapping("/zhu")
    @ResponseBody
    public ControllerStatusVO zhuche(User user){//用户注册
        user.setPwd(EncryptUtils.md5(user.getPwd()));
        try {
            userService.save(user);
            statusVO=ControllerStatusVO.status(ControllerStatusEnum.USER_INSERT_SUCCESS);
        }catch (Exception e){
            statusVO=ControllerStatusVO.status(ControllerStatusEnum.USER_INSERT_ERROR_CODE);
        }
        return statusVO;
    }
    @PostMapping("/log")
    @ResponseBody
    public ControllerStatusVO log(HttpSession session,User user){//用户登录
        User userlogin=userService.getByPhonePwd(user.getMail(),EncryptUtils.md5(user.getPwd()));
        if(userlogin!=null){
            session.setAttribute(Constants.USER_IN_SESSION,userlogin);
            statusVO=ControllerStatusVO.status(ControllerStatusEnum.USER_LOGIN_SUCCESS);
            return statusVO;
        }
        statusVO=ControllerStatusVO.status(ControllerStatusEnum.USER_LOGIN_FAIL);
        return statusVO;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public ControllerStatusVO getStatusVO() {
        return statusVO;
    }

    public void setStatusVO(ControllerStatusVO statusVO) {
        this.statusVO = statusVO;
    }
}
