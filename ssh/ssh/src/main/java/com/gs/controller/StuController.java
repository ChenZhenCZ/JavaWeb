package com.gs.controller;

import com.gs.bean.Stu;
import com.gs.common.Pager;
import com.gs.enums.ControllerStatusEnum;
import com.gs.service.StuService;
import com.gs.vo.ControllerStatusVO;
import com.gs.vo.StuClassVO;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import java.util.List;

/**
 * Created by Administrator on 2017/11/24.
 */
@Controller
@ParentPackage("base-package")
@Namespace("/stu")
public class StuController extends BaseController {

    @Autowired
    private StuService stuService;

    private Pager<Stu> pager;
    private Stu stu;
    private Integer page;
    private Integer rows;
    private Pager<StuClassVO> stuClassVOPager;
    private ControllerStatusVO statusVO;

    private List<StuClassVO> stuClassVOList;

    @Action(value = "stu_page", results = {@Result(name = "success", location = "/WEB-INF/views/stu/stu.jsp")})
    public String stuPage() {
        return SUCCESS;
    }

    @Action(value = "save", results = {@Result(name = "save",  type = "json", params = {"root", "statusVO"})})
    public String save() {
        stuService.save(stu);
        statusVO = ControllerStatusVO.status(ControllerStatusEnum.CLASS_SAVE_SUCCESS);
        return "save";
    }

    @Action(value = "remove", results = {@Result(name = "remove", type = "json",  params = {"root", "statusVO"})})
    public String remove() {
        stuService.remove(stu);
        statusVO = ControllerStatusVO.status(ControllerStatusEnum.CLASS_REMOVE_SUCCESS);
        return "remove";
    }

    @Action(value = "update", results = {@Result(name = "update", type = "json",  params = {"root", "statusVO"})})
    public String update() {
        stuService.update(stu);
        statusVO = ControllerStatusVO.status(ControllerStatusEnum.CLASS_UPDATE_SUCCESS);
        return "update";
    }
    @Action(value = "pager_criteria", results = {@Result(name = "pager_criteria", type = "json",  params = {"root", "pager"})})
    public String pagerCriteria() {
        pager = stuService.listPagerCriteria(page, rows, stu);
        return "pager_criteria";
    }

    @Action(value = "stuvo_list", results = {@Result(name = "stuvo_list", type = "json",  params = {"root", "stuClassVOPager"})})
    public String stuVO() {
        stuClassVOPager = stuService.listAllWithClass(page, rows, stu);
        return "stuvo_list";
    }

    public Pager<Stu> getPager() {
        return pager;
    }

    public Stu getStu() {
        return stu;
    }

    public void setStu(Stu stu) {
        this.stu = stu;
    }

    public void setPage(Integer page) {
        this.page = page;
    }

    public void setRows(Integer rows) {
        this.rows = rows;
    }

    public ControllerStatusVO getStatusVO() {
        return statusVO;
    }

    public List<StuClassVO> getStuClassVOList() {
        return stuClassVOList;
    }

    public Pager<StuClassVO> getStuClassVOPager() {
        return stuClassVOPager;
    }
}
