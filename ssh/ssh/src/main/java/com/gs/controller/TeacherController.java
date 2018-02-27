package com.gs.controller;

import com.gs.bean.Clazz;
import com.gs.bean.Teacher;
import com.gs.common.CollectionUtils;
import com.gs.common.Combobox;
import com.gs.common.Pager;
import com.gs.enums.ControllerStatusEnum;
import com.gs.service.TeacherService;
import com.gs.vo.ControllerStatusVO;
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
@Namespace("/teacher")
public class TeacherController extends BaseController {

    @Autowired
    private TeacherService teacherService;
    private Teacher teacher;

    private ControllerStatusVO statusVO;
    private Pager<Teacher> pager;

    private Integer page;
    private Integer rows;

    private Long teacherId;
    private String classIds;

    private Pager<Clazz> clazzPager;

    @Action(value = "teacher_page", results = {@Result(name = "success", location = "/WEB-INF/views/teacher/teacher.jsp")})
    public String teacherPage() {
        return SUCCESS;
    }

    @Action(value = "save", results = {@Result(name = "save",  type = "json", params = {"root", "statusVO"})})
    public String save() {
        teacherService.save(teacher);
        statusVO = ControllerStatusVO.status(ControllerStatusEnum.CLASS_SAVE_SUCCESS);
        return "save";
    }

    @Action(value = "remove", results = {@Result(name = "remove", type = "json",  params = {"root", "statusVO"})})
    public String remove() {
        teacherService.remove(teacher);
        statusVO = ControllerStatusVO.status(ControllerStatusEnum.CLASS_REMOVE_SUCCESS);
        return "remove";
    }

    @Action(value = "update", results = {@Result(name = "update", type = "json",  params = {"root", "statusVO"})})
    public String update() {
        teacherService.update(teacher);
        statusVO = ControllerStatusVO.status(ControllerStatusEnum.CLASS_UPDATE_SUCCESS);
        return "update";
    }

    @Action(value = "pager_criteria", results = {@Result(name = "pager_criteria", type = "json",  params = {"root", "pager"})})
    public String pagerCriteria() {
        pager = teacherService.listPagerCriteria(page, rows, teacher);
        return "pager_criteria";
    }

    @Action(value = "save_class", results = {@Result(name = "saveClass",  type = "json", params = {"root", "statusVO"})})
    public String saveClass() {
        teacherService.saveClasses(teacherId, classIds);
        statusVO = ControllerStatusVO.status(ControllerStatusEnum.CLASS_SAVE_SUCCESS);
        return "saveClass";
    }

    @Action(value = "class", results = {@Result(name = "classByTeacherId", type = "json", params = {"root", "clazzPager"})})
    public String classByTeacherId() {
        clazzPager = new Pager<>();
        List<Clazz> clazzList = CollectionUtils.setToList(teacherService.getById(teacherId).getClazzSet());
        clazzPager.setRows(clazzList);
        clazzPager.setPageNo(1);
        clazzPager.setPageSize(100);
        clazzPager.setTotal(new Long(clazzList.size()));
        return "classByTeacherId";
    }

    public Teacher getTeacher() {
        return teacher;
    }

    public void setTeacher(Teacher teacher) {
        this.teacher = teacher;
    }

    public ControllerStatusVO getStatusVO() {
        return statusVO;
    }

    public Pager<Teacher> getPager() {
        return pager;
    }

    public void setPage(Integer page) {
        this.page = page;
    }

    public void setRows(Integer rows) {
        this.rows = rows;
    }

    public void setTeacherId(Long teacherId) {
        this.teacherId = teacherId;
    }

    public void setClassIds(String classIds) {
        this.classIds = classIds;
    }

    public Pager<Clazz> getClazzPager() {
        return clazzPager;
    }
}
