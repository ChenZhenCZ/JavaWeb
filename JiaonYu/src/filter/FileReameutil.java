package filter;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

import com.oreilly.servlet.multipart.FileRenamePolicy;

public class FileReameutil implements FileRenamePolicy{

	public File rename(File file) {
		String body="";
		String ext="";
		Date date=new Date();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyMMddmmss");
		int pot=file.getName().lastIndexOf(".");
		if(pot!=-1){
			body=sdf.format(date);
			ext=file.getName().substring(pot);
		}else{
			body=(new Date()).getTime()+"";
			ext="";
		}
		Random ran=new Random();
		int rand=Math.abs(ran.nextInt(9000))+1000;
		String newname=body+rand+ext;
		file=new File(file.getParent(),newname);
		System.out.println(file);
		return file;
	}

}
