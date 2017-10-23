package com.cz.controller;

import com.cz.baen.Role;
import com.cz.baen.Select2;
import com.cz.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/role")
public class RoleController {
    @Autowired
    private RoleService roleService;

    @GetMapping("all")
    @ResponseBody
    public List<Select2> roleList(){
        List<Role> roleList = roleService.list();
        List<Select2> select2s =new ArrayList<Select2>();
        for(Role role:roleList){
            select2s.add(new Select2(role.getId(),role.getName()));
        }
        return select2s ;
    }
}
