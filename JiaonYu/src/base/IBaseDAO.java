package base;

import java.util.List;

import bean.BankVo;
import bean.CashRecordVo;
import bean.CityVo;
import bean.CouponCode;
import bean.CouponRecord;
import bean.CourseVo;
import bean.ForumVo;
import bean.ManagerVo;
import bean.MycourseVo;
import bean.NewMsgVo;
import bean.PageVo;
import bean.ProVo;
import bean.SectionVo;
import bean.TeacherGrade;
import bean.TeacherVo;
import bean.UersVo;
import bean.UserCourseEvalVo;

public interface IBaseDAO {
	//城市表
	public abstract void  Cityadd(CityVo city);
	public abstract void  CityUpdate(CityVo city);
	public abstract void  CityDel(int Cityid);
	public abstract List<CityVo>  CityList();
	public abstract List<ProVo> ProvoList();
	CityVo Cityup(String Cityid);
	
	//教师等级表
	public abstract void  gradeadd(TeacherGrade grade);
	public abstract void  gradeUpdate(TeacherGrade grade);
	public abstract void  gradeDel(int gradeid);
	public abstract List<TeacherGrade>  gradeList();
	TeacherGrade gradeup(String gradeid);
	
	//分页
	public abstract int getCount(String sql);
	public abstract List<CityVo>  CityList(int pageInt,int pageSize);
	
	//管理
	public abstract void  Manageradd(ManagerVo Manager);
	public abstract void  ManagerUpdate(ManagerVo Manager);
	public abstract void  ManagerDel(int Managerid);
	public abstract List<ManagerVo>  managerList();
	public abstract List<ManagerVo> findManagerByPage(int pageSize,int startPos);
	ManagerVo Managerup(String Managerid);
	public abstract boolean falselise(String Managerid,String nopwd);//判断密码是否真
	public abstract void  falseaup(String Managerid,String newpwd);//修改密码
	public abstract void stutaup(String Managerid,String stuta);
	public abstract ManagerVo login(String name,String pwd);
	
	//用户管理
	public abstract List<CityVo>  CityList(int Provinceid);
	public abstract void uersadd(UersVo uers) throws Exception;
	public abstract void uersdel(int userid);
	UersVo uersup(int userid);
	public abstract void uersupde(UersVo Uers);
	public abstract List<UersVo> findUserByPage1(int pageSize,int startPos);
	public abstract UersVo login1(String name,String pwd);
	
	//省份表
	public abstract void  propadd(ProVo prop);
	public abstract void propUpdate(ProVo prop);
	public abstract void propDel(int propid);
	public abstract List<ProVo>  propList();
	ProVo propup(String Propid);
	public abstract List<ProVo> Page(int pageSize,int startPos);
	
	//新闻公告
	public abstract void newsMsgAdd(NewMsgVo msg);
	public abstract List<NewMsgVo> newsMsgList(int pageSize,int startPos);
	
	//课程表
	public abstract void  courseAdd(CourseVo con);
	public abstract List<CourseVo> courseList(int pageSize,int startPos);
	public abstract List<CourseVo>  coursewode(String id);
	public abstract List<CourseVo>  coursewode1(String sql);
	
	//申请讲师
	public abstract void teacherAdd(TeacherVo teacher);
	public abstract void teacherUpdate(TeacherVo teacher);
	public abstract List<TeacherVo> teacherList(int pageSize,int startPos);
	public abstract TeacherVo findteacherById(String teacherId);
	public int getCount2(String strtable);
	public abstract List<BankVo> bankList();
	public abstract boolean teacherIsExist(int teacherId);
	public abstract void teacherAudit(TeacherVo teacher);
	//课程
	public abstract List<CourseVo> courseList(int teacherId,int pageSize,int startPos);
	public abstract List<SectionVo> sectionList(int courseId,int pageSize,int startPos);
	public abstract void sectionAdd(SectionVo section);
	public abstract SectionVo findSectionById(String sectionid);
	//课程审核
	public abstract CourseVo courseven(String id);
	public abstract void courseven1(String id,String name,String ti);
	//课程停售
	public abstract void ckup(String sql);
	//章节审核
	public abstract List<SectionVo> conlist(String sql);

	//充值金额
	public abstract void chz(String sql);
	//提现记录
	public abstract List<CashRecordVo> Cashlist(String sql);
	//优惠劵
	public abstract void couponRecordAdd(CouponRecord coupon);
	public abstract List<CouponRecord> couponRecordList(int teacherId,int pageSize,int startPos);
	public abstract List<CouponRecord> couponRecordList(int pageSize,int startPos);
	public abstract void couponCodeAdd(int recordid,int money,int day,int count);
	public abstract List<CouponCode> couponCodeList(int couponRecordId);
	//评价
	public abstract  List<UserCourseEvalVo> Evelyn(String id);
	//在线留言板
	public abstract List<ForumVo> Forlist(String sql);
	
}	
