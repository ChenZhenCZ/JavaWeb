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
	//获取课程内容
	public abstract CourseVo CourseById(String courseid);
	//活动
	public abstract CouponCode couponCodeList(String parseInt);
	public abstract List<CouponCode> couponCodeUser(String userid);
	//讲师收入
	public abstract float getM(String sql);
	public abstract TeacherGrade moneyGrade(String sql);
	//提现记录
	public abstract void Cashadd(CashRecordVo cash);
}
