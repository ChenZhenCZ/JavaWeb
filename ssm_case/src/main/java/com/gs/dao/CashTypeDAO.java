package com.gs.dao;

import com.gs.bean.CashType;
import com.gs.vo.CashTypeVO;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by Administrator on 2017/12/7.
 */
@Repository
public interface CashTypeDAO extends BaseDAO {

    List<CashTypeVO> getByPid(Long pid);

}
