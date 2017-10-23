package com.gs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Administrator on 2017/10/19.
 */
@Controller
@RequestMapping("/ueditor")
public class UEditorController {

    @RequestMapping("core")
    public String core() {
        return "ueditor/jsp/controller";
    }

}
