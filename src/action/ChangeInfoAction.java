package action;

import javax.annotation.Resource;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import domain.User;
import service.IUserService;

public class ChangeInfoAction extends ActionSupport {

	private String userName;
	private String email;
	private String phone;
	private String newPassword;

	public ChangeInfoAction(String userName, String email, String phone, String newPassword, IUserService userService) {
		super();
		this.userName = userName;
		this.email = email;
		this.phone = phone;
		this.newPassword = newPassword;
		this.userService = userService;
	}

	public String getNewPassword() {
		return newPassword;
	}

	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}

	@Resource
	private IUserService userService;

	public ChangeInfoAction() {
		super();
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public IUserService getUserService() {
		return userService;
	}

	public void setUserService(IUserService userService) {
		this.userService = userService;
	}

	public String changeInfo() {
		try {
			ActionContext actionContext = ActionContext.getContext();

			User sessionUser = (User) actionContext.getSession().get("User");

			sessionUser.setUsername(userName);
			sessionUser.setPhone(phone);
			sessionUser.setAdd1(email);

			actionContext.getSession().put("User", sessionUser);
			System.out.println(userName + phone + email);

			userService.updateUser(sessionUser);

			return SUCCESS;

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return ERROR;
		}

	}

	public String changePassword() {
		try {
			ActionContext actionContext = ActionContext.getContext();

			User sessionUser = (User) actionContext.getSession().get("User");
			
			sessionUser.setPassword(newPassword);
			
			actionContext.getSession().put("User", sessionUser);
			System.out.println(newPassword);
			
			userService.updateUser(sessionUser);
			
			return SUCCESS;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return ERROR;
		}
	}
}
