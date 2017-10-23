package com.cz.controller;

import com.cz.baen.Permissions;
import com.cz.baen.ZTree;
import com.cz.service.PermissionsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/permission")
public class PermissionController {

    @Autowired
    private PermissionsService permissionsService;

    @GetMapping("page")
    public String init(){

        return "permission";
    }

    @PostMapping("by_module")
    @ResponseBody
    public List<ZTree> permissionsByModule(Integer mid) {
        System.out.println(mid);
        List<Permissions> permissionList = permissionsService.listByModule(mid);
        List<ZTree> zTreeList = new ArrayList<ZTree>();
        for (Permissions p : permissionList) {
            zTreeList.add(new ZTree(p.getId(), mid, p.getDesZh(), false, false, true));
        }
        return zTreeList;
    }
}
