package bean;

import java.io.Serializable;
//9,教师等级表
public class TeacherGrade implements Serializable{
	private int gradeid; 
	private String gradename; 
	private float  gradePercent;
	public int getGradeid() {
		return gradeid;
	}
	public void setGradeid(int gradeid) {
		this.gradeid = gradeid;
	}
	public String getGradename() {
		return gradename;
	}
	public void setGradename(String gradename) {
		this.gradename = gradename;
	}
	public float getGradePercent() {
		return gradePercent;
	}
	public void setGradePercent(float gradePercent) {
		this.gradePercent = gradePercent;
	} 
}
