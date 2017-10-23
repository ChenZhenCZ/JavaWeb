package com.gs.common;

import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by Administrator on 2017/10/19.
 */
public class MyMultipartResolver extends CommonsMultipartResolver {

    /**
     * 重写springmvc提供 的ismultipart的方法，如果是百度的上传，则使用百度自带的上传组件，返回false
     * @param request
     * @return
     */
    @Override
    public boolean isMultipart(HttpServletRequest request) {
        String uri = request.getRequestURI();
        if (uri.indexOf("/ueditor/core") >= 0) {
            return false; // 请使用UEditor的文件上传
        } else {
            return super.isMultipart(request); // springmvc的
        }
    }

}
