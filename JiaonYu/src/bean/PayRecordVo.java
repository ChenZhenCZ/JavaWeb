package bean;

import java.io.Serializable;
import java.util.Date;
//13����μ�¼��
public class PayRecordVo implements Serializable{
	private int payRecordId;//�ɷ�id
	private int userid;//�û�id
	private int courseid;//�γ�Id
	private int payOrReturn;//�ɷѻ��˷ѣ�0�ɷѣ�1�˷ѣ�
	private Date payDate;//����ʱ��
	private float payMoney;//������
	private float discountMoney;//�Ż�ȯ���
	private int payType;//���ʽ(0֧����/1΢��
	private String cardNum;//֧������΢�źţ�
	private String payer;//������
	private String orderNumber;//������
	private int payStatus;//�ɷ�״̬(0δ֧��/1��֧��)
	private int isCash;//�Ƿ����֣�0��δ���֣�1�������֣�
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
