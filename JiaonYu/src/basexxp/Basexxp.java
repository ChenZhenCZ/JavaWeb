package basexxp;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import base.DBConn;
import bean.BankVo;
import bean.CashRecordVo;
import bean.CityVo;
import bean.CouponCode;
import bean.CourseVo;
import bean.PayRecordVo;
import bean.TeacherGrade;
import bean.TeacherVo;

public class Basexxp implements IBasexxp{
	//13
	public List<PayRecordVo> findpayRecord(String userid) {
		Connection conn= DBConn.openDB();
		List<PayRecordVo> list =new ArrayList<PayRecordVo>();
		try {
			Statement stmt =conn.createStatement();
			String sql="select * from  payRecord where userid="+userid;
			ResultSet rs =stmt.executeQuery(sql);
			System.out.println(sql);
			while(rs.next()){
				PayRecordVo payRecord=new PayRecordVo();
				payRecord.setPayRecordId(rs.getInt("pay_record_id"));
				payRecord.setUserid(rs.getInt("userid"));
				payRecord.setCourseid(rs.getInt("courseid"));
				payRecord.setPayOrReturn(rs.getInt("pay_or_return"));
				payRecord.setPayDate(rs.getDate("pay_date"));
				payRecord.setPayMoney(rs.getFloat("pay_money"));
				payRecord.setDiscountMoney(rs.getFloat("discount_money"));
				payRecord.setPayer(rs.getString("payer"));
				payRecord.setPayStatus(rs.getInt("pay_status"));
				payRecord.setIsCash(rs.getInt("isCash"));
				list.add(payRecord);
			}
			rs.close();
			stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	public void payRecord(PayRecordVo payRecord) {
		Connection conn=DBConn.openDB();
		try{
			Statement stat=conn.createStatement();
			String sql="insert into payRecord values('" +
				+payRecord.getUserid()+"','"
				+payRecord.getCourseid()+"','"
				+payRecord.getPayOrReturn()+"',getDate(),'"
				+payRecord.getPayMoney()+"','"
				+payRecord.getDiscountMoney()+"','"
				+payRecord.getPayer()+"','"
				+payRecord.getPayStatus()+"','"
				+payRecord.getIsCash()+"')";
			System.out.println(sql);
			stat.execute(sql);
		}catch(SQLException e){
			e.printStackTrace();
		}
	}
	public List<PayRecordVo> payRecordList(int pageInt, int pageSize) {
		// TODO Auto-generated method stub
		return null;
	}

	public CourseVo CourseById(String courseid) {
		Connection conn = DBConn.openDB();
		CourseVo msg =new CourseVo();
		try {
			Statement stmt = conn.createStatement();
			String sql = "select * from course where course_id="+courseid;
			System.out.println(sql);
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()){
				msg.setCourseId(rs.getInt("course_id"));
				msg.setCourseName(rs.getString("course_name"));
				msg.setPictureUrl(rs.getString("picture_url"));
				msg.setOneWord(rs.getString("one_word"));
				msg.setIntroduce(rs.getString("introduce"));
				msg.setTeacherId(rs.getInt("teacher_id"));
				msg.setCourseCount(rs.getInt("course_count"));
				msg.setPrice(rs.getInt("price"));
				msg.setDiscount(rs.getInt("discount"));
				msg.setEffective(rs.getInt("effective"));
				msg.setReplayDate(rs.getDate("replay_date"));
				msg.setReplayUsername(rs.getString("replay_username"));
				msg.setSeq(rs.getInt("seq"));
				msg.setChargeType(rs.getInt("charge_type"));
				msg.setStatus(rs.getInt("status"));
				msg.setReason(rs.getString("reason"));
			}
			rs.close();
			stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return msg;
	}
	public TeacherVo findteacherById(String teacherId) {
		Connection conn = DBConn.openDB();
		TeacherVo teacher= new TeacherVo();
		try {
			Statement stmt = conn.createStatement();
			String sql="select t.*,b.bankname from teacher t inner join bank b on t.bankid=b.bankid where teacherid="+teacherId;
			System.out.println(sql);
			ResultSet rs = stmt.executeQuery(sql);
			if(rs.next()){
				teacher.setTeacherId(rs.getInt("teacherId"));
				teacher.setTeacherIntroduce(rs.getString("teacherIntroduce").trim());
				teacher.setTeacherSpecial(rs.getString("teacherSpecial"));
				teacher.setTeacherLength(rs.getString("teacherLength").trim());
				teacher.setEducation(rs.getString("education"));
				teacher.setHeadPictureUrl(rs.getString("headPictureUrl").trim());
				teacher.setBankId(rs.getInt("bankId"));
				teacher.setAccountNo(rs.getString("accountNo"));
				teacher.setAccountName(rs.getString("accountName"));
				teacher.setGradeId(rs.getInt("gradeId"));
				teacher.setStatus(rs.getInt("status"));
				teacher.setReason(rs.getString("reason"));
				teacher.setBankName(rs.getString("bankname"));
			}
			rs.close();
			stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return teacher;
	}
	public CouponCode couponCodeList(String courseId){

		Connection conn = DBConn.openDB();
		CouponCode code= null;
		try {
			Statement stmt = conn.createStatement();
			String sql = "select top 1 * from couponCode where status=0 and couponRecordId in (select couponRecordId from couponRecord where userid=(select userid from course where course_id="+courseId+"));";
			System.out.println(sql);
			ResultSet rs = stmt.executeQuery(sql);
			if(rs.next()){
				code= new CouponCode();
				code.setCouponCodeId(rs.getInt("couponCode"));
				code.setCouponRecordId(rs.getInt("couponRecordId"));
				code.setUserid(rs.getInt("userid"));
				code.setCode(rs.getString("code"));
				code.setCouponMoney(rs.getInt("couponMoney"));
				code.setStatus(rs.getInt("status"));
				code.setValidDay(rs.getInt("validDay"));
				code.setUseDate(rs.getString("useDate"));
			}
			rs.close();
			stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return code;
	}

	public List<CouponCode> couponCodeUser(String sql) {
			Connection conn = DBConn.openDB();
			List<CouponCode> list = new ArrayList<CouponCode>();
			try {
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(sql);
				while(rs.next()){
					CouponCode code= new CouponCode();
					code.setCouponCodeId(rs.getInt("couponCode"));
					code.setCouponRecordId(rs.getInt("couponRecordId"));
					code.setUserid(rs.getInt("userid"));
					code.setCode(rs.getString("code"));
					code.setCouponMoney(rs.getInt("couponMoney"));
					code.setStatus(rs.getInt("status"));
					code.setValidDay(rs.getInt("validDay"));
					code.setUseDate(rs.getString("useDate"));
					list.add(code);
				}
				rs.close();
				stmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return list;
		}
//讲师收入
	public float m=0;
	public List<PayRecordVo> money(String sql) {
		Connection conn = DBConn.openDB();
		List<PayRecordVo> list = new ArrayList<PayRecordVo>();
		try {
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			m=0;
			while(rs.next()){
				PayRecordVo money= new PayRecordVo();
				money.setPayMoney(rs.getFloat("pay_money"));
				m+=rs.getFloat("pay_money");
				list.add(money);
			}
			rs.close();
			stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	public float getM(String sql) {
		//用连接池创建数据库连接
		money(sql);
		return m;
	}
	public TeacherGrade moneyGrade(String sql) {
		//用连接池创建数据库连接
		Connection conn=DBConn.openDB();
		TeacherGrade grade =new TeacherGrade();
		try {
			Statement stmt =conn.createStatement();
			ResultSet rs =stmt.executeQuery(sql);
			if(rs.next()){
				grade.setGradePercent(rs.getFloat("grade_Percent"));
			}
			rs.close();
			stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return grade;
	}
	public void Cashadd(CashRecordVo cash) {
		Connection conn= DBConn.openDB();
		try {
			Statement stmt =conn.createStatement();
String sql="insert into CashRecord values("+cash.getTeacherId()
+",getdate(),'"+cash.getPayMoney()+"','"+cash.getIncomMoney()+"',0,'无')";
			stmt.executeUpdate(sql);
			stmt.close();
		}catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
}
