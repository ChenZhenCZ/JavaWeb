package com.wd.service;

import com.wd.bean.HistoryVO;
import com.wd.common.PageByEasyUi;

public interface HistoryService extends BaseService<String,HistoryVO>{
	//历史记录列表
	public void list(HistoryVO history);
	
	//历史记录分页
	public PageByEasyUi<HistoryVO> pageByid(PageByEasyUi<HistoryVO> page, String userid);

	public boolean queryBymsg(HistoryVO history);
}
