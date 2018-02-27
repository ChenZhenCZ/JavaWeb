package com.gs.dao;

import com.gs.bean.Teacher;

import java.util.List;

/**
 * Created by Administrator on 2017/11/21.
 */
public interface TeacherDAO extends BaseDAO<Teacher> {

    void saveClasses(Long teacherId, List<Long> classIds);

}
