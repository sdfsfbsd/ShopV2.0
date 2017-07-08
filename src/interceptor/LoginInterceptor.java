package interceptor;

import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;

public class LoginInterceptor extends MethodFilterInterceptor {

	@Override
	protected String doIntercept(ActionInvocation arg0) throws Exception {
		// TODO Auto-generated method stub
		
		ActionContext actionContext = ActionContext.getContext();
		
		Map<String, Object> session = actionContext.getSession();
		
		if (session.get("User")==null){
			 return "index.jsp";
			
		}
		return null;
	}

}
