package ServletList;

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
import filter.FileRenameUtil;

import base.BaseDAOimp;
import base.IBaseDAO;
import bean.CourseVo;
import bean.PageObject;
import bean.PageVo;
import bean.SectionVo;
import bean.TeacherVo;

public class SectionServlet extends HttpServlet {

	IBaseDAO base =new BaseDAOimp();
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		if(action.equals("list")){
			String courseId=request.getParameter("courseId");
			request.setAttribute("courseId", courseId);
			listPage(request,response,Integer.parseInt(courseId));
        	getServletContext().getRequestDispatcher("/web/sectionList.jsp").forward(request, response);
		}else if(action.equals("list1")){
			String courseId=request.getParameter("courseId");
			request.setAttribute("courseId", courseId);
			listPage(request,response,Integer.parseInt(courseId));
        	getServletContext().getRequestDispatcher("/web/sectionList1.jsp").forward(request, response);
		}else if(action.equals("tion")){
			String sql="select * from Section where status=0 or status=2";
			List<SectionVo> con=base.conlist(sql);
			request.setAttribute("con", con);
			getServletContext().getRequestDispatcher("/web/examine.jsp").forward(request, response);
		}else if(action.equals("eve")){
			String status =request.getParameter("status");
			String reason=request.getParameter("reason");
			String sectionId=request.getParameter("sectionId");
			String sql="update Section set status='"+status+"'," +
					"reason='"+reason+"'  where section_id="+sectionId;
			base.chz(sql);
			getServletContext().getRequestDispatcher("/web/examine.jsp").forward(request, response);
			
		}
		else if(action.equals("add")){
	       
			  // �����ļ���·����������tomcat���浱ǰ��Ŀ�µ���·�� 
	        String filePath = getServletContext().getRealPath("/attdate/section");  
	        // �ļ�������� 600M  
	        int fileMaxSize = 1000 * 1024 * 1024;  
	        // ����ļ�����  
	        @SuppressWarnings("unused")  
	        String[] fileDiscription = { null, null };  
	        // �ļ���  
	        String fileName = null;  
	        // �ϴ��ļ���  
	        int fileCount = 0;  
	        // ����������  
	        FileRenameUtil rfrp = new FileRenameUtil();  
	        // �ϴ��ļ�  
	        MultipartRequest mulit =null;
	        try{
	        	mulit = new MultipartRequest(request, filePath,fileMaxSize, "UTF-8", rfrp);//ȡ���ϴ��ļ�  
	        }catch(Exception e){
	        	request.setAttribute("msg", "�ϴ��ļ��Ĵ�С���ܳ���1000M");
	        	getServletContext().getRequestDispatcher("/T10/coursewode.jsp").forward(request, response);
	        	return;
	        }
			String courseId=mulit.getParameter("courseId");
	        String sectionName = mulit.getParameter("sectionName");  
	        String sectionContent = mulit.getParameter("sectionContent");  
	        String free = mulit.getParameter("free");  
	        String seq = mulit.getParameter("seq");  
	        String sectionUrl = "attdate/section/"; 
	        Enumeration filesname = mulit.getFileNames();
	        String val = null;
	        while (filesname.hasMoreElements()) {  
	        	
	        	String name = (String) filesname.nextElement(); 
	        	val =  mulit.getFilesystemName(name);   
	        	sectionUrl +=val;
	        }  
			SectionVo section = new SectionVo();
			section.setCourseId(Integer.parseInt(courseId));
			section.setSectionName(sectionName);
			section.setSectionContent(sectionContent);
			section.setFree(Integer.parseInt(free));
			section.setSectionUrl(sectionUrl);
			section.setSeq(Integer.parseInt(seq));
			if(val!=null && !val.equals("")){
				section.setSectionUrl(sectionUrl);
			}
			section.setReason("");
			section.setStatus(0);
			base.sectionAdd(section);
			request.setAttribute("courseId", courseId);
			listPage(request,response,Integer.parseInt(courseId));
        	getServletContext().getRequestDispatcher("/web/sectionList.jsp").forward(request, response);

		}else if(action.equals("video")){
			String sectionid = request.getParameter("sectionId");
			SectionVo section = base.findSectionById(sectionid);
			request.setAttribute("section", section);
        	getServletContext().getRequestDispatcher("/T19/video6.jsp").forward(request, response);
		}
	}
	
	public void listPage(HttpServletRequest request, HttpServletResponse response,int courseId)
	throws ServletException, IOException {
		//��ȡҳ�����
		String pageDaen=request.getParameter("pageDaen");//��ǰҳ
		String por=request.getParameter("por");
		//��ȡ��¼����
		int cnd=base.getCount("select count(*) cnt from section");
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
		
		List<SectionVo> sectionList = base.sectionList(courseId,pageSize,pageInt);
		request.setAttribute("sectionList", sectionList);
		request.setAttribute("pager", page);
		
	}
}
