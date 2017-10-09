package com.wd.service;

import java.util.List;

import com.wd.bean.CustomerVO;
import com.wd.bean.EmployeeVO;
import com.wd.common.PageByEasyUi;


public interface CousService extends BaseService<Integer, CustomerVO>{
	public List<CustomerVO> couslist();
	public void update(CustomerVO t);
	public PageByEasyUi<CustomerVO>pageById(PageByEasyUi<CustomerVO>page,String id);
	public PageByEasyUi<CustomerVO> pageAgencyId(PageByEasyUi<CustomerVO>page,String id);
	
	//上传合同
	public void contarct(String img,String id);

	//客户激活
	public void Jihuo(String cousId);
	//经销商修改客户信息
	public void agencyModifyCous(CustomerVO cus);
}
