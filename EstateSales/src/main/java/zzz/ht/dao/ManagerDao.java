package zzz.ht.dao;

import java.util.List;

import zzz.ht.bean.ManagerVo;

public interface ManagerDao {
	
	
	public List<ManagerVo> findManagerByPage(int startPos,int pageSize);
	public int getCount(String sql);
}
