package action;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;

/**
 * µÇÂ½Action
 * @author ÑîÌÎ
 * @date 2017Äê7ÔÂ3ÈÕ15:03:18
 * @modify BUPT
 * @modifyDate 
 */
import com.opensymphony.xwork2.ActionSupport;

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

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub

		 List<User> list = new ArrayList<User>();
		 list = userService.findAllUser();
		//
		 System.out.println("list:" + list.size());
		System.out.println(userName);
		// Iterator<User> iterator = list.iterator();
		//
		// while (iterator.hasNext()) {
		// User user2 = (User) iterator.next();
		// if
		// (user2.getuserName().endsWith(userName)&&user2.getpassWord().endsWith(passWord)){
		// return "success";
		// }
		// }
		//
		return "success";

	}

	public LoginAction() {
		super();
	}

}
