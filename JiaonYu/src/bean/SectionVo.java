package bean;

import java.io.Serializable;
//11��	�μ��ڱ�(Section)���γ��ӱ�
public class SectionVo implements Serializable{
	private int sectionId;//��id
	private int courseId;//�γ�id
	private String sectionName;//������
	private int timeLength;//��Ƶ��¼ʱ��(����)
	private String sectionUrl;//�μ�������ַ
	private String sectionContent;//��������(html)
	private String remark;//��ע
	private int free;//�Ƿ����(0���/1��Ա)
	private int seq;//����(С����ǰ���*10)
	private int status;//0:δ��ˣ�1������ˣ�2.���δͨ��
	private String reason;//δͨ��ԭ��
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
