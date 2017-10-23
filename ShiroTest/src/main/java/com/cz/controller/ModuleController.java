package com.cz.controller;

import com.cz.baen.Module;
import com.cz.baen.ZTree;
import com.cz.service.ModuleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/module")
public class ModuleController {

    @Autowired
    private ModuleService moduleService;

   @GetMapping("all")
    @ResponseBody
    public List<ZTree> list(){
        List<Module> moduleList = moduleService.list();
        List<ZTree> zTreeList = new ArrayList<ZTree>();
        for (Module m : moduleList) {
            zTreeList.add(new ZTree(m.getId(), 0, m.getName(), false, true, false));
        }
        return zTreeList;
    }

}

