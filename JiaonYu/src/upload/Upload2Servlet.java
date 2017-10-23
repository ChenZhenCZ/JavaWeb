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

public class Upload2Servlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String filePath=getServletContext().getRealPath("/")+"video";
		File uploadPath=new File(filePath);
		if(!uploadPath.exists()){
			uploadPath.mkdir();
		}
		int fileMaxSize=1000*1024*1024;
		@SuppressWarnings("unused")
		String[] fileDiscription={null,null};
		String fileName=null;
		int fileCount=0;
		FileRenameFormat rf=new FileRenameFormat();
		MultipartRequest mult=new MultipartRequest(request,filePath,fileMaxSize,"utf-8",rf);
		String username=mult.getParameter("username");
		PrintWriter out=response.getWriter();
		response.setContentType("text/html;utf-8");
		Enumeration filesname=mult.getFileNames();
		while(filesname.hasMoreElements()){
			String name=(String)filesname.nextElement();
			fileName=mult.getFilesystemName(name);
			String contentType=mult.getContentType(name);
			if(fileName!=null){
				fileCount++;
				out.println("<embed src='<%=basePath %>video/"+fileName+"' quality='high' type='application/x-shockwave-flash' width='1000' height='600'></embed>");
			}
			System.out.println("共上传"+fileCount+"个文件！");
			out.close();
		}
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request,response);
	}
}
