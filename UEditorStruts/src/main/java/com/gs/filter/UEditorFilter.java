package com.gs.filter;

import org.apache.struts2.dispatcher.ng.filter.StrutsPrepareAndExecuteFilter;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by Administrator on 2017/10/19.
 */
public class UEditorFilter extends StrutsPrepareAndExecuteFilter {

    @Override
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) req;
        if (request.getRequestURL().indexOf("ueditor/jsp/controller.jsp") >= 0) {
            // 如果是访问ueditor的contrller.jsp页面，则直接放行
            chain.doFilter(req, res);
        } else{
            // 否则使用struts的过滤器
            super.doFilter(req, res, chain);
        }
    }
}
