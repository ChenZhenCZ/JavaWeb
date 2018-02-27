package com.gs.service;

import com.gs.bean.Teacher;

import java.util.List;

/**
 * Created by Administrator on 2017/11/21.
 */
public interface TeacherService extends BaseService<Teacher> {

    void saveClasses(Long teacherId, String classIds);

}
