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
				// �����ļ���·����������tomcat���浱ǰ��Ŀ�µ���·�� 
				String filepath =getServletContext().getRealPath("attdate/")+"upolad";
				File uploda=new File(filepath);
				if(!uploda.exists()){	
					uploda.mkdir();
				}
				 // �ļ�������� 3M  
				int fileMaxsize=3*1024*1024;
				 // �ļ���  
				String filename=null;
				// �ϴ��ļ���
				int fileCont=0;
				 // ����������  
				FileReameutil rfrp=new FileReameutil();
				// �ϴ��ļ�  
				MultipartRequest mulit=null;
				try{
				 mulit=new MultipartRequest(request,filepath,fileMaxsize,"utf-8",rfrp);//ȡ���ϴ��ļ�
				}catch(Exception e){
					request.setAttribute("msg","��֧�ִ���3M���ļ�");
					getServletContext().getRequestDispatcher("/T10/courseAdd.jsp").forward(request, response);
					return;
				}
				//��ȡ��ͨ�ؼ���ֵ������ʹ��request����
				String courseId=mulit.getParameter("courseId");
				String courseName=mulit.getParameter("courseName");
				String pictureUrl = "attdateupolad/"; 
				String oneWord=mulit.getParameter("oneWord");
				String introduce=mulit.getParameter("introduce");
//				String teacherId=mulit.getParameter("teacherId");//��ʦid
				String courseCount=mulit.getParameter("courseCount");
				String price=mulit.getParameter("price");
				String discount=mulit.getParameter("discount");
				String effective=mulit.getParameter("effective");
				String replayUsername=mulit.getParameter("replayUsername");//������
				String seq=mulit.getParameter("seq");
				String chargeType=mulit.getParameter("chargeType");
				String status=mulit.getParameter("status");
				String reason=mulit.getParameter("reason");
				 Enumeration filesname = mulit.getFileNames();//ȡ���ϴ��������ļ�(�൱�ڱ�ʶ)   
			        while (filesname.hasMoreElements()) {  
			        	//�ؼ�����
			            String name = (String) filesname.nextElement();//��ʶ  
			            pictureUrl += mulit.getFilesystemName(name); //ȡ���ļ���  
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
			}else if(action.equals("seve")){//�γ����
				String id=request.getParameter("courseId");
				CourseVo course=base.courseven(id);
				request.setAttribute("course",course);	
				request.getRequestDispatcher("/T10/courseven.jsp").forward(request, response);
			}else if(action.equals("seveup")){//�γ����1
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
		//��ȡҳ�����
		String pageDaen=request.getParameter("pageDaen");//��ǰҳ
		String por=request.getParameter("por");
		//��ȡ��¼����
		int cnd=base.getCount("select count(*) cnt from  course");
		PageVo page=new PageVo();
		//��һ������
		page.setTextCount(cnd);
		//�ڶ�������
		if(pageDaen==null || pageDaen.equals("")){//��ǰҳ
		page.setPageDaen(1);
		}else{
			page.setPageDaen(Integer.parseInt(pageDaen));
		}
		//����������
		if(por==null || por.equals("")){
			page.setPor("first");
		}else{
			page.setPor(por);
		}
		int pageInt=page.getPageInt();
		int pageSize=page.getPageSize();
		//��ȡ���г���
		List<CourseVo> courseList=base.courseList(pageSize, pageInt);
		//����request����������������Եĳ�������
		request.setAttribute("courseList",courseList);
		request.setAttribute("page",page);
	}

}
