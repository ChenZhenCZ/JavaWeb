package com.gs.controller;

import com.gs.bean.LoginLog;
import com.gs.bean.User;
import com.gs.common.Constants;
import com.gs.common.EncryptUtils;
import com.gs.enums.ControllerStatusEnum;
import com.gs.service.LoginLogService;
import com.gs.service.UserService;
import com.gs.vo.ControllerStatusVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Created by Administrator on 2017/12/7.
 */
@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;
    @Autowired
    private LoginLogService loginLogService;

    @PostMapping("login")
    @ResponseBody
    public ControllerStatusVO login(HttpSession session, HttpServletRequest request, String phone, String pwd, String code) {
        Object obj = session.getAttribute(Constants.CODE_IN_SESSION);
        ControllerStatusVO statusVO = null;
        if (obj != null) {
            String checkCode = (String) obj;
            if (checkCode.equalsIgnoreCase(code)) {
                Object userObj = session.getAttribute(Constants.USER_IN_SESSION);
                if (userObj == null) {
                    User user = userService.getByPhonePwd(phone, EncryptUtils.md5(pwd));
                    if (user != null) {
                        session.setAttribute(Constants.USER_IN_SESSION, user);
                        LoginLog log = new LoginLog();
                        log.setUserId(user.getId());
                        log.setLoginIp(request.getRemoteHost());
                        loginLogService.save(log);
                        statusVO = ControllerStatusVO.status(ControllerStatusEnum.USER_LOGIN_SUCCESS);
                    } else {
                        statusVO = ControllerStatusVO.status(ControllerStatusEnum.USER_LOGIN_FAIL);
                    }
                } else {
                    statusVO = ControllerStatusVO.status(ControllerStatusEnum.USER_ALREADY_LOGIN);
                }
            } else {
                statusVO = ControllerStatusVO.status(ControllerStatusEnum.USER_LOGIN_ERROR_CODE);
            }
        }
        return statusVO;
    }

    @RequestMapping("home")
    public String home() {
        return "home";
    }

    @RequestMapping("logout")
    public String logout(HttpSession session) {
        User user = (User) session.getAttribute(Constants.USER_IN_SESSION);
        loginLogService.updateByUserId(user.getId());
        session.invalidate();
        return "user/login";
    }

}
