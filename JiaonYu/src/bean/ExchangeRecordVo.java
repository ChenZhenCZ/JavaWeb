package bean;

import java.io.Serializable;
//18.�Ż�ȯ���
public class ExchangeRecordVo implements Serializable{

	private int exchangeRecordId;//�һ���¼id
	private String activityName;//�����
	private String activityDesc;//�˵��
	private String userName;//������
	private String createDate;//����ʱ��
	public int getExchangeRecordId() {
		return exchangeRecordId;
	}
	public void setExchangeRecordId(int exchangeRecordId) {
		this.exchangeRecordId = exchangeRecordId;
	}
	public String getActivityName() {
		return activityName;
	}
	public void setActivityName(String activityName) {
		this.activityName = activityName;
	}
	public String getActivityDesc() {
		return activityDesc;
	}
	public void setActivityDesc(String activityDesc) {
		this.activityDesc = activityDesc;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getCreateDate() {
		return createDate;
	}
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
}
