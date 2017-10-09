package com.wd.service.imp;


import java.util.ArrayList;
import java.util.List;

import com.wd.bean.SalaryVO;
import com.wd.bean.SaleVO;
import com.wd.common.PageByEasyUi;
import com.wd.dao.SaleDAo;
import com.wd.service.SaleService;

public class SaleServiceImp implements SaleService{
	
	private SaleDAo saledao;
	public void setSaledao(SaleDAo saledao) {
		this.saledao = saledao;
	}

	@Override
	public SaleVO queryById(String id) {
	
		return saledao.queryById(id);
	}

	@Override
	public void saveOrUpdate(SaleVO t) {
		saledao.saveOrUpdate(t);
		
	}

	@Override
	public void del(SaleVO t) {
		saledao.del(t);
		
	}

	@Override
	public PageByEasyUi<SaleVO> queryByPage(PageByEasyUi<SaleVO> page) {
		
		return saledao.queryByPage(page);
	}

	@Override
	public int count() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public SaleVO login(SaleVO t) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateSale(SaleVO t) {
		
		saledao.updateSale(t);
	}

	@Override
	public PageByEasyUi<SaleVO> pageById(PageByEasyUi<SaleVO> page, String id) {
		return saledao.pageById(page, id);
	}
	@Override
	public PageByEasyUi<SaleVO> pageAgencyId(PageByEasyUi<SaleVO> page, String id) {
		return saledao.pageAgencyId(page, id);
	}


	@Override
	public double performance(String id, String yue) {
		
		return saledao.performance(id, yue);
	}


}
