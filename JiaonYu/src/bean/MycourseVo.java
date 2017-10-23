package bean;

import java.io.Serializable;

public class MycourseVo implements Serializable{
	private PayRecordVo pay;
	private CourseVo  cou;
	public PayRecordVo getPay() {
		return pay;
	}
	public void setPay(PayRecordVo pay) {
		this.pay = pay;
	}
	public CourseVo getCou() {
		return cou;
	}
	public void setCou(CourseVo cou) {
		this.cou = cou;
	}
}
