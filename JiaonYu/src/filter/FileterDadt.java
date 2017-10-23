package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class FileterDadt implements Filter{
	String str="";
	public void destroy() {
		
	}
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		System.out.println("doFilter............");
		if(!str.equals("")){
			request.setCharacterEncoding(this.str);
		}
		chain.doFilter(request,response);
	}
	public void init(FilterConfig config) throws ServletException {
		
		this.str=config.getInitParameter("str");
	}

}
