package bean;

import java.io.Serializable;

//4,Ê¡·Ý±í
public class ProVo implements Serializable{
	private int provinceid;
	private String provincename;
	public int getProvinceid() {
		return provinceid;
	}
	public void setProvinceid(int provinceid) {
		this.provinceid = provinceid;
	}
	public String getProvincename() {
		return provincename;
	}
	public void setProvincename(String provincename) {
		this.provincename = provincename;
	}
}
