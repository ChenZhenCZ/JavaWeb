package com.gs.service;

import com.gs.query.CashQuery;
import org.apache.poi.ss.usermodel.Workbook;

/**
 * Created by Administrator on 2017/12/7.
 */
public interface CashService extends BaseService {

    Workbook export(CashQuery cashQuery);
}
