package com.wd.dao;

import com.wd.bean.ActivityVO;
import com.wd.bean.HistoryVO;
import com.wd.common.PageByEasyUi;

public interface HistoryDao extends BaseDao<String,HistoryVO>{
	//历史记录列表
	public void list(HistoryVO history);
	//历史记录分页
	public PageByEasyUi<HistoryVO> pageByid(PageByEasyUi<HistoryVO> page, String userid);
	public int countByid(String id);
	public boolean queryBymsg(HistoryVO history);
}
