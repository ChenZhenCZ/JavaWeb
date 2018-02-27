package com.gs.controller;

import com.gs.common.Pager;
import com.gs.query.LoginLogQuery;
import com.gs.service.LoginLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by Administrator on 2017/12/8.
 */
@Controller
@RequestMapping("/login_log")
public class LoginLogController {

    @Autowired
    private LoginLogService loginLogService;

    @RequestMapping("page")
    public String page() {
        return "log/login_log";
    }

    @RequestMapping("pager_criteria")
    @ResponseBody
    public Pager pagerCriteria(int page, int rows, LoginLogQuery loginLogQuery) {
        return loginLogService.listPagerCriteria(page, rows, loginLogQuery);
    }
}
