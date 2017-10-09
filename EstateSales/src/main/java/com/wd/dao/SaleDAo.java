package com.wd.dao;

import java.util.List;

import com.wd.bean.CustomerVO;
import com.wd.bean.SalaryVO;
import com.wd.bean.SaleVO;
import com.wd.common.PageByEasyUi;

public interface SaleDAo extends BaseDao<String, SaleVO>{
	public void updateSale(SaleVO t);
	public PageByEasyUi<SaleVO> pageById(PageByEasyUi<SaleVO>page,String id);
	public int countById(String id);
	
	public PageByEasyUi<SaleVO> pageAgencyId(PageByEasyUi<SaleVO>page,String id);
	public int countAgencyId(String id);
	//销售总额
	public double performance(String id,String yue);

	
}
