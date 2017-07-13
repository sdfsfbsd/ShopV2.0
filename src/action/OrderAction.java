package action;

import java.sql.Timestamp;

import javax.annotation.Resource;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import domain.Commodity;
import domain.Order;
import domain.Shop;
import domain.ShopId;
import domain.User;
import service.IShopService;
import service.IUserService;

public class OrderAction extends ActionSupport{
	
	private String commPicUrl;
	private Timestamp time;
	private String commName;
	private Integer orderID;
	private boolean state;
	private String sellerName;
	private String sellerPwd;
	private Integer shopId;
	
	public Integer getShopId() {
		return shopId;
	}

	public void setShopId(Integer shopId) {
		this.shopId = shopId;
	}
	@Resource
	private IUserService userService;
	private IShopService shopService;
	public IShopService getShopService() {
		return shopService;
	}

	public void setShopService(IShopService shopService) {
		this.shopService = shopService;
	}

	public IUserService getUserService() {
		return userService;
	}
	public void setUserService(IUserService userService) {
		this.userService = userService;
	}
	
	
	
	public String getSellerName() {
		return sellerName;
	}

	public void setSellerName(String sellerName) {
		this.sellerName = sellerName;
	}

	public String getSellerPwd() {
		return sellerPwd;
	}

	public void setSellerPwd(String sellerPwd) {
		this.sellerPwd = sellerPwd;
	}

	public boolean isState() {
		return state;
	}

	public void setState(boolean state) {
		this.state = state;
	}
	public Integer getOrderID() {
		return orderID;
	}
	public void setOrderID(Integer orderID) {
		this.orderID = orderID;
	}
	public String getCommPicUrl() {
		return commPicUrl;
	}
	public void setCommPicUrl(String commPicUrl) {
		this.commPicUrl = commPicUrl;
	}
	public Timestamp getTime() {
		return time;
	}
	public void setTime(Timestamp time) {
		this.time = time;
	}
	public String getCommName() {
		return commName;
	}
	public void setCommName(String commName) {
		this.commName = commName;
	}
	public String DisplayOrder(){
		System.out.println("正在执行OrderAction"+commPicUrl);
		/*String name = seller.getUsername();*/
		System.out.println("卖家姓名:"+sellerName+"卖家密码："+sellerPwd);
		System.out.println("图片路径："+commPicUrl+" 时间："+time+" 商品名称："+commName+" 订单ID:"+orderID+" 商品状态："+state);
		System.out.println("!!!!!!!!!!!");
		System.out.println("取得的shopID:"+shopId);
		User seller = userService.findUser(sellerName, sellerPwd);
		/*Shop shop = shopService.findShopById(shopId);*/
		ShopId shopid = new ShopId(shopId,seller);
		Shop shop = new Shop(shopid);
		
		/*System.out.println("结果是："+seller.getAdd1()+seller.getAdd2()+"shop结果是："+shop.getId().getIdshop());*/
		System.out.println("shop结果："+shop.getId().getUser().getUsername());
		ActionContext actionContext = ActionContext.getContext();
		actionContext.getSession().remove("ComPic");
		actionContext.getSession().remove("ComName");
		actionContext.getSession().remove("OrderID");
		actionContext.getSession().remove("OrderState");
		actionContext.getSession().remove("Seller");
		actionContext.getSession().remove("SellerShop");
		actionContext.getSession().put("ComPic", commPicUrl);
		actionContext.getSession().put("ComName", commName);
		actionContext.getSession().put("OrderID", orderID);
		actionContext.getSession().put("OrderState", state);
		actionContext.getSession().put("Seller", seller);
		actionContext.getSession().put("SellerShop", shop);
		User user = (User) ActionContext.getContext().getSession().get("User");
		System.out.println("get测试："+user.getUsername());
		//actionContext.getSession().put("ComPic", commPicUrl);
		return "success";
	}
	public OrderAction() {
		super();
	}
}