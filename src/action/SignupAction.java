package action;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.annotation.Resource;

import com.opensymphony.xwork2.ActionSupport;

import domain.Shop;
import domain.ShopId;
import domain.User;
import service.IShopService;
import service.IUserService;
import service.Impl.ShopServiceImpl;

public class SignupAction extends ActionSupport {
	private String userName;
	private String passWord;
	private String email;

	private String passWordConfirmed;

	@Resource 
	private IShopService shopService;
	
	
	public SignupAction(String userName, String passWord, String email, String passWordConfirmed,
			IShopService shopService, IUserService userService) {
		super();
		this.userName = userName;
		this.passWord = passWord;
		this.email = email;
		this.passWordConfirmed = passWordConfirmed;
		this.shopService = shopService;
		this.userService = userService;
	}

	public IShopService getShopService() {
		return shopService;
	}

	public void setShopService(IShopService shopService) {
		this.shopService = shopService;
	}

	@Resource
	private IUserService userService;


	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassWordConfirmed() {
		return passWordConfirmed;
	}

	public void setPassWordConfirmed(String passWordConfirmed) {
		this.passWordConfirmed = passWordConfirmed;
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

	public IUserService getUserService() {
		return userService;
	}

	public void setUserService(IUserService userService) {
		this.userService = userService;
	}

	public SignupAction() {
		super();
	}

	public String signup() throws Exception {
		try {
			String picUrl = "D:\\JAVA_work\\MyEclipse\\ShopV2.0\\WebRoot\\jpg";
			String phone = "123123";
			System.out.println(userName + passWord + email);
			User user = new User(userName, passWord, email, phone, 100, picUrl);
			String buffer = new Date().getTime() + "";
			@SuppressWarnings("deprecation")
			int ShopID = Integer.parseInt(buffer.substring(6, 12)) * (new Date().getMinutes());
			ShopId shopId = new ShopId(ShopID, user);
			Shop shop = new Shop(shopId);
//			Set<Shop> shops = new HashSet<Shop>();
//			shops.add(shop);
//			user.setShops(shops);
//			ShopDAO shopDAO = new ShopDAO();
//			shopDAO.save(shop);
			userService.addUser(user);
			shopService.addShop(shop);
			return SUCCESS;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return ERROR;
		}

	}
}
