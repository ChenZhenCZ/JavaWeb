package bean;

import java.io.Serializable;
import java.util.Date;
//2����ֵ��¼��(moneyRecord)
public class MoneyRecordVo implements Serializable{
	private int recordId;//��ֵid
	private int userid;//�û�id
	private Date payDate;//��ֵʱ��
	private String payMoney;//��ֵ���
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
