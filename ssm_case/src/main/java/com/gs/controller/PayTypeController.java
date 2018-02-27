package com.gs.controller;

import com.gs.bean.PayType;
import com.gs.common.Combobox;
import com.gs.service.PayTypeService;
import com.gs.vo.CashTypeVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2017/12/11.
 */
@Controller
@RequestMapping("/pay_type")
public class PayTypeController {

    @Autowired
    private PayTypeService payTypeService;

    @RequestMapping("all")
    @ResponseBody
    public List<Combobox> all() {
        List<Object> objectList = payTypeService.listAll();
        List<Combobox> comboboxes = new ArrayList<>();
        for (Object obj : objectList) {
            PayType payType = (PayType) obj;
            comboboxes.add(new Combobox(payType.getId() + "", payType.getType(), false));
        }
        return comboboxes;
    }

}
