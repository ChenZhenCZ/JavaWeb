package bean;

import java.io.Serializable;
//7�����б�(Bank)
public class BankVo implements Serializable{
	private int bankId;//����id
	private String bankName;//��������
	public int getBankId() {
		return bankId;
	}
	public void setBankId(int bankId) {
		this.bankId = bankId;
	}
	public String getBankName() {
		return bankName;
	}
	public void setBankName(String bankName) {
		this.bankName = bankName;
	}
}
