package com.wd.bean;

import java.io.Serializable;
import java.util.Date;
import java.util.Set;

import org.apache.struts2.json.annotations.JSON;

//客户表
public class CustomerVO implements Serializable{
	private static final long serialVersionUID = 5657512625127303055L;
	private String id;//编号,UUID
	private String name;//姓名
	private String gender;//	性别
	private Date birthday;//	生日
	private String headicon;
	private String identity_id;//身份证号
	private String email;//	邮箱
	private String phone;//手机号
	private String address;//联系地址,not null
	private String customer_type;//	客户类型，如预约客户，预定客户，购房客户
	private String together;//	共同购房人姓名，多个姓名用英文逗号隔开
	private String contract;//	电子版购房合同路径
	private String archives;//zip版电子档案路径
	private Date created_time;//创建时间
	private String status;//	状态，激活或冻结
	private String emp_id;
	private EmployeeVO emp; 
	private Set<SaleVO> saleSet;
	
	@JSON(serialize=false)
	public Set<SaleVO> getSaleSet() {
		return saleSet;
	}
	public void setSaleSet(Set<SaleVO> saleSet) {
		this.saleSet = saleSet;
	}

	public EmployeeVO getEmp() {
		return emp;
	}
	public void setEmp(EmployeeVO emp) {
		this.emp = emp;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public String getIdentity_id() {
		return identity_id;
	}
	public String getHeadicon() {
		return headicon;
	}
	public void setHeadicon(String headicon) {
		this.headicon = headicon;
	}
	public void setIdentity_id(String identity_id) {
		this.identity_id = identity_id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getCustomer_type() {
		return customer_type;
	}
	public void setCustomer_type(String customer_type) {
		this.customer_type = customer_type;
	}
	public String getTogether() {
		return together;
	}
	public void setTogether(String together) {
		this.together = together;
	}
	public String getContract() {
		return contract;
	}
	public void setContract(String contract) {
		this.contract = contract;
	}
	public String getArchives() {
		return archives;
	}
	public void setArchives(String archives) {
		this.archives = archives;
	}
	public Date getCreated_time() {
		return created_time;
	}
	public void setCreated_time(Date created_time) {
		this.created_time = created_time;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getEmp_id() {
		return emp_id;
	}
	public void setEmp_id(String emp_id) {
		this.emp_id = emp_id;
	}
	
}
