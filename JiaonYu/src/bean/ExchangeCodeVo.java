package bean;

import java.io.Serializable;
import java.util.Date;
//17,�Ż�ȯ���ϸ��
public class ExchangeCodeVo implements Serializable{
	private  int exchangeCodeId;//�һ���id
	private  int exchangeRecordId;//�һ���¼id
	private  int userid;//�û�id
	private  String exchangeCode;//�һ���
	private  int  exchangeMeony;//�һ����
	private  int  exchangeStatus;//�һ�״̬(0δ�һ�/1�Ѷһ�)
	private Date  exchangeDate;//�һ�ʱ��
	public int getExchangeCodeId() {
		return exchangeCodeId;
	}
	public void setExchangeCodeId(int exchangeCodeId) {
		this.exchangeCodeId = exchangeCodeId;
	}
	public int getExchangeRecordId() {
		return exchangeRecordId;
	}
	public void setExchangeRecordId(int exchangeRecordId) {
		this.exchangeRecordId = exchangeRecordId;
	}
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public String getExchangeCode() {
		return exchangeCode;
	}
	public void setExchangeCode(String exchangeCode) {
		this.exchangeCode = exchangeCode;
	}
	public int getExchangeMeony() {
		return exchangeMeony;
	}
	public void setExchangeMeony(int exchangeMeony) {
		this.exchangeMeony = exchangeMeony;
	}
	public int getExchangeStatus() {
		return exchangeStatus;
	}
	public void setExchangeStatus(int exchangeStatus) {
		this.exchangeStatus = exchangeStatus;
	}
	public Date getExchangeDate() {
		return exchangeDate;
	}
	public void setExchangeDate(Date exchangeDate) {
		this.exchangeDate = exchangeDate;
	}
}
