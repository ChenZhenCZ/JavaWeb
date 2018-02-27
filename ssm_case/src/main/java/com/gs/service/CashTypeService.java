package com.gs.service;

import com.gs.bean.CashType;
import com.gs.vo.CashTypeVO;

import java.util.List;

/**
 * Created by Administrator on 2017/12/7.
 */
public interface CashTypeService extends BaseService {

    List<CashTypeVO> getByPid(Long pid);

}
