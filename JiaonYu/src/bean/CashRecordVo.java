package bean;

import java.io.Serializable;
import java.util.Date;
//14��	���ּ�¼��CashRecord��
public class CashRecordVo implements Serializable{
	private int payRecordId;//�ɷ�id
	private int teacherId;//��ʦid
	private Date cashDate;//����ʱ��
	private float payMoney;//���ֽ��
	private float IncomMoney;//ƽ̨������
	private String status;//0:δ��ˣ�1������ˣ�2.���δͨ����3.�Ѹ���
	private String reason;//δͨ��ԭ��
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
