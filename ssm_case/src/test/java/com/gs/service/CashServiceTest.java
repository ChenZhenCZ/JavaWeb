package com.gs.service;

import com.gs.common.Pager;
import com.gs.query.CashQuery;
import com.gs.vo.CashVO;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.math.BigDecimal;

/**
 * Created by Administrator on 2017/12/8.
 */
public class CashServiceTest extends BaseTest {

    @Autowired
    private CashService cashService;

    @Test
    public void testListPagerCriteria() {
        CashQuery query = new CashQuery();
        query.setMoney(new BigDecimal(800));
        query.setCashTime(" 2017-12-08 07:55:00");
        Pager pager = cashService.listPagerCriteria(1, 2, query);
        System.out.println(((CashVO)pager.getRows().get(0)).getId());
    }
}
