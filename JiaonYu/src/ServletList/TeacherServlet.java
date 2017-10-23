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

import upload.FileRenameFormat;


import com.oreilly.servlet.MultipartRequest;

import base.BaseDAOimp;
import base.ContextUtils;
import base.IBaseDAO;
import bean.BankVo;
import bean.PageObject;
import bean.TeacherGrade;
import bean.TeacherVo;
import bean.UersVo;


public class TeacherServlet extends HttpServlet {
	IBaseDAO base = new BaseDAOimp();
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String action = request.getParameter("action");
		HttpSession session = request.getSession();
		UersVo user =(UersVo)session.getAttribute("user");
		if(action.equals("init")){
			//查询所有银行数据
			List<BankVo> bankList = base.bankList();
			TeacherVo teacher = base.findteacherById(user.getUserid()+"");
			
			request.setAttribute("bankList",bankList);
			request.setAttribute("teacher",teacher);
			getServletContext().getRequestDispatcher("/T8/teacherAdd.jsp").forward(request, response);
		}else if(action.equals("add")){
			
	        // 保存文件的路径，必须是tomcat里面当前项目下的子路径 
	        String filePath = getServletContext().getRealPath("upload");  
	        // 文件最大容量 3M  
	        int fileMaxSize = 3 * 1024 * 1024;  
	        // 存放文件描述
	        File uploadPath=new File(filePath);
			if(!uploadPath.exists()){
				uploadPath.mkdir();
			}
	        @SuppressWarnings("unused")  
	        String[] fileDiscription = { null, null };  
	        // 文件名  
	        String fileName = null;  
	        // 上传文件数  
	        int fileCount = 0;  
	        // 重命名策略  
	        FileRenameFormat rfrp = new FileRenameFormat();  
	        // 上传文件  
	        MultipartRequest mulit =null;
	        try{
	        	mulit = new MultipartRequest(request, filePath,fileMaxSize, "UTF-8", rfrp);//取得上传文件  
	        }catch(Exception e){
	        	request.setAttribute("msg", "上传文件的大小不能超过3M");
	        	getServletContext().getRequestDispatcher("/teacherServlet?action=init").forward(request, response);
	        	return;
	        }
	        //获取普通控件的值，不能使用request对象
	        String teacherId = mulit.getParameter("teacherId");  
	        String teacherIntroduce = mulit.getParameter("teacherIntroduce");  
	        String teacherSpecial = mulit.getParameter("teacherSpecial");  
	        String teacherLength = mulit.getParameter("teacherLength");  
	        String education = mulit.getParameter("education");  
	        String bankId = mulit.getParameter("bankId");  
	        String accountNo = mulit.getParameter("accountNo");  
	        String accountName = mulit.getParameter("accountName");  
	        String headPictureUrl = ""; 
	        Enumeration filesname = mulit.getFileNames();//取得上传的所有文件(相当于标识)   
	        String val = null;
	        while (filesname.hasMoreElements()) {  
	        	//控件名称
	        	String name = (String) filesname.nextElement();//标识  
	        	val =  mulit.getFilesystemName(name); //取得文件名  
	            headPictureUrl +=val;
	        }  
			TeacherVo teacher = new TeacherVo();
			teacher.setTeacherId(Integer.parseInt(teacherId));
			teacher.setTeacherIntroduce(teacherIntroduce);
			teacher.setTeacherSpecial(teacherSpecial);
			teacher.setAccountName(accountName);
			teacher.setAccountNo(accountNo);
			teacher.setBankId(Integer.parseInt(bankId));
			teacher.setEducation(education);
			teacher.setGradeId(5);
			if(val!=null && !val.equals("")){
				teacher.setHeadPictureUrl(headPictureUrl);
			}
			teacher.setReason("");
			teacher.setStatus(0);
			teacher.setTeacherLength(teacherLength);
			if(base.teacherIsExist(teacher.getTeacherId())){
				base.teacherUpdate(teacher); //修改
			}else{
				base.teacherAdd(teacher);//新增
			}
			//查询所有银行数据
//			List<BankVo> bankList = base.bankList();
//			teacher = base.findTeacherById(user.getUserid());
//			request.setAttribute("teacher",teacher);
//			request.setAttribute("bankList",bankList);
			request.getRequestDispatcher("/web/webCenter.jsp").forward(request, response);
		}else if(action.equals("list")){
			listPage(request,response);
			List<TeacherGrade> gradeList = base.gradeList();
			request.setAttribute("gradeList",gradeList);
			request.getRequestDispatcher("/T8/teacherList.jsp").forward(request, response);
		}else if(action.equals("audit")){
			String teacherId = request.getParameter("teacherid");
			TeacherVo teacher = base.findteacherById(teacherId);
			List<TeacherGrade> gradeList = base.gradeList();
			request.setAttribute("gradeList",gradeList);
			request.setAttribute("teacher",teacher);
			System.out.println(teacher.getTeacherId());
			request.getRequestDispatcher("/T8/teacherAudit.jsp").forward(request, response);
		}else if(action.equals("auditSave")){
			String teacherId = request.getParameter("teacherId");
			String gradeId = request.getParameter("gradeId");
			String status = request.getParameter("status");
			String reason = request.getParameter("reason");
			TeacherVo teacher = new TeacherVo();
			teacher.setTeacherId(Integer.parseInt(teacherId));
			teacher.setGradeId(Integer.parseInt(gradeId));
			teacher.setStatus(Integer.parseInt(status));
			teacher.setReason(reason);
			base.teacherAudit(teacher);
			
			listPage(request,response);
			List<TeacherGrade> gradeList = base.gradeList();
			request.setAttribute("gradeList",gradeList);
			request.getRequestDispatcher("/T8/teacherList.jsp").forward(request, response);

		}
	}
	//分页显示
	public void listPage(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		//获取页面的参数
		String currentPage = request.getParameter("currentPage");
		String opr = request.getParameter("opr");
		//获取总记录数
		int cnt = base.getCount("select count(*) cnt from teacher");
		PageObject pager = new PageObject();
		//设置第一个参数
		pager.setRecordCount(cnt);
		//设置第二个参数
		if(currentPage==null || currentPage.equals("")){
			pager.setCurrentPage(1);
		}else{
			pager.setCurrentPage(Integer.parseInt(currentPage));
		}
		//设置第三个参数
		if(opr==null || opr.equals("")){
			pager.setOpr("first");
		}else{
			pager.setOpr(opr);
		}
		//获取当前页
		int currPage = pager.getCurrentPage();
		//获取数据库中所有的管理员数据
		List<TeacherVo> teacherList = base.teacherList(pager.getPageSize(),pager.getStartPos());
		//定义request变量，保存的是所以的管理员数据
		request.setAttribute("teacherList", teacherList);
		request.setAttribute("p", pager);
		
	}
}

