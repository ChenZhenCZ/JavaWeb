package com.wd.common.util;
import java.io.IOException;  

import javax.servlet.FilterChain;  
import javax.servlet.ServletException;  
import javax.servlet.ServletRequest;  
import javax.servlet.ServletResponse;  
import javax.servlet.http.HttpServletRequest;  
  
import org.apache.struts2.dispatcher.ng.filter.StrutsPrepareAndExecuteFilter;  
  
public class MyStrutsFilter  extends StrutsPrepareAndExecuteFilter{  
    public void doFilter(ServletRequest req, ServletResponse res,FilterChain chain) throws IOException, ServletException {    
        HttpServletRequest request = (HttpServletRequest) req;    
        //不过滤的url    
        String url = request.getRequestURI();    
        String url2="/EstateSales/kindeditor/jsp/upload_json.jsp";
        String url3="/EstateSales/websocket";
        if (url2.equals(url)||url3.equals(url)) {  //注意路径  
            chain.doFilter(req, res);    
        }else{    
            super.doFilter(req, res, chain);    
        }    
    }   
}  