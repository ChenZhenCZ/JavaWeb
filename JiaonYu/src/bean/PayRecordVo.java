package bean;

import java.io.Serializable;
import java.util.Date;
//13、买课记录表
public class PayRecordVo implements Serializable{
	private int payRecordId;//缴费id
	private int userid;//用户id
	private int courseid;//课程Id
	private int payOrReturn;//缴费或退费（0缴费，1退费）
	private Date payDate;//付款时间
	private float payMoney;//付款金额
	private float discountMoney;//优惠券金额
	private int payType;//付款方式(0支付宝/1微信
	private String cardNum;//支付宝，微信号）
	private String payer;//付款人
	private String orderNumber;//订单号
	private int payStatus;//缴费状态(0未支付/1已支付)
	private int isCash;//是否提现（0：未提现；1：已提现）
	public int getPayRecordId() {
		return payRecordId;
	}
	public void setPayRecordId(int payRecordId) {
		this.payRecordId = payRecordId;
	}
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public int getCourseid() {
		return courseid;
	}
	public void setCourseid(int courseid) {
		this.courseid = courseid;
	}
	public int getPayOrReturn() {
		return payOrReturn;
	}
	public void setPayOrReturn(int payOrReturn) {
		this.payOrReturn = payOrReturn;
	}
	public Date getPayDate() {
		return payDate;
	}
	public void setPayDate(Date payDate) {
		this.payDate = payDate;
	}
	public float getPayMoney() {
		return payMoney;
	}
	public void setPayMoney(float payMoney) {
		this.payMoney = payMoney;
	}
	public float getDiscountMoney() {
		return discountMoney;
	}
	public void setDiscountMoney(float discountMoney) {
		this.discountMoney = discountMoney;
	}
	public int getPayType() {
		return payType;
	}
	public void setPayType(int payType) {
		this.payType = payType;
	}
	public String getCardNum() {
		return cardNum;
	}
	public void setCardNum(String cardNum) {
		this.cardNum = cardNum;
	}
	public String getPayer() {
		return payer;
	}
	public void setPayer(String payer) {
		this.payer = payer;
	}
	public String getOrderNumber() {
		return orderNumber;
	}
	public void setOrderNumber(String orderNumber) {
		this.orderNumber = orderNumber;
	}
	public int getPayStatus() {
		return payStatus;
	}
	public void setPayStatus(int payStatus) {
		this.payStatus = payStatus;
	}
	public int getIsCash() {
		return isCash;
	}
	public void setIsCash(int isCash) {
		this.isCash = isCash;
	}

}
