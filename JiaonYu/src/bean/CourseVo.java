package bean;

import java.io.Serializable;
import java.util.Date;
//10、	课程表(Course)
public class CourseVo implements Serializable{
	private int courseId;//课程id
	private String courseName;//课程名称
	private String pictureUrl;//课程图片网址
	private String oneWord;//一句话
	private String introduce;//课程介绍
	private int teacherId;//讲师id
	private int courseCount;//课时数
	private float price;//价格
	private float discount;//折扣
	private int effective;//有效否(0：无效；1：有效)
	private Date replayDate;//发布时间
	private String replayUsername;//发布人
	private int seq;//排序(大号排前序号*10)
	private int chargeType;//收费类型0免费，1会员
	private int status;//0:未审核，1：已审核；2.审核未通过
	private String reason;//未通过原因
	public int getCourseId() {
		return courseId;
	}
	public void setCourseId(int courseId) {
		this.courseId = courseId;
	}
	public String getCourseName() {
		return courseName;
	}
	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}
	public String getPictureUrl() {
		return pictureUrl;
	}
	public void setPictureUrl(String pictureUrl) {
		this.pictureUrl = pictureUrl;
	}
	public String getOneWord() {
		return oneWord;
	}
	public void setOneWord(String oneWord) {
		this.oneWord = oneWord;
	}
	public String getIntroduce() {
		return introduce;
	}
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
	public int getTeacherId() {
		return teacherId;
	}
	public void setTeacherId(int teacherId) {
		this.teacherId = teacherId;
	}
	public int getCourseCount() {
		return courseCount;
	}
	public void setCourseCount(int courseCount) {
		this.courseCount = courseCount;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	public float getDiscount() {
		return discount;
	}
	public void setDiscount(float discount) {
		this.discount = discount;
	}
	public int getEffective() {
		return effective;
	}
	public void setEffective(int effective) {
		this.effective = effective;
	}
	public Date getReplayDate() {
		return replayDate;
	}
	public void setReplayDate(Date replayDate) {
		this.replayDate = replayDate;
	}
	public String getReplayUsername() {
		return replayUsername;
	}
	public void setReplayUsername(String replayUsername) {
		this.replayUsername = replayUsername;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public int getChargeType() {
		return chargeType;
	}
	public void setChargeType(int chargeType) {
		this.chargeType = chargeType;
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
