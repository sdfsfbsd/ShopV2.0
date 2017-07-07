package action;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.Set;

import javax.annotation.Resource;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import domain.Commodity;
import domain.CommodityId;
import domain.Shop;
import domain.User;
import service.ICommodityService;
import service.IUserService;

public class ShopAction extends ActionSupport {
	@Resource
	private IUserService userService;
	
	@Resource 
	private ICommodityService commodityService;
	
	public ICommodityService getCommodityService() {
		return commodityService;
	}

	public void setCommodityService(ICommodityService commodityService) {
		this.commodityService = commodityService;
	}

	private String number;
	private String name;
	private String price;
	private String picUrl;
	private String description;
	private String type;
	private String time;
	
	
	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	
	
	public ShopAction(IUserService userService, ICommodityService commodityService, String number, String name,
			String price, String picUrl, String description, String type, String time) {
		super();
		this.userService = userService;
		this.commodityService = commodityService;
		this.number = number;
		this.name = name;
		this.price = price;
		this.picUrl = picUrl;
		this.description = description;
		this.type = type;
		this.time = time;
	}

	public ShopAction(IUserService userService, ICommodityService commodityService, String number, String name,
			String price, String picUrl, String description, String type) {
		super();
		this.userService = userService;
		this.commodityService = commodityService;
		this.number = number;
		this.name = name;
		this.price = price;
		this.picUrl = picUrl;
		this.description = description;
		this.type = type;
	}

	public ShopAction(IUserService userService, String number, String name, String price, String picUrl,
			String description, String type) {
		super();
		this.userService = userService;
		this.number = number;
		this.name = name;
		this.price = price;
		this.picUrl = picUrl;
		this.description = description;
		this.type = type;
	}

	public ShopAction(IUserService userService, String number, String name, String price, String picUrl,
			String description) {
		super();
		this.userService = userService;
		this.number = number;
		this.name = name;
		this.price = price;
		this.picUrl = picUrl;
		this.description = description;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public IUserService getUserService() {
		return userService;
	}

	public void setUserService(IUserService userService) {
		this.userService = userService;
	}

	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getPicUrl() {
		return picUrl;
	}

	public void setPicUrl(String picUrl) {
		this.picUrl = picUrl;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public ShopAction() {
		super();
	}

	public String myGuess() {
		try {
			ActionContext actionContext = ActionContext.getContext();
			User user1 = (User) actionContext.getSession().get("User");
			User user = userService.findUser(user1.getUsername(), user1.getPassword());
			Shop shop = new Shop();
			Set<Shop> shops = user.getShops();
			Iterator<Shop> iterator = shops.iterator();
			while (iterator.hasNext()) {
				shop = (Shop) iterator.next();
			}
			System.out.println(shop.getId().getIdshop());
			Set<Commodity> commodities = shop.getCommodities();
			System.out.println("commodities size is:" + commodities.size());
			actionContext.getSession().put("Commodities", commodities);

			return SUCCESS;

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return ERROR;
		}

	}

	public String newCommody() {
		try {
			ActionContext actionContext = ActionContext.getContext();

			User sessioUser = (User) actionContext.getSession().get("User");

			User user = userService.findUser(sessioUser.getUsername(), sessioUser.getPassword());
			
			Shop shop = new Shop();
			Set<Shop> shops = user.getShops();
			Iterator<Shop> iterator = shops.iterator();
			while (iterator.hasNext()) {
				shop = (Shop) iterator.next();
			}
			
			Set<Commodity> commodities1 = shop.getCommodities();
			System.out.println("old commodities size is:" + commodities1.size());
			
			String buffer = new Date().getTime() + "";
			@SuppressWarnings("deprecation")
			int CommodityRadomId = Integer.parseInt(buffer.substring(6, 12)) * (new Date().getMinutes());
			
			CommodityId commodityId = new CommodityId(CommodityRadomId, shop);
			System.out.println("the " + name + " " + price + " "  + number + " "  + description + " "  + type  + " " + picUrl);
			
			System.out.println(name + " " + price + number + description + type + picUrl);
			
			String buffString = "/jpg/" +picUrl;
			
			Commodity commodity = new Commodity(commodityId, name, price, number, description, type, false);
			
			commodity.setCommPicUrl(buffString);
			
			time+=":00";
			System.out.println("time is:" + time);
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			
			Date expireDate = sdf.parse(time);
			
			commodity.setExpireTime(expireDate);
			
			commodityService.addCommodity(commodity);
			
			commodities1.add(commodity);
			
			actionContext.getSession().put("Commodities", commodities1);
			
			//ÖØÐÂË¢ÐÂcommodity Set
//			User user2 = userService.findUser(sessioUser.getUsername(), sessioUser.getPassword());
//			Shop shop2 = new Shop();
//			Set<Shop> shops2 = user2.getShops();
//			Iterator<Shop> iterator2 = shops2.iterator();
//			while (iterator2.hasNext()) {
//				shop2 = (Shop) iterator2.next();
//			}
//			System.out.println(shop2.getId().getIdshop());
//			Set<Commodity> commodities2 = shop2.getCommodities();
//			System.out.println("new commodities size is:" + commodities2.size());
//			actionContext.getSession().put("Commodities", commodities2);
//			
			return SUCCESS;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return ERROR;
		}
	}

}
