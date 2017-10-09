package com.wd.interceptor;

import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;
import com.wd.bean.UsersVO;

public class userLoginInterceptor extends MethodFilterInterceptor{
	private static final long serialVersionUID = 1L;

	@Override
	protected String doIntercept(ActionInvocation action) throws Exception {
		ActionContext act = action.getInvocationContext();
		Map session= act.getSession();
		UsersVO user = (UsersVO) session.get("user");
		if(user==null){
			return "errors";
		}else{
			return action.invoke();
		}
		
	}

}
