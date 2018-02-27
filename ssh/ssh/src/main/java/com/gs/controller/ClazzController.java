package com.gs.controller;

import com.gs.bean.Clazz;
import com.gs.common.Combobox;
import com.gs.common.Pager;
import com.gs.enums.ControllerStatusEnum;
import com.gs.service.ClazzService;
import com.gs.vo.ControllerStatusVO;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2017/11/22.
 */
@Controller
@ParentPackage("base-package")
@Namespace("/class")
public class ClazzController extends BaseController {

    @Autowired
    private ClazzService clazzService;
    private Clazz clazz;

    private Long clazzId;
    private ControllerStatusVO statusVO;
    private Pager<Clazz> pager;

    private List<Combobox> comboboxList;

    private Integer page;
    private Integer rows;

    @Action(value = "class_page", results = {@Result(name = "success", location = "/WEB-INF/views/clazz/clazz.jsp")})
    public String classPage() {
        return SUCCESS;
    }

    @Action(value = "save", results = {@Result(name = "save",  type = "json", params = {"root", "statusVO"})})
    public String save() {
        clazzService.save(clazz);
        statusVO = ControllerStatusVO.status(ControllerStatusEnum.CLASS_SAVE_SUCCESS);
        return "save";
    }

    @Action(value = "remove", results = {@Result(name = "remove", type = "json",  params = {"root", "statusVO"})})
    public String remove() {
        clazzService.remove(clazz);
        statusVO = ControllerStatusVO.status(ControllerStatusEnum.CLASS_REMOVE_SUCCESS);
        return "remove";
    }

    @Action(value = "update", results = {@Result(name = "update", type = "json",  params = {"root", "statusVO"})})
    public String update() {
        clazzService.update(clazz);
        statusVO = ControllerStatusVO.status(ControllerStatusEnum.CLASS_UPDATE_SUCCESS);
        return "update";
    }

    @Action(value = "getById", results = {@Result(name = "getById", type = "json", params = {"root", "clazz"})})
    public String getById() {
        clazz = clazzService.getById(clazz.getId());
        return "getById";
    }

    @Action(value = "pager", results = {@Result(name = "pager", type = "json",  params = {"root", "pager"})})
    public String pager() {
        pager = clazzService.listPager(page, rows);
        return "pager";
    }

    @Action(value = "pager_criteria", results = {@Result(name = "pager_criteria", type = "json",  params = {"root", "pager"})})
    public String pagerCriteria() {
        pager = clazzService.listPagerCriteria(page, rows, clazz);
        return "pager_criteria";
    }

    @Action(value = "all", results = {@Result(name = "all", type = "json", params = {"root", "comboboxList"})})
    public String all() {
        List<Clazz> clazzList = clazzService.listAll();
        comboboxList = new ArrayList<>();
        for (Clazz clazz : clazzList) {
            boolean selected = false;
            if (clazzId != null && clazzId.longValue() == clazz.getId().longValue()) {
                selected = true;
            }
            comboboxList.add(new Combobox(clazz.getId() + "", clazz.getTitle(), selected));
        }
        return "all";
    }

    public Clazz getClazz() {
        return clazz;
    }

    public void setClazz(Clazz clazz) {
        this.clazz = clazz;
    }

    public ControllerStatusVO getStatusVO() {
        return statusVO;
    }

    public Pager<Clazz> getPager() {
        return pager;
    }

    public void setClazzId(Long clazzId) {
        this.clazzId = clazzId;
    }

    public void setPage(Integer page) {
        this.page = page;
    }

    public void setRows(Integer rows) {
        this.rows = rows;
    }

    public List<Combobox> getComboboxList() {
        return comboboxList;
    }
}
