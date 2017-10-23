package bean;

import java.io.Serializable;
import java.util.Date;
//17,ÓÅ»ÝÈ¯»î¶¯Ã÷Ï¸±í
public class ExchangeCodeVo implements Serializable{
	private  int exchangeCodeId;//¶Ò»»Âëid
	private  int exchangeRecordId;//¶Ò»»¼ÇÂ¼id
	private  int userid;//ÓÃ»§id
	private  String exchangeCode;//¶Ò»»Âë
	private  int  exchangeMeony;//¶Ò»»½ð¶î
	private  int  exchangeStatus;//¶Ò»»×´Ì¬(0Î´¶Ò»»/1ÒÑ¶Ò»»)
	private Date  exchangeDate;//¶Ò»»Ê±¼ä
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
