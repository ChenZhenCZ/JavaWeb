package bean;

import java.io.Serializable;
import java.util.Date;
//12、	用户课程评价表(UserCourseEval)
public class UserCourseEvalVo implements Serializable{
	private int userCourseEvalId;//评价id
	private int userid;//用户id
	private String username;//用户id
	private int courseId;//课程id
	private int evalLevel;//评级(1/2/3/4/5)
	private String evalContent;//评价内容
	private Date evalDate;//评价时间
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
