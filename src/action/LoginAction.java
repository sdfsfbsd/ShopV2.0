package action;

import java.util.List;
import java.util.Set;

import javax.annotation.Resource;

import com.opensymphony.xwork2.ActionContext;
/**
 * 登陆Action
 * @author 杨涛
 * @date 2017年7月3日15:03:18
 * @modify BUPT
 * @modifyDate 
 */
import com.opensymphony.xwork2.ActionSupport;

import domain.Commodity;
import domain.Order;
import domain.User;
import service.IUserService;

public class LoginAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String userName;
	private String passWord;

	public LoginAction(String userName, String passWord) {
		super();
		this.userName = userName;
		this.passWord = passWord;
	}

	@Resource
	private IUserService userService;

	public IUserService getUserService() {
		return userService;
	}

	public void setUserService(IUserService userService) {
		this.userService = userService;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassWord() {
		return passWord;
	}

	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}

	public String login() throws Exception {
		// TODO Auto-generated method stub
		
		User user = userService.findUser(userName, passWord);
		if (user != null) {
			System.out.println("size :" +user.getShops().size());
			System.out.println("size2 :" +user.getOrders().size());
			ActionContext actionContext = ActionContext.getContext();
			actionContext.getSession().put("User", user);
			return SUCCESS;
		} else {
			return ERROR;
		}

	}
	
	public String logout() throws Exception {
		
		ActionContext actionContext = ActionContext.getContext();
		actionContext.getSession().remove("User");
		return SUCCESS;
		
	}
	
	
	public LoginAction() {
		super();
	}
	
	public String test() {
		
		try {
			System.out.println("第一个user。。。");
			User user = userService.findUser("admin");
			System.out.println("user:" + user.toString() +" " + user.getPassword());
			System.out.println("第二个user。。。");
			User user2 = userService.findUser("admin");
			System.out.println("user2:" + user2.toString()+" " + user2.getPassword());
			System.out.println("更新User。。。。");
			user.setPassword("124");
			userService.updateUser(user);
			System.out.println("第三个user。。。");
			User user3 = userService.findUser("admin");
			System.out.println("user3:" + user3.getPassword());
			return SUCCESS;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return ERROR;
		}
		
	}

}
