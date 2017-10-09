package com.wd.bean;

import java.io.Serializable;

//员工工资表
public class SalaryVO implements Serializable {
	private static final long serialVersionUID = -2053248035880305858L;
	private String id;
	private long sum;
	private String emp_id;
	private String percent;
	private int count;
	private String time;
	private EmployeeVO emp;

	public String getEmp_id() {
		return emp_id;
	}

	public void setEmp_id(String emp_id) {
		this.emp_id = emp_id;
	}

	public String getPercent() {
		return percent;
	}

	public void setPercent(String percent) {
		this.percent = percent;
	}

	public EmployeeVO getEmp() {
		return emp;
	}

	public void setEmp(EmployeeVO emp) {
		this.emp = emp;
	}

	public long getSum() {
		return sum;
	}

	public void setSum(long sum) {
		this.sum = sum;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
}
