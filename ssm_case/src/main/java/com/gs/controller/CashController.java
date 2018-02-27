package com.gs.controller;

import com.gs.bean.Cash;
import com.gs.bean.User;
import com.gs.common.Constants;
import com.gs.common.Pager;
import com.gs.enums.ControllerStatusEnum;
import com.gs.query.CashQuery;
import com.gs.service.CashService;
import com.gs.vo.ControllerStatusVO;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.OutputStream;
import java.sql.Timestamp;
import java.util.Calendar;

/**
 * Created by Administrator on 2017/12/8.
 */
@Controller
@RequestMapping("/cash")
public class CashController {

    @Autowired
    private CashService cashService;

    @RequestMapping("page")
    public String page() {
        return "cash/cash";
    }

    @RequestMapping("save")
    @ResponseBody
    public ControllerStatusVO save(HttpSession session, Cash cash) {
        ControllerStatusVO statusVO = null;
        try {
            User user = (User) session.getAttribute(Constants.USER_IN_SESSION);
            cash.setUserId(user.getId());
            cash.setCreateTime(new Timestamp(Calendar.getInstance().getTime().getTime()));
            cashService.save(cash);
        } catch (RuntimeException e) {
            statusVO = ControllerStatusVO.status(ControllerStatusEnum.CASH_SAVE_FAIL);
        }
        statusVO = ControllerStatusVO.status(ControllerStatusEnum.CASH_SAVE_SUCCESS);
        return statusVO;
    }

    @RequestMapping("update")
    @ResponseBody
    public ControllerStatusVO update(Cash cash) {
        ControllerStatusVO statusVO = null;
        try {
            cashService.update(cash);
        } catch (RuntimeException e) {
            statusVO = ControllerStatusVO.status(ControllerStatusEnum.CASH_UPDATE_FAIL);
        }
        statusVO = ControllerStatusVO.status(ControllerStatusEnum.CASH_UPDATE_SUCCESS);
        return statusVO;
    }

    @RequestMapping("pager_criteria")
    @ResponseBody
    public Pager pagerCriteria(int page, int rows, CashQuery cashQuery) {
        return cashService.listPagerCriteria(page, rows, cashQuery);
    }

    @RequestMapping("export")
    public void exportExcel(HttpServletResponse response, CashQuery cashQuery) {
        Workbook workbook = cashService.export(cashQuery);
        response.setCharacterEncoding("utf-8");
        response.setHeader("Content-disposition", "attachment; filename=cash.xlsx");
        response.setContentType("application/vnd.ms-excel;charset=utf-8");
        try {
            OutputStream out = response.getOutputStream();
            workbook.write(out);
            out.flush();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
