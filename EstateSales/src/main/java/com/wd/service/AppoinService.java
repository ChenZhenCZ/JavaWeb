package com.wd.service;

import com.wd.bean.AppointmentVO;
import com.wd.bean.UsersVO;
import com.wd.common.PageByEasyUi;

public interface AppoinService extends BaseService<String, AppointmentVO>{
	public PageByEasyUi<AppointmentVO> pageById(PageByEasyUi<AppointmentVO>page,String id);
	public PageByEasyUi<AppointmentVO> pageAgencyId(PageByEasyUi<AppointmentVO>page,String id);
}
