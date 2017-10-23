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
//新闻资讯
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
					getServletContext().getRequestDispatcher("/T6/newsMsgAdd.jsp").forward(request, response);
					return;
				}
				 //获取普通控件的值，不能使用request对象
				String publishusername=mulit.getParameter("publishusername");
		        String msgName = mulit.getParameter("msgName");  
		        String oneWord = mulit.getParameter("oneWord");  
		        String msgContent = mulit.getParameter("msgContent");  
		        String publishDate = mulit.getParameter("publishDate");  
		        String effective = mulit.getParameter("effective");  
		        String seq = mulit.getParameter("seq");  
		        String newsType = mulit.getParameter("newsType");  
		        String imageUrl = "attdateupolad/"; 
		        Enumeration filesname = mulit.getFileNames();//取得上传的所有文件(相当于标识)   
		        while (filesname.hasMoreElements()) {  
		        	//控件名称
		            String name = (String) filesname.nextElement();//标识  
		            imageUrl += mulit.getFilesystemName(name); //取得文件名  
		        }  
		        String msgContentUrl="attdate/upolad/"+ContextUtils.getFilename()+".html";
		        //把新闻公告的内容生成静态的html页面
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
		//获取页面参数
		String pageDaen=request.getParameter("pageDaen");//当前页
		String por=request.getParameter("por");
		//获取记录总数
		int cnd=base.getCount("select count(*) cnt from  newmsg");
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
		List<NewMsgVo> NewMsgList=base.newsMsgList(pageSize, pageInt);
		//定义request变量，保存的是所以的城市数据
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
