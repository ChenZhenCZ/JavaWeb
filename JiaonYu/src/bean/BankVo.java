package bean;

import java.io.Serializable;
//7、银行表(Bank)
public class BankVo implements Serializable{
	private int bankId;//银行id
	private String bankName;//银行名称
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
