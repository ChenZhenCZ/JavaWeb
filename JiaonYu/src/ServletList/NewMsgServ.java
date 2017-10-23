package ServletList;

import java.io.File;
import java.io.FileOutputStream;
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
import base.ContextUtils;
import base.IBaseDAO;
import bean.ManagerVo;
import bean.NewMsgVo;
import bean.PageVo;
//������Ѷ
public class NewMsgServ extends HttpServlet {
	IBaseDAO base=new BaseDAOimp();
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}


	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			String action =request.getParameter("action");
			HttpSession session=request.getSession();
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
					getServletContext().getRequestDispatcher("/T6/newsMsgAdd.jsp").forward(request, response);
					return;
				}
				 //��ȡ��ͨ�ؼ���ֵ������ʹ��request����
				String publishusername=mulit.getParameter("publishusername");
		        String msgName = mulit.getParameter("msgName");  
		        String oneWord = mulit.getParameter("oneWord");  
		        String msgContent = mulit.getParameter("msgContent");  
		        String publishDate = mulit.getParameter("publishDate");  
		        String effective = mulit.getParameter("effective");  
		        String seq = mulit.getParameter("seq");  
		        String newsType = mulit.getParameter("newsType");  
		        String imageUrl = "attdateupolad/"; 
		        Enumeration filesname = mulit.getFileNames();//ȡ���ϴ��������ļ�(�൱�ڱ�ʶ)   
		        while (filesname.hasMoreElements()) {  
		        	//�ؼ�����
		            String name = (String) filesname.nextElement();//��ʶ  
		            imageUrl += mulit.getFilesystemName(name); //ȡ���ļ���  
		        }  
		        String msgContentUrl="attdate/upolad/"+ContextUtils.getFilename()+".html";
		        //�����Ź�����������ɾ�̬��htmlҳ��
		        makehtml(msgContent, msgContentUrl, request);
		        NewMsgVo newsmsg = new NewMsgVo();
				newsmsg.setEffective(Integer.parseInt(effective));
				newsmsg.setImageUrl(imageUrl);
				newsmsg.setMsgContent(msgContent);
				newsmsg.setMsgContentUrl(msgContentUrl);
				newsmsg.setPublishUsername(publishusername);
				newsmsg.setMsgName(msgName);
//				newsmsg.setNewMsgId(newMsgId);
				newsmsg.setNewsType(Integer.parseInt(newsType));
				newsmsg.setOneWord(oneWord);
				newsmsg.setPublishDate(publishDate);
				newsmsg.setSeq(Integer.parseInt(seq));
				base.newsMsgAdd(newsmsg);
				listPage(request,response);
				request.getRequestDispatcher("/T6/newsMsg.jsp").forward(request, response);
			}else if(action.equals("list")){
				listPage(request,response);
				request.getRequestDispatcher("/T6/newsMsg.jsp").forward(request, response);
			}else if(action.equals("news")){
				listPage(request,response);
				request.getRequestDispatcher("/T6/newsMsg1.jsp").forward(request, response);
				
			}
	}
	public void listPage(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		//��ȡҳ�����
		String pageDaen=request.getParameter("pageDaen");//��ǰҳ
		String por=request.getParameter("por");
		//��ȡ��¼����
		int cnd=base.getCount("select count(*) cnt from  newmsg");
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
		List<NewMsgVo> NewMsgList=base.newsMsgList(pageSize, pageInt);
		//����request����������������Եĳ�������
		request.setAttribute("NewMsgList",NewMsgList);
		request.setAttribute("page",page);
	}
	private void makehtml(String content,String filename,HttpServletRequest request){
		String PAGE_HEAD="<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\"><html><head><meta http-equiv=\"Content-Type\" content=\"text/html; charset=gbk\"></head><body>";
		String PAGE_TAIL="</body></html>";

		content = PAGE_HEAD + content + PAGE_TAIL;
		String savePath = request.getRealPath("/") + filename;
		File file = new File(savePath);
		FileOutputStream fos;
		try {
			fos = new FileOutputStream(file);
			fos.write(content.getBytes());
			fos.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
