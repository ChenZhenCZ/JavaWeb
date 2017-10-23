package basexxp;

import java.util.List;

import bean.BankVo;
import bean.CashRecordVo;
import bean.CouponCode;
import bean.CourseVo;
import bean.PayRecordVo;
import bean.TeacherGrade;

public interface IBasexxp {
	//8.
	//public abstract List<BankVo> bankList();
	//13.
	public abstract List<PayRecordVo> findpayRecord(String userid);
	public abstract void payRecord(PayRecordVo payRecord);
	public abstract List<PayRecordVo> payRecordList(int pageInt, int pageSize);
	//��ȡ�γ�����
	public abstract CourseVo CourseById(String courseid);
	//�
	public abstract CouponCode couponCodeList(String parseInt);
	public abstract List<CouponCode> couponCodeUser(String userid);
	//��ʦ����
	public abstract float getM(String sql);
	public abstract TeacherGrade moneyGrade(String sql);
	//���ּ�¼
	public abstract void Cashadd(CashRecordVo cash);
}
