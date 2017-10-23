package com.cz.service.impl;

import com.cz.baen.Module;
import com.cz.dao.ModuleDAO;
import com.cz.service.ModuleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class ModuleServiceImpl implements ModuleService {

    @Autowired
    private ModuleDAO moduleDAO;

    public List<Module> list() {
        return moduleDAO.list();
    }
}
