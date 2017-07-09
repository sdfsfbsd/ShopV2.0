package action;

import java.sql.Timestamp;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.annotation.Resource;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import domain.Commodity;
import domain.Order;
import domain.OrderId;
import domain.User;
import service.ICommodityService;
import service.IOrderService;
import service.IUserService;

public class BuyAction extends ActionSupport {
	@Resource
	private IOrderService iOrderService;

	@Resource
	private IUserService iUserService;

	@Resource
	private ICommodityService iCommodityService;
	
	private String guessPrice;
	
	private String id;

	public BuyAction(IOrderService iOrderService, IUserService iUserService, ICommodityService iCommodityService,
			String guessPrice, String id) {
		super();
		this.iOrderService = iOrderService;
		this.iUserService = iUserService;
		this.iCommodityService = iCommodityService;
		this.guessPrice = guessPrice;
		this.id = id;
	}

	public ICommodityService getiCommodityService() {
		return iCommodityService;
	}

	public void setiCommodityService(ICommodityService iCommodityService) {
		this.iCommodityService = iCommodityService;
	}

	public BuyAction(IOrderService iOrderService, IUserService iUserService, String guessPrice, String id) {
		super();
		this.iOrderService = iOrderService;
		this.iUserService = iUserService;
		this.guessPrice = guessPrice;
		this.id = id;
	}

	public String getGuessPrice() {
		return guessPrice;
	}

	public void setGuessPrice(String guessPrice) {
		this.guessPrice = guessPrice;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public IUserService getiUserService() {
		return iUserService;
	}

	public void setiUserService(IUserService iUserService) {
		this.iUserService = iUserService;
	}

	public IOrderService getiOrderService() {
		return iOrderService;
	}

	public void setiOrderService(IOrderService iOrderService) {
		this.iOrderService = iOrderService;
	}

	public BuyAction(IOrderService iOrderService) {
		super();
		this.iOrderService = iOrderService;
	}

	public BuyAction() {
		super();
	}

	public String buy() {
		try {
			
			Commodity c = new Commodity();
			ActionContext actionContext = ActionContext.getContext();
			User user1 = (User) actionContext.getSession().get("User");
			User user = iUserService.findUser(user1.getUsername(), user1.getPassword());
			int balance = user.getBalance();
			user.setBalance(balance - 1);
			
			List<Commodity> commodities = (List<Commodity>) actionContext.getSession().get("Item");

			Iterator<Commodity> iterator = commodities.iterator();
			//找出购买的物品
			while (iterator.hasNext()) {
				Commodity commodity2 = (Commodity) iterator.next();
				if (commodity2.getId().getIdcommodity() == Integer.parseInt(id)) {
					c = commodity2;
				}
			}

			if (guessPrice.endsWith(c.getCommPrice())) {
				System.out.println("LOG：猜中");
				//随机生成一个订单号
				String buffer = new Date().getTime() + "";
				@SuppressWarnings("deprecation")
				int OrderRadomId = Integer.parseInt(buffer.substring(6, 12)) * (new Date().getMinutes());
				
				OrderId orderId = new OrderId(OrderRadomId, user);

				Order order = new Order(orderId, c);
				Timestamp ts = new Timestamp(System.currentTimeMillis()); 
				order.setPurchaseTime(ts.valueOf(new Date().toLocaleString()));
				//更新数据库
				iOrderService.addOrder(order);
				Set<Order> orders = user.getOrders();
				orders.add(order);
				//更新订单session
				actionContext.getSession().put("UserOrder", orders);
				c.setIsSold(true);
				//更新数据库
				iCommodityService.updateCommodity(c);
			}
			
			actionContext.getSession().put("User", user);
			iUserService.updateUser(user);
			return SUCCESS;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return ERROR;
		}

	}

	public BuyAction(IOrderService iOrderService, IUserService iUserService, String id) {
		super();
		this.iOrderService = iOrderService;
		this.iUserService = iUserService;
		this.id = id;
	}
}
