package base;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import org.omg.CORBA.Request;

import com.sun.java_cup.internal.sym;

import basexxp.Basexxp;
import basexxp.IBasexxp;
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
import bean.PayRecordVo;
import bean.ProVo;
import bean.SectionVo;
import bean.TeacherGrade;
import bean.TeacherVo;
import bean.UersVo;
import bean.UserCourseEvalVo;

public class BaseDAOimp implements IBaseDAO{
	public void CityDel(int Cityid) {
		Connection conn= DBConn.openDB();
		List<CityVo> list =new ArrayList<CityVo>();
		try {
			Statement stmt =conn.createStatement();
			String sql="delete city where cityid="+Cityid;
			stmt.executeUpdate(sql);
			stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	public List<CityVo> CityList() {
		Connection conn= DBConn.openDB();
		List<CityVo> list =new ArrayList<CityVo>();
		try {
			Statement stmt =conn.createStatement();
			String sql="select c.*,p.provinceName from city c inner join province p on c.provinceid=p.provinceid order by c.provinceid,c.cityid";
			ResultSet rs =stmt.executeQuery(sql);
			while(rs.next()){
				CityVo City=new CityVo();
				City.setCityid(rs.getInt("cityid"));
				City.setProvinceid(rs.getInt("provinceid"));
				City.setCityname(rs.getString("cityname"));
				City.setProvincename(rs.getString("provincename"));
				list.add(City);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	public void CityUpdate(CityVo city) {
		Connection conn= DBConn.openDB();
		try {
			Statement stmt =conn.createStatement();
			String sql="update city set cityname='"+city.getCityname()+"',provinceid="+city.getProvinceid()+" where cityid="+city.getCityid();
			System.out.println(sql);
			stmt.executeUpdate(sql);
			stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	public void Cityadd(CityVo city) {
		Connection conn= DBConn.openDB();
		List<CityVo> list =new ArrayList<CityVo>();
		try {
			Statement stmt =conn.createStatement();
			String sql="insert into city values('"+city.getCityname()+"',"+city.getProvinceid()+")";
			stmt.executeUpdate(sql);
			stmt.close();
		}catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	//获取省份数据
	public List<ProVo> ProvoList() {
		Connection conn = DBConn.openDB();
		List<ProVo> list = new ArrayList<ProVo>();
		try {
			Statement stmt = conn.createStatement();
			String sql = "select * from Province";
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()){
				ProVo prov= new ProVo();
				prov.setProvinceid(rs.getInt("provinceid"));
				prov.setProvincename(rs.getString("provincename").trim());
				list.add(prov);
			}
			rs.close();
			stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;	
	}
	public CityVo Cityup(String Cityid) {
		Connection conn= DBConn.openDB();
		CityVo city =null;
		try {
			Statement stmt =conn.createStatement();
			String sql="select * from  city where cityid="+Cityid;
			ResultSet rs =stmt.executeQuery(sql);
			System.out.println(sql);
			if(rs.next()){
				city=new CityVo();
				city.setCityid(rs.getInt("cityid"));
				city.setCityname(rs.getString("cityname"));
				city.setProvinceid(rs.getInt("provinceid"));
			}
			rs.close();
			stmt.close();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return city;
	}

	public void gradeDel(int gradeid) {
		//通过数据源连接
		Connection conn= DanConn.openDB();
		try {
			Statement stmt =conn.createStatement();
			String sql="delete teacherGrade where grade_id="+gradeid;
			stmt.executeUpdate(sql);
			stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	public List<TeacherGrade> gradeList() {
			
		//用连接池创建数据库连接
		Connection conn=DBConn.openDB();
		List<TeacherGrade> list =new ArrayList<TeacherGrade>();
		try {
			Statement stmt =conn.createStatement();
			String sql="select *from teacherGrade";
			ResultSet rs =stmt.executeQuery(sql);
			while(rs.next()){
				TeacherGrade grade=new TeacherGrade();
				grade.setGradeid(rs.getInt("grade_id"));
				grade.setGradename(rs.getString("grade_name"));
				grade.setGradePercent(rs.getFloat("grade_Percent"));
				list.add(grade);
			}
			rs.close();
			stmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	public void gradeUpdate(TeacherGrade grade) {
		Connection conn= DBConn.openDB();
		try {
			Statement stmt =conn.createStatement();
			String sql="update teacherGrade set  grade_name='"+grade.getGradename()+"',grade_Percent="+grade.getGradePercent()+"  where grade_id="+grade.getGradeid();
			System.out.println(sql);
			stmt.executeUpdate(sql);
			stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
	}

	public void gradeadd(TeacherGrade grade) {
		Connection conn=DBConn.openDB();
		List<TeacherGrade> list =new ArrayList<TeacherGrade>();
		try {
			Statement stmt =conn.createStatement();
			String sql="insert into teacherGrade values('"+grade.getGradename()+"',"+grade.getGradePercent()+");";
			stmt.executeUpdate(sql);
			stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	public TeacherGrade gradeup(String gradeid) {
		//用连接池创建数据库连接
		Connection conn=DBConn.openDB();
		TeacherGrade grade =new TeacherGrade();
		try {
			Statement stmt =conn.createStatement();
			String sql="select *from teacherGrade where grade_id="+gradeid;
			ResultSet rs =stmt.executeQuery(sql);
			if(rs.next()){
				grade.setGradeid(rs.getInt("grade_id"));
				grade.setGradename(rs.getString("grade_name"));
				grade.setGradePercent(rs.getFloat("grade_Percent"));
			}
			rs.close();
			stmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return grade;
	}
	//分页
	public List<CityVo> CityList(int pageInt, int pageSize) {
		Connection conn= DBConn.openDB();
		List<CityVo> list =new ArrayList<CityVo>();
		try {
			Statement stmt =conn.createStatement();
			String sql = "select top "+pageSize+" c.*,p.provinceName from city c inner join Province p on c.provinceId=p.provinceId ";
			sql += " where cityid not in(select top "+pageInt+" cityid from city order by provinceId,cityId)  order by c.provinceId,c.cityId";
			System.out.println(sql);
			ResultSet rs =stmt.executeQuery(sql);
			while(rs.next()){
				CityVo City=new CityVo();
				City.setCityid(rs.getInt("cityid"));
				City.setProvinceid(rs.getInt("provinceid"));
				City.setCityname(rs.getString("cityname"));
				City.setProvincename(rs.getString("provincename"));
				list.add(City);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}
	//获取记录总数
	public int getCount(String sql) {
		Connection conn =DBConn.openDB();
		int cnd=0;
		try {
			Statement stmt =conn.createStatement();
			ResultSet rs =stmt.executeQuery(sql);
			while(rs.next()){
				cnd=rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cnd;
	}

	public void ManagerDel(int Managerid) {
		Connection conn=DBConn.openDB();
		try {
			Statement smts=conn.createStatement();
			String sql="delete manager where manager_id="+Managerid;
			smts.executeUpdate(sql);
			smts.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	public List<ManagerVo> managerList() {
		
		return null;
	}

	public void ManagerUpdate(ManagerVo Manager) {
		Connection conn=DBConn.openDB();
		try {
			Statement smts=conn.createStatement();
			String sql="update  manager set manager_account='"+Manager.getManagerAccount()+"', ";
			sql+="manager_name='"+Manager.getManagerName()+"', ";
			sql+="sex="+Manager.getSex()+", ";
			sql+="contact='"+Manager.getContact()+"' ";
			sql+=" where manager_id="+Manager.getManagerId();
			smts.executeUpdate(sql);
			smts.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	//新增
	public void Manageradd(ManagerVo Manager) {
		Connection conn = DBConn.openDB();
		try {
			Statement stmt = conn.createStatement();
			String sql = "insert into manager values(";
			sql += "'"+Manager.getManagerAccount() +"',";
			sql += "'"+Manager.getManagerPassword()+"',";
			sql += "'"+Manager.getManagerName()+"',";
			sql += "'"+Manager.getSex()+"',";
			sql += "'"+Manager.getContact()+"',statu='1'";
			sql += ")";
			System.out.println(sql);
			stmt.executeUpdate(sql);
			stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	public ManagerVo Managerup(String Managerid) {
		Connection conn=DBConn.openDB();
		ManagerVo manager=new ManagerVo();
		try {
			
			Statement smts=conn.createStatement();
			String sql="select * from manager where manager_Id="+Managerid;
			ResultSet rs =smts.executeQuery(sql);
			if(rs.next()){
				manager.setManagerId(rs.getInt("manager_Id"));
				manager.setManagerAccount(rs.getString("manager_Account"));
				manager.setManagerName(rs.getString("manager_Name"));
				manager.setSex(rs.getInt("sex"));
				manager.setContact(rs.getString("contact"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return manager;
	}
	//查询
	public List<ManagerVo> findManagerByPage(int pageSize, int startPos) {
		Connection conn = DBConn.openDB();
		List<ManagerVo> list = new ArrayList<ManagerVo>();
		try {
			Statement stmt = conn.createStatement();
			String sql = "select top "+pageSize+" * from manager where manager_id not in(select top "+startPos+" manager_id from manager)";
			System.out.println(sql);
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()){
				ManagerVo manager= new ManagerVo();
				manager.setManagerId(rs.getInt("manager_Id"));
				manager.setManagerAccount(rs.getString("manager_Account").trim());
				manager.setManagerPassword(rs.getString("manager_Password").trim());
				manager.setManagerName(rs.getString("manager_Name").trim());
				manager.setSex(rs.getInt("sex"));
				manager.setStatu(rs.getInt("statu"));
				manager.setContact(rs.getString("contact").trim());
				list.add(manager);
			}
			rs.close();
			stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	public void falseaup(String Managerid, String newpwd) {//修改密码
		Connection conn =DBConn.openDB();
		try {
			Statement stmt=conn.createStatement();
			String	sql="update manager set manager_password='"+newpwd+"' where manager_id="+Managerid;
			System.out.println(sql);
			stmt.executeUpdate(sql);
			stmt.close();
		} catch(SQLException e) {
			e.printStackTrace();
		}
		
		
		
	}

	public boolean falselise(String Managerid, String nopwd) {//判断密码是否真
		boolean stu=false;
		Connection  conn=DBConn.openDB();
		try {
			Statement stmt=conn.createStatement();
			String sql = "select * from manager where manager_id="+Managerid+"  and  manager_password='"+nopwd +"'";
			System.out.println(sql);
			ResultSet rs=stmt.executeQuery(sql);
			if(rs.next()){
				stu=true;
			}
			rs.close();
			stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return stu;
	}

	public void stutaup(String Managerid, String stuta) {//修改状态
		Connection conn =DBConn.openDB();
		try {
			Statement stmt=conn.createStatement();
			String	sql="update manager set statu="+stuta+" where manager_id="+Managerid;
			stmt.executeUpdate(sql);
			stmt.close();
		} catch(SQLException e) {
			e.printStackTrace();
		}
		
	}

	public List<CityVo> CityList(int Provinceid) {
		Connection conn= DBConn.openDB();
		List<CityVo> list =new ArrayList<CityVo>();
		try {
			Statement stmt =conn.createStatement();
			String sql="select * from city where provinceid="+Provinceid;
			ResultSet rs =stmt.executeQuery(sql);
			while(rs.next()){
				CityVo City=new CityVo();
				City.setCityid(rs.getInt("cityid"));
				City.setProvinceid(rs.getInt("provinceid"));
				City.setCityname(rs.getString("cityname"));
				list.add(City);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	//管理员登录
	public ManagerVo login(String name, String pwd) {
		Connection conn=DBConn.openDB();
		ManagerVo manager=new ManagerVo();
		try {
			Statement stmt=conn.createStatement();
			String sql="select * from manager where manager_Account='"+name +"' and manager_Password='"+pwd +"' and statu=1";
			ResultSet rs=stmt.executeQuery(sql);
			if(rs.next()){
				manager.setManagerId(rs.getInt("manager_Id"));
				manager.setManagerAccount(rs.getString("manager_Account"));
				manager.setManagerPassword(rs.getString("manager_Password"));
				manager.setManagerName(rs.getString("manager_Name"));
				manager.setSex(rs.getInt("sex"));
				manager.setContact(rs.getString("contact"));
				manager.setStatu(rs.getInt("statu"));
			}else{
				manager=null;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return manager;
	
	}
	//用户
	public void uersadd(UersVo uers) throws Exception {
			Connection conn=DBConn.openDB();
		
			Statement stmt=conn.createStatement();
			String sql = "insert into users values(";
			sql+="'"+uers.getMobile()+"',";
			sql+="'"+uers.getPassword()+"',";
			sql+="'"+uers.getUsersName()+"',";
			sql+="'"+uers.getSex()+"',";
			sql+="'"+uers.getHomeAddress()+"',";
			sql+="'"+uers.getEmail()+"',getdate(),";
			sql+="'"+uers.getProvinceId()+"',";
			sql+="'"+uers.getCityId()+"',";
			sql+="'"+uers.getUserType()+"',";
			sql+="'"+uers.getRemainMoney()+"')";
			System.out.println(sql);
			stmt.executeUpdate(sql);
			stmt.close();
	}

	public List<UersVo> findUserByPage1(int pageSize, int startPos) {
		Connection conn=DBConn.openDB();
		List<UersVo> list =new ArrayList<UersVo>();
		try {
			Statement stmt=conn.createStatement();
			String sql="select top "+pageSize+"  userid,mobile,users_name,sex,home_address,email,register_date,user_type,isnull(p.provinceName,'未知') provinceName,isnull(c.cityName,'未知') cityName from users u left join province p on u.province_id=p.provinceid left join city c on u.city_id=c.cityid ";
			sql+="where userid not in (select top "+startPos+"  userid from users) order by userid";
			System.out.println(sql);
			ResultSet rs=stmt.executeQuery(sql);
		while(rs.next()){
			UersVo user= new UersVo();
			user.setUserid(rs.getInt("userid"));
			user.setMobile(rs.getString("mobile").trim());
			user.setUsersName(rs.getString("users_name"));
			user.setSex(rs.getInt("sex"));
			user.setHomeAddress(rs.getString("home_address").trim());
			user.setEmail(rs.getString("email"));
			user.setRegisterDate(rs.getDate("register_date"));
			user.setUserType(rs.getInt("user_type"));
			user.setProvinceName(rs.getString("provinceName"));
			user.setCityName(rs.getString("cityName"));
			list.add(user);
		}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	public void uersdel(int userid) {
		Connection conn=DBConn.openDB();
		try {
			Statement stmt =conn.createStatement();
			String sql="delete users where userid="+userid;
			stmt.executeUpdate(sql);
			stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	public UersVo uersup(int userid) {
		Connection conn= DBConn.openDB();
		UersVo users =null;
		try {
			Statement stmt =conn.createStatement();
			String sql="select * from  users where userid="+userid;
			ResultSet rs =stmt.executeQuery(sql);
			System.out.println(sql);
			if(rs.next()){
				users=new UersVo();
				users.setUserid(rs.getInt("userid"));
				users.setMobile(rs.getString("mobile").trim());
				users.setUsersName(rs.getString("users_name"));
				users.setSex(rs.getInt("sex"));
				users.setHomeAddress(rs.getString("home_address").trim());
				users.setEmail(rs.getString("email"));
				users.setRemainMoney(rs.getFloat("remainMoney"));
			}
			rs.close();
			stmt.close();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return users;
	}
	public void uersupde(UersVo Uers) {
		Connection conn= DBConn.openDB();
		try {
			Statement stmt =conn.createStatement();
			String sql="update users set mobile='"+Uers.getMobile()+"'," +
					"users_Name='"+Uers.getUsersName()+"',"+
					"sex='"+Uers.getSex()+"',"+
					"home_Address='"+Uers.getHomeAddress()+"',"+
					"email='"+Uers.getEmail()+"' "+
					"where userid="+Uers.getUserid();
			System.out.println(sql);
			stmt.executeUpdate(sql);
			stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	//学生登录
	public UersVo login1(String name, String pwd) {
		Connection conn=DBConn.openDB();
		UersVo Uers=null;
		try {
			Statement stmt=conn.createStatement();
			String sql="select * from Users where mobile='"+name +"' and password='"+pwd +"'";
			ResultSet rs=stmt.executeQuery(sql);
			System.out.println(sql);
			if(rs.next()){
				Uers=new  UersVo();
				Uers.setUserid(rs.getInt("userid"));
				Uers.setMobile(rs.getString("mobile"));
				Uers.setUsersName(rs.getString("users_Name"));
				Uers.setSex(rs.getInt("sex"));
				Uers.setHomeAddress(rs.getString("home_Address"));
				Uers.setEmail(rs.getString("email"));
				Uers.setRegisterDate(rs.getDate("register_Date"));
				Uers.setUserType(rs.getInt("user_type"));
				Uers.setRemainMoney(rs.getFloat("remainMoney"));
			}
			rs.close();
			stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return Uers;
	
	}
	
    //省份表
	//删除
	public void propDel(int propid) {
		Connection conn=DBConn.openDB();
		try {
			Statement stmt =conn.createStatement();
			String sql="delete Province where provinceid="+propid;
			stmt.executeUpdate(sql);
			stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	//查询所有省份
	public List<ProVo> propList() {
		Connection conn=DBConn.openDB();
		List<ProVo> list =new ArrayList<ProVo>();
		try {
			Statement stmt =conn.createStatement();
			String sql = "select * from Province";
			System.out.println(sql);
			ResultSet rs =stmt.executeQuery(sql);
			while(rs.next()){
				ProVo prop=new ProVo();
				prop.setProvinceid(rs.getInt("provinceid"));
				prop.setProvincename(rs.getString("provincename"));
				list.add(prop);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	//修改2
	public void propUpdate(ProVo prop) {
	
		
	}
	//新增
	public void propadd(ProVo prop) {
		Connection conn=DBConn.openDB();
		try {
			Statement stmt =conn.createStatement();
			String sql="insert into Province values('"+prop.getProvincename()+"')";
			System.out.println(sql);
			stmt.executeUpdate(sql);
			stmt.close();
		}catch (SQLException e) {
			e.printStackTrace();
		}
	}
	//修改1
	public ProVo propup(String Propid) {
		return null;
	}
	//分页
	public List<ProVo> Page(int pageSize, int startPos) {
		return null;
	}

	
	//新闻公告
	public void newsMsgAdd(NewMsgVo msg) {
		Connection conn=DBConn.openDB();
		try {
			Statement stmt=conn.createStatement();
			String sql="insert into newmsg values('" +
					""+msg.getMsgName()+"'," +
					"'"+msg.getOneWord()+"',"+
					"'"+msg.getMsgContent()+"',"+
					"'"+msg.getMsgContentUrl()+"',"+
					"'"+msg.getPublishDate()+"',"+
					"'"+msg.getPublishUsername()+"',"+
					"'"+msg.getEffective()+"',"+
					"'"+msg.getSeq()+"',"+
					"'"+msg.getNewsType()+"',"+
					"'"+msg.getImageUrl()+"'"+
					")";
			
			stmt.executeUpdate(sql);
			System.out.println(sql);
			stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	public List<NewMsgVo> newsMsgList(int pageSize, int startPos) {
		Connection conn = DBConn.openDB();
		List<NewMsgVo> list = new ArrayList<NewMsgVo>();
		try {
			Statement stmt = conn.createStatement();
			String sql = "select top "+pageSize+" new_msg_id,msg_name,one_word,msg_content,msg_content_url,publish_date,publish_username,effective,seq,newsType,image_Url from NewMsg ";
			sql += " where new_msg_id not in(select top "+startPos +" new_msg_id from NewMsg order by seq desc) order by seq desc";
			System.out.println(sql);
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()){
				NewMsgVo msg= new NewMsgVo();
				msg.setNewMsgId(rs.getInt("new_msg_id"));
				msg.setMsgName(rs.getString("msg_name").trim());
				msg.setOneWord(rs.getString("one_word"));
				msg.setMsgContent(rs.getString("msg_content"));
				msg.setMsgContentUrl(rs.getString("msg_content_url").trim());
				msg.setPublishDate(rs.getString("publish_date"));
				msg.setPublishUsername(rs.getString("publish_username"));
				msg.setEffective(rs.getInt("effective"));
				msg.setSeq(rs.getInt("seq"));
				msg.setNewsType(rs.getInt("newsType"));
				msg.setImageUrl(rs.getString("image_Url"));
				list.add(msg);
			}
			rs.close();
			stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	//课程表
	public void courseAdd(CourseVo con) {//发布课程
		Connection conn=DBConn.openDB();
		try {
			Statement stmt=conn.createStatement();
			String sql="insert into course values('" +
					""+con.getCourseName()+"'," +
					"'"+con.getPictureUrl()+"',"+
					"'"+con.getOneWord()+"',"+
					"'"+con.getIntroduce()+"',"+
					"'"+con.getTeacherId()+"',"+
					"'"+con.getCourseCount()+"',"+
					"'"+con.getPrice()+"',"+
					"'"+con.getDiscount()+"',"+
					"'"+con.getEffective()+"',"+
					"getDate(),"+
					"'"+con.getReplayUsername()+"',"+
					"'"+con.getSeq()+"',"+
					"'"+con.getChargeType()+"',"+
					"'"+con.getStatus()+"',"+
					"'"+con.getReason()+"'"+
					")";
			
			stmt.executeUpdate(sql);
			System.out.println(sql);
			stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	//我的课程
	public List<CourseVo> coursewode(String id) {
		Connection conn = DBConn.openDB();
		List<CourseVo> list = new ArrayList<CourseVo>();
		try {
			Statement stmt = conn.createStatement();
			String sql = "select * from course  where  teacher_id="+id;
			System.out.println(sql);
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()){
				CourseVo msg= new CourseVo();
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
				list.add(msg);
			}
			rs.close();
			stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	public List<CourseVo> coursewode1(String sql) {
		Connection conn = DBConn.openDB();
		List<CourseVo> list = new ArrayList<CourseVo>();
		try {
			Statement stmt = conn.createStatement();
			System.out.println(sql);
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()){
				CourseVo msg= new CourseVo();
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
				list.add(msg);
			}
			rs.close();
			stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	

	public List<CourseVo> courseList(int pageSize, int startPos) {
		Connection conn = DBConn.openDB();
		List<CourseVo> list = new ArrayList<CourseVo>();
		try {
			Statement stmt = conn.createStatement();
			String sql = "select top "+pageSize+" " +
			"course_id,course_name,picture_url,one_word,introduce,teacher_id,course_count" +
			",price,discount,effective,replay_date,replay_username,seq,charge_type,status,reason  from course ";
			sql += " where course_id not in(select top "+startPos +" course_id from course order by seq desc) order by seq desc";
			System.out.println(sql);
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()){
				CourseVo msg= new CourseVo();
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
				list.add(msg);
			}
			rs.close();
			stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public int getCount2(String strtable) {
		String sql="select count(*) cnt from "+strtable;
		Connection conn=DBConn.openDB();
		int cnt=0;
		try{
			Statement stat=conn.createStatement();
			ResultSet rs=stat.executeQuery(sql);
			if(rs.next()){
				cnt=rs.getInt("cnt");
			}
			rs.close();
			stat.close();
		}catch(SQLException e){
			e.printStackTrace();
		}
		return cnt;
	}

	public List<CourseVo> courseList(int teacherId,int pageSize,int startPos){
		Connection conn = DBConn.openDB();
		List<CourseVo> list = new ArrayList<CourseVo>();
		try {
			Statement stmt = conn.createStatement();
			String sql = "select top "+pageSize+" * from course  ";
			sql += " where teacher_id="+teacherId+" and  course_id not in(select top "+startPos +" course_id from course where teacher_id="+teacherId+" order by course_id) order by course_id";
			System.out.println(sql);
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()){
				CourseVo course= new CourseVo();
				course.setCourseId(rs.getInt("course_id"));
				course.setCourseName(rs.getString("course_name").trim());
				course.setPictureUrl(rs.getString("picture_url"));
				course.setIntroduce(rs.getString("introduce"));
				course.setCourseCount(rs.getInt("course_count"));
				course.setPrice(rs.getFloat("price"));
				course.setDiscount(rs.getFloat("discount"));
				course.setEffective(rs.getInt("effective"));
				course.setReplayDate(rs.getDate(("replay_date")));
				course.setSeq(rs.getInt("seq"));
				course.setChargeType(rs.getInt("charge_type"));
				course.setStatus(rs.getInt("status"));
				course.setReason(rs.getString("reason"));
				list.add(course);
			}
			rs.close();
			stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	public List<SectionVo> sectionList(int courseId,int pageSize,int startPos){
		Connection conn = DBConn.openDB();
		List<SectionVo> list = new ArrayList<SectionVo>();
		try {
			Statement stmt = conn.createStatement();
			String sql = "select top "+pageSize+" * from section  ";
			sql += " where course_id="+courseId+" and  section_id not in(select top "+startPos +" section_id from section where course_id="+courseId+" order by section_id) order by section_id";
			System.out.println(sql);
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()){
				SectionVo section= new SectionVo();
				section.setSectionId(rs.getInt("section_id"));
				section.setCourseId(rs.getInt("course_id"));
				section.setSectionName(rs.getString("section_name").trim());
				section.setSectionUrl(rs.getString("section_url"));
				section.setSectionContent(rs.getString("section_content"));
				section.setFree(rs.getInt("free"));
				section.setSeq(rs.getInt("seq"));
				section.setStatus(rs.getInt("status"));
				section.setReason(rs.getString("reason"));
				list.add(section);
			}
			rs.close();
			stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	public void sectionAdd(SectionVo section){
		Connection conn = DBConn.openDB();
		try {
			Statement stmt = conn.createStatement();
			String sql = "insert into section values(";
			sql += "'"+section.getCourseId() +"',";
			sql += "'"+section.getSectionName()+"',";
			sql += "'"+section.getSectionUrl()+"',";
			sql += "'"+section.getSectionContent()+"',";
			sql += "'"+section.getFree()+"',";
			sql += "'"+section.getSeq()+"',";
			sql += "'"+section.getStatus()+"',";
			sql += "'"+section.getReason()+"'";
			sql += ")";
			System.out.println(sql);
			stmt.executeUpdate(sql);
			stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public SectionVo findSectionById(String sectionid){
		Connection conn = DBConn.openDB();
		SectionVo section= new SectionVo();
		try {
			Statement stmt = conn.createStatement();
			String sql = "select * from section where section_id="+sectionid;
			System.out.println(sql);
			ResultSet rs = stmt.executeQuery(sql);
			if(rs.next()){
				section.setSectionId(rs.getInt("section_id"));
				section.setCourseId(rs.getInt("course_id"));
				section.setSectionName(rs.getString("section_name").trim());
				section.setSectionUrl(rs.getString("section_url"));
				section.setSectionContent(rs.getString("section_content"));
				section.setFree(rs.getInt("free"));
				section.setSeq(rs.getInt("seq"));
				section.setStatus(rs.getInt("status"));
				section.setReason(rs.getString("reason"));
			}
			rs.close();
			stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return section;
	}
	//课程审核
	public CourseVo courseven(String id) {
		Connection conn = DBConn.openDB();
		CourseVo list= null;
		try {
			Statement stmt = conn.createStatement();
			String sql = "select * from course where course_id="+id;
			System.out.println(sql);
			ResultSet rs = stmt.executeQuery(sql);
			if(rs.next()){
				list= new CourseVo();
				list.setCourseId(rs.getInt("course_id"));
				list.setTeacherId(rs.getInt("teacher_id"));
				list.setCourseName(rs.getString("course_name").trim());
				list.setPictureUrl(rs.getString("picture_url"));
				list.setIntroduce(rs.getString("introduce"));
				list.setCourseCount(rs.getInt("course_count"));
				list.setPrice(rs.getFloat("price"));
				list.setDiscount(rs.getFloat("discount"));
				list.setEffective(rs.getInt("effective"));
				list.setReplayDate(rs.getDate(("replay_date")));
				list.setSeq(rs.getInt("seq"));
				list.setChargeType(rs.getInt("charge_type"));
				list.setStatus(rs.getInt("status"));
				list.setReason(rs.getString("reason"));
				list.setReplayUsername(rs.getString("replay_username"));
			}
			stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	public void courseven1(String id, String name, String ti) {
		Connection conn = DBConn.openDB();
		try {
			Statement stmt=conn.createStatement();
			String sql="update course set status='"+ti+"' ,reason='"+name+"' where course_id="+id;
			System.out.println(sql);
			stmt.executeUpdate(sql);
			stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
	}
	//8、	注册讲师表（Teacher）
	public void teacherAdd(TeacherVo teacher) {
		Connection conn=DBConn.openDB();
		try{
			Statement stat=conn.createStatement();
			String sql="insert into teacher values('" +
				+teacher.getTeacherId()+"','"
				+teacher.getTeacherIntroduce()+"','"
				+teacher.getTeacherSpecial()+"','"
				+teacher.getTeacherLength()+"','"
				+teacher.getEducation()+"','"
				+teacher.getHeadPictureUrl()+"','"
				+teacher.getBankId()+"','"
				+teacher.getAccountNo()+"','"
				+teacher.getAccountName()+"','"
				+teacher.getGradeId()+"','"
				+teacher.getStatus()+"','"
				+teacher.getReason()+"')";
			System.out.println(sql);
			stat.execute(sql);
		}catch(SQLException e){
			e.printStackTrace();
		}
	}
	//修改教师资料(id,简介,特长,教龄,学历,头像图片,银行id,银行账户,开户人姓名)
	public void teacherUpdate(TeacherVo teacher) {
		Connection conn = DBConn.openDB();
		try {
			Statement stmt = conn.createStatement();
			String sql="update teacher set teacherIntroduce='"
				+teacher.getTeacherIntroduce()+"',teacherSpecial='"
				+teacher.getTeacherSpecial()+"',teacherLength='"
				+teacher.getTeacherLength()+"',education='"
				+teacher.getEducation()+"',bankid='"
				+teacher.getBankId()+"',";
				if(teacher.getHeadPictureUrl()!=null && !teacher.getHeadPictureUrl().equals("")){
					sql += "headpictureurl='"+teacher.getHeadPictureUrl()+"',";
				}
				sql+="accountNo='"+teacher.getAccountNo()+"',accountName='"
				+teacher.getAccountName()+"',gradeId='"
				+teacher.getGradeId()+"',status='"
				+teacher.getStatus()+"',reason='"
				+teacher.getReason()+"' where teacherId="+teacher.getTeacherId();
			stmt.executeUpdate(sql);
			stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	//查询讲师资料
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

	public List<TeacherVo> teacherList(int pageSize, int startPos) {
		Connection conn=DBConn.openDB();
		List<TeacherVo> list=new ArrayList<TeacherVo>();
		try {
			Statement stat=conn.createStatement();
			System.out.println(startPos);
			String sql = "select top "+pageSize+" teacherid,teacherintroduce,teacherspecial,teacherlength,education,headpictureurl,accountNo,accountName,status,reason,b.bankname,g.grade_name,t.gradeid from teacher t ";
			sql += " inner join bank b on t.bankid=b.bankid inner join teacherGrade g on t.gradeid=g.grade_id ";
			sql += " where teacherid not in(select top "+startPos +" teacherid from teacher order by status) order by status";
			ResultSet rs=stat.executeQuery(sql);
			while(rs.next()){
				TeacherVo teacher= new TeacherVo();
				teacher.setTeacherId(rs.getInt("teacherId"));
				teacher.setTeacherIntroduce(rs.getString("teacherIntroduce"));
				teacher.setTeacherSpecial(rs.getString("teacherSpecial"));
				teacher.setTeacherLength(rs.getString("teacherLength"));
				teacher.setEducation(rs.getString("education"));
				teacher.setHeadPictureUrl(rs.getString("headPictureUrl"));
				teacher.setAccountNo(rs.getString("accountNo"));
				teacher.setAccountName(rs.getString("accountName"));
				teacher.setStatus(rs.getInt("status"));
				teacher.setReason(rs.getString("reason"));
				teacher.setGradeName(rs.getString("grade_name"));
				teacher.setGradeId(rs.getInt("gradeid"));
				list.add(teacher);
			}
			rs.close();
			stat.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	public List<BankVo> bankList() {
		Connection conn=DBConn.openDB();
		List<BankVo> list =new ArrayList<BankVo>();
		try {
			Statement stmt =conn.createStatement();
			String sql = "select * from bank";
			System.out.println(sql);
			ResultSet rs =stmt.executeQuery(sql);
			while(rs.next()){
				BankVo bank=new BankVo();
				bank.setBankId(rs.getInt("bankid"));
				bank.setBankName(rs.getString("bankname"));
				list.add(bank);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	public boolean teacherIsExist(int teacherId){
		Connection conn = DBConn.openDB();
		boolean bok=false;
		try {
			Statement stmt = conn.createStatement();
			String sql = "select * from teacher t where teacherid="+teacherId;
			ResultSet rs = stmt.executeQuery(sql);
			if(rs.next()){
				bok=true;
			}
			rs.close();
			stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return bok;
	}

	public void teacherAudit(TeacherVo teacher){
		Connection conn = DBConn.openDB();
		try {
			Statement stmt = conn.createStatement();
			String sql = "update Teacher set";
			sql += " gradeid='"+teacher.getGradeId()+"',";
			sql += "status='"+teacher.getStatus()+"',";
			sql += "reason='"+teacher.getReason()+"'";
			sql += " where teacherid="+teacher.getTeacherId();
			System.out.println(sql);
			stmt.executeUpdate(sql);
			if(teacher.getStatus()==1){
				sql = "update users set user_type=2 where userid="+teacher.getTeacherId();
				stmt.executeUpdate(sql);
			}
			stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	//充值金额
	public void chz(String sql) {
		Connection conn = DBConn.openDB();
		try {
			Statement stmt = conn.createStatement();
			stmt.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void ckup(String sql) {
		Connection conn = DBConn.openDB();
		try {
			Statement stmt = conn.createStatement();
			stmt.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	public void couponRecordAdd(CouponRecord coupon){
		Connection conn = DBConn.openDB();
		try {
			Statement stmt = conn.createStatement();
			String sql = "insert into CouponRecord values(";
			sql += "'"+coupon.getActivityName() +"',";
			sql += "'"+coupon.getActivityDesc()+"',";
			sql += "'"+coupon.getUserid()+"',getdate()";
			sql += ")";
			System.out.println(sql);
			stmt.executeUpdate(sql);
			stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public List<CouponRecord> couponRecordList(int teacherId,int pageSize,int startPos){

		Connection conn = DBConn.openDB();
		List<CouponRecord> list = new ArrayList<CouponRecord>();
		try {
			Statement stmt = conn.createStatement();
			String sql = "select top "+pageSize+" * from CouponRecord  ";
			sql += " where userid="+teacherId+" and  couponRecordId not in(select top "+startPos +" couponRecordId from CouponRecord where userid="+teacherId+" order by couponRecordId desc) order by couponRecordId desc";
			System.out.println(sql);
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()){
				CouponRecord coupon= new CouponRecord();
				coupon.setCouponRecordId(rs.getInt("couponRecordId"));
				coupon.setActivityName(rs.getString("activityName").trim());
				coupon.setActivityDesc(rs.getString("activityDesc"));
				coupon.setUserid(rs.getInt("userid"));
				coupon.setCreateDate(rs.getString("createDate"));
				list.add(coupon);
			}
			rs.close();
			stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	public List<CouponRecord> couponRecordList(int pageSize,int startPos){

		Connection conn = DBConn.openDB();
		List<CouponRecord> list = new ArrayList<CouponRecord>();
		try {
			Statement stmt = conn.createStatement();
			String sql ="select top "+pageSize+" * from CouponRecord  where  couponRecordId not in" +
					"(select top "+startPos+" couponRecordId from CouponRecord order by couponRecordId desc) order by couponRecordId desc";
			System.out.println(sql);
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()){
				CouponRecord coupon= new CouponRecord();
				coupon.setCouponRecordId(rs.getInt("couponRecordId"));
				coupon.setActivityName(rs.getString("activityName").trim());
				coupon.setActivityDesc(rs.getString("activityDesc"));
				coupon.setUserid(rs.getInt("userid"));
				coupon.setCreateDate(rs.getString("createDate"));
				list.add(coupon);
			}
			rs.close();
			stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	private String procudeCode() throws SQLException{
		Random rand = new Random();
		String sql = "";
		long cnt = 0;
		int suffix=0;
		String prefix="";
		Connection conn = DBConn.openDB();
		Statement stmt = conn.createStatement();
		do{
			suffix=rand.nextInt(899999)+100000;
			prefix = ContextUtils.produceExchangeCode()+suffix;
			sql = "select count(code) cnt from CouponCode where code='"+prefix+"'";
			ResultSet rs = stmt.executeQuery(sql);
			if(rs.next()){
				cnt = rs.getInt("cnt");
			}
		}while(cnt>0);
		stmt.close();
		return prefix;
	}
	public void couponCodeAdd(int recordid,int money,int day,int count){
		Connection conn = DBConn.openDB();
		try {
			Statement stmt = conn.createStatement();
			String sql = "";
			for(int i=0;i<count;i++){
				sql = "insert into CouponCode(couponRecordId,code,couponMoney,status,validDay) values(";
				sql += "'"+recordid +"',";
				sql += "'"+procudeCode()+"',";
				sql += "'"+money+"',";
				sql += "'0',";
				sql += "'"+day+"'";
				sql += ")";
				stmt.executeUpdate(sql);
			}
			stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public List<CouponCode> couponCodeList(int couponRecordId){

		Connection conn = DBConn.openDB();
		List<CouponCode> list = new ArrayList<CouponCode>();
		try {
			Statement stmt = conn.createStatement();
			String sql = "select * from CouponCode where couponRecordId="+couponRecordId +" order by couponRecordId desc";
			System.out.println(sql);
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

	public List<SectionVo> conlist(String sql) {
		Connection conn = DBConn.openDB();
		List<SectionVo> list = new ArrayList<SectionVo>();
		try {
			Statement stmt = conn.createStatement();
			System.out.println(sql);
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()){
				SectionVo code= new SectionVo();
				code.setSectionId(rs.getInt("section_id"));
				code.setSectionName(rs.getString("section_name"));
				code.setSectionUrl(rs.getString("section_url"));
				code.setSectionContent(rs.getString("section_content"));
				code.setFree(rs.getInt("free"));
				code.setReason(rs.getString("status"));
				list.add(code);
			}
			rs.close();
			stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
		
	}

	public List<CashRecordVo> Cashlist(String sql) {
		Connection conn=DBConn.openDB();
		List<CashRecordVo> list=new ArrayList<CashRecordVo>();
		try {
			Statement stmt=conn.createStatement();
			System.out.println(sql);
			ResultSet rs=stmt.executeQuery(sql);
			while(rs.next()){
			CashRecordVo cash=new CashRecordVo();
				cash.setPayRecordId(rs.getInt("pay_record_id"));
				cash.setTeacherId(rs.getInt("teacher_id"));
				cash.setCashDate(rs.getDate("cash_date"));
				cash.setPayMoney(rs.getFloat("pay_money"));
				cash.setIncomMoney(rs.getFloat("Incom_money"));
				cash.setStatus(rs.getString("status"));
				cash.setReason(rs.getString("reason"));
				list.add(cash);
			}
		} catch (SQLException e) {

			e.printStackTrace();
		}
		return list;
	}
	//评价
	public List<UserCourseEvalVo>  Evelyn(String id) {
		Connection conn=DBConn.openDB();
		List<UserCourseEvalVo> list =new ArrayList<UserCourseEvalVo>();
		try {
			Statement stmt=conn.createStatement();
			String sql="select * from UserCourseEval where course_id="+id;
			ResultSet rs=stmt.executeQuery(sql);
			while(rs.next()){
				UserCourseEvalVo eval= new UserCourseEvalVo();
				eval.setCourseId(rs.getInt("course_id"));
				eval.setUserid(rs.getInt("userid"));
				eval.setUsername(rs.getString("username"));
				eval.setEvalLevel(rs.getInt("eval_level"));
				eval.setEvalContent(rs.getString("eval_content"));
				eval.setEvalDate(rs.getDate("eval_date"));
				list.add(eval);
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return list;
	}
	//在线留言板
	public List<ForumVo> Forlist(String sql) {
		Connection conn=DBConn.openDB();
		List<ForumVo> list= new ArrayList<ForumVo>();
		try {
			Statement stmt=conn.createStatement();
			ResultSet rs=stmt.executeQuery(sql);
			while(rs.next()){
				ForumVo forum=new ForumVo();
				forum.setForumid(rs.getInt("forum_id"));
				forum.setUserid(rs.getInt("userid"));
				forum.setReplayUserId(rs.getInt("ReplayUserId"));
				forum.setFourmtype(rs.getInt("fourm_type"));
				forum.setContent(rs.getString("forum_content"));
				forum.setForumdate(rs.getDate("forum_date"));
				forum.setForumname(rs.getString("forumtext"));
				forum.setTextde(rs.getString("textde"));
				list.add(forum);	
			}
		} catch (SQLException e) {
		
			e.printStackTrace();
		}
		
		return list;
	}
}





