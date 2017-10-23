package ServletList;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;

import filter.FileReameutil;

import base.BaseDAOimp;
import base.IBaseDAO;

import bean.CourseVo;
import bean.PageVo;
import bean.TeacherVo;

public class CourseServlet extends HttpServlet {
	IBaseDAO base=new BaseDAOimp();
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			doPost(request, response);
		
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			String action =request.getParameter("action");
		if(action.equals("add")){
				// 保存文件的路径，必须是tomcat里面当前项目下的子路径 
				String filepath =getServletContext().getRealPath("attdate/")+"upolad";
				File uploda=new File(filepath);
				if(!uploda.exists()){	
					uploda.mkdir();
				}
				 // 文件最大容量 3M  
				int fileMaxsize=3*1024*1024;
				 // 文件名  
				String filename=null;
				// 上传文件数
				int fileCont=0;
				 // 重命名策略  
				FileReameutil rfrp=new FileReameutil();
				// 上传文件  
				MultipartRequest mulit=null;
				try{
				 mulit=new MultipartRequest(request,filepath,fileMaxsize,"utf-8",rfrp);//取得上传文件
				}catch(Exception e){
					request.setAttribute("msg","不支持大于3M的文件");
					getServletContext().getRequestDispatcher("/T10/courseAdd.jsp").forward(request, response);
					return;
				}
				//获取普通控件的值，不能使用request对象
				String courseId=mulit.getParameter("courseId");
				String courseName=mulit.getParameter("courseName");
				String pictureUrl = "attdateupolad/"; 
				String oneWord=mulit.getParameter("oneWord");
				String introduce=mulit.getParameter("introduce");
//				String teacherId=mulit.getParameter("teacherId");//讲师id
				String courseCount=mulit.getParameter("courseCount");
				String price=mulit.getParameter("price");
				String discount=mulit.getParameter("discount");
				String effective=mulit.getParameter("effective");
				String replayUsername=mulit.getParameter("replayUsername");//发布人
				String seq=mulit.getParameter("seq");
				String chargeType=mulit.getParameter("chargeType");
				String status=mulit.getParameter("status");
				String reason=mulit.getParameter("reason");
				 Enumeration filesname = mulit.getFileNames();//取得上传的所有文件(相当于标识)   
			        while (filesname.hasMoreElements()) {  
			        	//控件名称
			            String name = (String) filesname.nextElement();//标识  
			            pictureUrl += mulit.getFilesystemName(name); //取得文件名  
			        } 
			        CourseVo course=new CourseVo();
			        course.setCourseName(courseName);
			        course.setPictureUrl(pictureUrl);
			        course.setOneWord(oneWord);
			        course.setIntroduce(introduce);
			        course.setTeacherId(Integer.parseInt(courseId));
			        course.setCourseCount(Integer.parseInt(courseCount));
			        course.setPrice(Integer.parseInt(price));
			        course.setDiscount(Integer.parseInt(discount));
			        course.setEffective(Integer.parseInt(effective));
			        course.setReplayUsername(replayUsername);
			        course.setSeq(Integer.parseInt(seq));
			        course.setChargeType(Integer.parseInt(chargeType));
			        course.setStatus(Integer.parseInt(status));
			        course.setReason(reason);
			        base.courseAdd(course);
			        listPage(request, response);
			        request.getRequestDispatcher("/web/webCenter.jsp").forward(request, response);
			}else if(action.equals("wode")){
				 String teacherid=request.getParameter("teacherid");
				 List<CourseVo> courseList=base.coursewode(teacherid);
				 request.setAttribute("courseList", courseList);
				 request.getRequestDispatcher("T10/coursewode.jsp").forward(request, response);
			}else if(action.equals("wode1")){
				 List<CourseVo> courseList=base.coursewode1("select * from course where status=1 and effective=1");
				 request.setAttribute("courseList", courseList);
				 request.getRequestDispatcher("T10/coursewode1.jsp").forward(request, response);
			}else if(action.equals("wode2")){
				 List<CourseVo> courseList=base.coursewode1("select * from course where status=1 and charge_Type=0 and effective=1");
				 request.setAttribute("courseList", courseList);
				 request.getRequestDispatcher("T10/coursewode1.jsp").forward(request, response);
			}else if(action.equals("wode3")){
				 String teacherid=request.getParameter("teacherid");
				 List<CourseVo> courseList=base.coursewode(teacherid);
				 TeacherVo  teacherList=base.findteacherById(teacherid);
				 request.setAttribute("teacherList", teacherList);
				 request.setAttribute("courseList", courseList);
				 request.getRequestDispatcher("T10/teacher.jsp").forward(request, response);
			}else if(action.equals("list")){
				 listPage(request, response);
				 request.getRequestDispatcher("/T10/courseList.jsp").forward(request, response);
			}else if(action.equals("seve")){//课程审核
				String id=request.getParameter("courseId");
				CourseVo course=base.courseven(id);
				request.setAttribute("course",course);	
				request.getRequestDispatcher("/T10/courseven.jsp").forward(request, response);
			}else if(action.equals("seveup")){//课程审核1
				String id=request.getParameter("courseId");
				String status=request.getParameter("status");
				String reason=request.getParameter("reason");
				base.courseven1(id, reason, status);
				listPage(request, response);
				request.getRequestDispatcher("/T10/courseList.jsp").forward(request, response);
			}else if(action.equals("up")){
				String courseId=request.getParameter("courseId");
				String sql="update Course set effective='0'  where  course_Id="+courseId;
				base.ckup(sql);	
				request.getRequestDispatcher("/courseServlet?action=wode").forward(request, response);
			}else if(action.equals("up2")){
				String courseId=request.getParameter("courseId");
				String sql="update Course set effective='1'  where  course_Id="+courseId;
				base.ckup(sql);
			request.getRequestDispatcher("/courseServlet?action=wode&teacherid="+courseId).forward(request, response);
				
			}
		
	}
	public void listPage(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		//获取页面参数
		String pageDaen=request.getParameter("pageDaen");//当前页
		String por=request.getParameter("por");
		//获取记录总数
		int cnd=base.getCount("select count(*) cnt from  course");
		PageVo page=new PageVo();
		//第一个参数
		page.setTextCount(cnd);
		//第二个参数
		if(pageDaen==null || pageDaen.equals("")){//当前页
		page.setPageDaen(1);
		}else{
			page.setPageDaen(Integer.parseInt(pageDaen));
		}
		//第三个参数
		if(por==null || por.equals("")){
			page.setPor("first");
		}else{
			page.setPor(por);
		}
		int pageInt=page.getPageInt();
		int pageSize=page.getPageSize();
		//获取所有城市
		List<CourseVo> courseList=base.courseList(pageSize, pageInt);
		//定义request变量，保存的是所以的城市数据
		request.setAttribute("courseList",courseList);
		request.setAttribute("page",page);
	}

}
