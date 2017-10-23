package bean;

import java.io.Serializable;
//11、	课件节表(Section)（课程子表）
public class SectionVo implements Serializable{
	private int sectionId;//节id
	private int courseId;//课程id
	private String sectionName;//节名称
	private int timeLength;//视频记录时长(分钟)
	private String sectionUrl;//课件内容网址
	private String sectionContent;//资料内容(html)
	private String remark;//备注
	private int free;//是否免费(0免费/1会员)
	private int seq;//排序(小号排前序号*10)
	private int status;//0:未审核，1：已审核；2.审核未通过
	private String reason;//未通过原因
	public int getSectionId() {
		return sectionId;
	}
	public void setSectionId(int sectionId) {
		this.sectionId = sectionId;
	}
	public int getCourseId() {
		return courseId;
	}
	public void setCourseId(int courseId) {
		this.courseId = courseId;
	}
	public String getSectionName() {
		return sectionName;
	}
	public void setSectionName(String sectionName) {
		this.sectionName = sectionName;
	}
	public int getTimeLength() {
		return timeLength;
	}
	public void setTimeLength(int timeLength) {
		this.timeLength = timeLength;
	}
	public String getSectionUrl() {
		return sectionUrl;
	}
	public void setSectionUrl(String sectionUrl) {
		this.sectionUrl = sectionUrl;
	}
	public String getSectionContent() {
		return sectionContent;
	}
	public void setSectionContent(String sectionContent) {
		this.sectionContent = sectionContent;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public int getFree() {
		return free;
	}
	public void setFree(int free) {
		this.free = free;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	
}
