package filter;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

import com.oreilly.servlet.multipart.FileRenamePolicy;

public class FileRenameUtil implements FileRenamePolicy {  
	  
    public File rename(File file) {  
        String body = "";  
        String ext = "";  
        Date date = new Date();  
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhhmmss");
       
        
        int pot = file.getName().lastIndexOf(".");
        if (pot != -1) {  

            body = sdf.format(date);
            ext = file.getName().substring(pot);
        } else {  
            body = (new Date()).getTime() + "";  
            ext = "";  
        }  
        Random rand = new Random();
        int rnd = Math.abs(rand.nextInt(9000))+1000;
        String newName = body +rnd + ext;  
        file = new File(file.getParent(), newName); 
        return file;  
  
    }  
  
}  
