package bean;

import java.io.Serializable;
//8��ע�ὲʦ��Teacher��
public class TeacherVo implements Serializable{
	private int teacherId;//��ʦid
	private String teacherIntroduce;//��ʦ���
	private String teacherSpecial;//��ѧ�س�(�ó���Ŀ)
	private String teacherLength;//����
	private String education;//ѧ��
	private String headPictureUrl;//ͷ��ͼƬ��ַ
	private int bankId;//����id
	private String accountNo;//�����˻�
	private String accountName;//����������
	private int gradeId;//��ʦ����
	private int status;//0:δ��ˣ�1������ˣ�2.���δͨ����3.���
	private String reason;//δͨ��ԭ��
	private String bankName;//δͨ��ԭ��
	private String gradeName;
	public int getTeacherId() {
		return teacherId;
	}
	public void setTeacherId(int teacherId) {
		this.teacherId = teacherId;
	}
	public String getTeacherIntroduce() {
		return teacherIntroduce;
	}
	public void setTeacherIntroduce(String teacherIntroduce) {
		this.teacherIntroduce = teacherIntroduce;
	}
	public String getTeacherSpecial() {
		return teacherSpecial;
	}
	public void setTeacherSpecial(String teacherSpecial) {
		this.teacherSpecial = teacherSpecial;
	}
	public String getTeacherLength() {
		return teacherLength;
	}
	public void setTeacherLength(String teacherLength) {
		this.teacherLength = teacherLength;
	}
	public String getEducation() {
		return education;
	}
	public void setEducation(String education) {
		this.education = education;
	}
	public String getHeadPictureUrl() {
		return headPictureUrl;
	}
	public void setHeadPictureUrl(String headPictureUrl) {
		this.headPictureUrl = headPictureUrl;
	}
	public int getBankId() {
		return bankId;
	}
	public void setBankId(int bankId) {
		this.bankId = bankId;
	}
	public String getAccountNo() {
		return accountNo;
	}
	public void setAccountNo(String accountNo) {
		this.accountNo = accountNo;
	}
	public String getAccountName() {
		return accountName;
	}
	public void setAccountName(String accountName) {
		this.accountName = accountName;
	}
	public int getGradeId() {
		return gradeId;
	}
	public void setGradeId(int gradeId) {
		this.gradeId = gradeId;
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
	public String getBankName() {
		return bankName;
	}
	public void setBankName(String bankName) {
		this.bankName = bankName;
	}
	public String getGradeName() {
		return gradeName;
	}
	public void setGradeName(String gradeName) {
		this.gradeName = gradeName;
	}
}
