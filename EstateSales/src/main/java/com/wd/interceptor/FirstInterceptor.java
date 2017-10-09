package com.wd.interceptor;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;

public class FirstInterceptor extends MethodFilterInterceptor{
	
	private static final long serialVersionUID = 1L;
	@Override
	protected String doIntercept(ActionInvocation invocation) throws Exception {
		invocation.getInvocationContext().getParameters()
		.put("comment", "拦截器添加的参数");
		String result = invocation.invoke();
		return result;
	}
}