package bean;

import java.io.Serializable;
import java.util.Date;
//14、	提现记录表（CashRecord）
public class CashRecordVo implements Serializable{
	private int payRecordId;//缴费id
	private int teacherId;//讲师id
	private Date cashDate;//提现时间
	private float payMoney;//提现金额
	private float IncomMoney;//平台收入金额
	private String status;//0:未审核，1：已审核；2.审核未通过；3.已付款
	private String reason;//未通过原因
	public int getPayRecordId() {
		return payRecordId;
	}
	public void setPayRecordId(int payRecordId) {
		this.payRecordId = payRecordId;
	}
	
	public int getTeacherId() {
		return teacherId;
	}
	public void setTeacherId(int teacherId) {
		this.teacherId = teacherId;
	}
	public Date getCashDate() {
		return cashDate;
	}
	public void setCashDate(Date cashDate) {
		this.cashDate = cashDate;
	}
	public float getPayMoney() {
		return payMoney;
	}
	public void setPayMoney(float payMoney) {
		this.payMoney = payMoney;
	}
	public float getIncomMoney() {
		return IncomMoney;
	}
	public void setIncomMoney(float incomMoney) {
		IncomMoney = incomMoney;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
}
