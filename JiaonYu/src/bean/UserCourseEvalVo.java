package bean;

import java.io.Serializable;
import java.util.Date;
//12��	�û��γ����۱�(UserCourseEval)
public class UserCourseEvalVo implements Serializable{
	private int userCourseEvalId;//����id
	private int userid;//�û�id
	private String username;//�û�id
	private int courseId;//�γ�id
	private int evalLevel;//����(1/2/3/4/5)
	private String evalContent;//��������
	private Date evalDate;//����ʱ��
	public int getUserCourseEvalId() {
		return userCourseEvalId;
	}
	public void setUserCourseEvalId(int userCourseEvalId) {
		this.userCourseEvalId = userCourseEvalId;
	}
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public int getCourseId() {
		return courseId;
	}
	public void setCourseId(int courseId) {
		this.courseId = courseId;
	}
	public int getEvalLevel() {
		return evalLevel;
	}
	public void setEvalLevel(int evalLevel) {
		this.evalLevel = evalLevel;
	}
	public String getEvalContent() {
		return evalContent;
	}
	public void setEvalContent(String evalContent) {
		this.evalContent = evalContent;
	}
	public Date getEvalDate() {
		return evalDate;
	}
	public void setEvalDate(Date evalDate) {
		this.evalDate = evalDate;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
}
