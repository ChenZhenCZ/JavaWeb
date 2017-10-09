package zzz.ht.service;

import java.util.List;

import zzz.ht.bean.ManagerVo;

public interface ManagerService {

	public List<ManagerVo> findManagerByPage(int startPos,int pageSize);
	public int getCount(String sql);
}
