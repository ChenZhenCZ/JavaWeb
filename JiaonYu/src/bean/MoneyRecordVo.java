package bean;

import java.io.Serializable;
import java.util.Date;
//2、充值记录表(moneyRecord)
public class MoneyRecordVo implements Serializable{
	private int recordId;//充值id
	private int userid;//用户id
	private Date payDate;//充值时间
	private String payMoney;//充值金额
	public int getRecordId() {
		return recordId;
	}
	public void setRecordId(int recordId) {
		this.recordId = recordId;
	}
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public Date getPayDate() {
		return payDate;
	}
	public void setPayDate(Date payDate) {
		this.payDate = payDate;
	}
	public String getPayMoney() {
		return payMoney;
	}
	public void setPayMoney(String payMoney) {
		this.payMoney = payMoney;
	}
}
