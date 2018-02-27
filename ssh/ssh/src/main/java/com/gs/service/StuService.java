package com.gs.service;

import com.gs.bean.Stu;
import com.gs.common.Pager;
import com.gs.vo.StuClassVO;

import java.util.List;

/**
 * Created by Administrator on 2017/11/21.
 */
public interface StuService extends BaseService<Stu> {

    Pager<StuClassVO> listAllWithClass(int pageNo, int pageSize, Stu stu);
}
