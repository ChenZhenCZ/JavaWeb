package upload;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

public class UploadServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String filePath=getServletContext().getRealPath("upload");
		File uploadPath=new File(filePath);
		if(!uploadPath.exists()){
			uploadPath.mkdir();
		}
		int fileMaxSize=3*1024*1024;
		@SuppressWarnings("unused")
		String[] fileDiscription={null,null};
		String fileName=null;
		int fileCount=0;
		FileRenameFormat rfrp=new FileRenameFormat();
		MultipartRequest mulit=new MultipartRequest(request,filePath,fileMaxSize,"utf-8",rfrp);
		String username=mulit.getParameter("username");
		PrintWriter out=response.getWriter();
		response.setContentType("text/html;charset=utf-8");
		Enumeration filesname=mulit.getFileNames();
		while(filesname.hasMoreElements()){
			String name=(String)filesname.nextElement();
			fileName=mulit.getFilesystemName(name);
			String contentType=mulit.getContentType(name);
			if(fileName!=null){
				fileCount++;
				out.println("<img src='upload/"+fileName+"'/>");
			}
		}
		System.out.println("共上传"+fileCount+"个文件！");
		out.close();
		
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request,response);
	}
}
