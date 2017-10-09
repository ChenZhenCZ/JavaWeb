package com.wd.interceptor;


import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;
import com.wd.bean.AdminVO;

public class adminLoginInterceptor extends MethodFilterInterceptor{

	@Override
	protected String doIntercept(ActionInvocation action) throws Exception {
		ActionContext act=action.getInvocationContext();
		Map session=act.getSession();
		AdminVO admin=(AdminVO)session.get("admin");
		if(admin==null){
			return "errors";
		}else{
			return action.invoke();
		}
	}
	


}
