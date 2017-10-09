package com.wd.interceptor;

import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;
import com.wd.bean.AgencyVO;
import com.wd.bean.EmployeeVO;

public class employInterceptor extends MethodFilterInterceptor{

	@Override
	protected String doIntercept(ActionInvocation action) throws Exception {
			ActionContext act=action.getInvocationContext();
			Map session=act.getSession();
			EmployeeVO employee=(EmployeeVO)session.get("emp");
			AgencyVO agency= (AgencyVO)session.get("agencyVO");
			
			 if(agency!=null){

				return action.invoke();
			}else if(employee==null){
				return "errors";
			}else{
				return action.invoke();
			}
	}
}
