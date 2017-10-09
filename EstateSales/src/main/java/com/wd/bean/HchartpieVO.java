package com.wd.bean;

import java.util.List;

public class HchartpieVO<T> {

	private String type;
	private String name;
	private List<PieVO> data;
	
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<PieVO> getData() {
		return data;
	}

	public void setData(List<PieVO> data) {
		this.data = data;
	}

}
