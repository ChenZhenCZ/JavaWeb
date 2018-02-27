package com.gs.controller;

import com.gs.bean.CashType;
import com.gs.common.Combobox;
import com.gs.service.CashTypeService;
import com.gs.vo.CashTypeVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2017/12/11.
 */
@Controller
@RequestMapping("/cash_type")
public class CashTypeController {

    @Autowired
    private CashTypeService cashTypeService;

    @RequestMapping("get/{pid}")
    @ResponseBody
    public List<Combobox> getByPid(@PathVariable("pid") Long pid) {
        List<CashTypeVO> cashTypeVOList = cashTypeService.getByPid(pid);
        List<Combobox> comboboxes = new ArrayList<>();
        for (CashTypeVO cashTypeVO : cashTypeVOList) {
            comboboxes.add(new Combobox(cashTypeVO.getId() + "", cashTypeVO.getType(), false));
        }
        return comboboxes;
    }

}
