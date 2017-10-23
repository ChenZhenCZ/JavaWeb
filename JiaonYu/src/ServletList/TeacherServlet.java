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
			//��ѯ������������
			List<BankVo> bankList = base.bankList();
			TeacherVo teacher = base.findteacherById(user.getUserid()+"");
			
			request.setAttribute("bankList",bankList);
			request.setAttribute("teacher",teacher);
			getServletContext().getRequestDispatcher("/T8/teacherAdd.jsp").forward(request, response);
		}else if(action.equals("add")){
			
	        // �����ļ���·����������tomcat���浱ǰ��Ŀ�µ���·�� 
	        String filePath = getServletContext().getRealPath("upload");  
	        // �ļ�������� 3M  
	        int fileMaxSize = 3 * 1024 * 1024;  
	        // ����ļ�����
	        File uploadPath=new File(filePath);
			if(!uploadPath.exists()){
				uploadPath.mkdir();
			}
	        @SuppressWarnings("unused")  
	        String[] fileDiscription = { null, null };  
	        // �ļ���  
	        String fileName = null;  
	        // �ϴ��ļ���  
	        int fileCount = 0;  
	        // ����������  
	        FileRenameFormat rfrp = new FileRenameFormat();  
	        // �ϴ��ļ�  
	        MultipartRequest mulit =null;
	        try{
	        	mulit = new MultipartRequest(request, filePath,fileMaxSize, "UTF-8", rfrp);//ȡ���ϴ��ļ�  
	        }catch(Exception e){
	        	request.setAttribute("msg", "�ϴ��ļ��Ĵ�С���ܳ���3M");
	        	getServletContext().getRequestDispatcher("/teacherServlet?action=init").forward(request, response);
	        	return;
	        }
	        //��ȡ��ͨ�ؼ���ֵ������ʹ��request����
	        String teacherId = mulit.getParameter("teacherId");  
	        String teacherIntroduce = mulit.getParameter("teacherIntroduce");  
	        String teacherSpecial = mulit.getParameter("teacherSpecial");  
	        String teacherLength = mulit.getParameter("teacherLength");  
	        String education = mulit.getParameter("education");  
	        String bankId = mulit.getParameter("bankId");  
	        String accountNo = mulit.getParameter("accountNo");  
	        String accountName = mulit.getParameter("accountName");  
	        String headPictureUrl = ""; 
	        Enumeration filesname = mulit.getFileNames();//ȡ���ϴ��������ļ�(�൱�ڱ�ʶ)   
	        String val = null;
	        while (filesname.hasMoreElements()) {  
	        	//�ؼ�����
	        	String name = (String) filesname.nextElement();//��ʶ  
	        	val =  mulit.getFilesystemName(name); //ȡ���ļ���  
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
				base.teacherUpdate(teacher); //�޸�
			}else{
				base.teacherAdd(teacher);//����
			}
			//��ѯ������������
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
	//��ҳ��ʾ
	public void listPage(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		//��ȡҳ��Ĳ���
		String currentPage = request.getParameter("currentPage");
		String opr = request.getParameter("opr");
		//��ȡ�ܼ�¼��
		int cnt = base.getCount("select count(*) cnt from teacher");
		PageObject pager = new PageObject();
		//���õ�һ������
		pager.setRecordCount(cnt);
		//���õڶ�������
		if(currentPage==null || currentPage.equals("")){
			pager.setCurrentPage(1);
		}else{
			pager.setCurrentPage(Integer.parseInt(currentPage));
		}
		//���õ���������
		if(opr==null || opr.equals("")){
			pager.setOpr("first");
		}else{
			pager.setOpr(opr);
		}
		//��ȡ��ǰҳ
		int currPage = pager.getCurrentPage();
		//��ȡ���ݿ������еĹ���Ա����
		List<TeacherVo> teacherList = base.teacherList(pager.getPageSize(),pager.getStartPos());
		//����request����������������ԵĹ���Ա����
		request.setAttribute("teacherList", teacherList);
		request.setAttribute("p", pager);
		
	}
}

