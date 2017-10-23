package bean;

import java.io.Serializable;
//18.优惠券活动表
public class ExchangeRecordVo implements Serializable{

	private int exchangeRecordId;//兑换记录id
	private String activityName;//活动名称
	private String activityDesc;//活动说明
	private String userName;//创建人
	private String createDate;//创建时间
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
