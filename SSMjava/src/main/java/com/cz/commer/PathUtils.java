package com.cz.commer;

import javax.servlet.http.HttpServletRequest;
import java.io.File;

public class PathUtils {

    public static  String uploadDir(HttpServletRequest request){
        String rooDir =request.getServletContext().getRealPath("/");
        File file=new File(rooDir,"upload");
        if(!file.exists()){
            file.mkdir();
        }
        return file.getAbsolutePath();
    }
}
