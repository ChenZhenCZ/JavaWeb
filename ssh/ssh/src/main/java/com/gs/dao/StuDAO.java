package com.gs.dao;

import com.gs.bean.Stu;
import com.gs.common.Pager;
import com.gs.vo.StuClassVO;

import java.util.List;

/**
 * Created by Administrator on 2017/11/21.
 */
public interface StuDAO extends BaseDAO<Stu> {

    Pager<StuClassVO> listAllWithClass(Pager<StuClassVO> pager, Stu stu);

}
