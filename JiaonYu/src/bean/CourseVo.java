package bean;

import java.io.Serializable;
import java.util.Date;
//10��	�γ̱�(Course)
public class CourseVo implements Serializable{
	private int courseId;//�γ�id
	private String courseName;//�γ�����
	private String pictureUrl;//�γ�ͼƬ��ַ
	private String oneWord;//һ�仰
	private String introduce;//�γ̽���
	private int teacherId;//��ʦid
	private int courseCount;//��ʱ��
	private float price;//�۸�
	private float discount;//�ۿ�
	private int effective;//��Ч��(0����Ч��1����Ч)
	private Date replayDate;//����ʱ��
	private String replayUsername;//������
	private int seq;//����(�����ǰ���*10)
	private int chargeType;//�շ�����0��ѣ�1��Ա
	private int status;//0:δ��ˣ�1������ˣ�2.���δͨ��
	private String reason;//δͨ��ԭ��
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
