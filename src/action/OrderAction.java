package action;

import java.sql.Timestamp;

import javax.annotation.Resource;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import domain.Commodity;
import domain.Order;
import service.IUserService;

public class OrderAction extends ActionSupport{
	
	private String commPicUrl;
	private Timestamp time;
	private String commName;
	private Integer orderID;


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
		System.out.println("图片路径："+commPicUrl+"时间："+time+"商品名称："+commName+"订单ID:"+orderID);
		System.out.println("!!!!!!!!!!!");
		ActionContext actionContext = ActionContext.getContext();
		actionContext.getSession().remove("ComPic");
		actionContext.getSession().remove("ComName");
		actionContext.getSession().remove("OrderID");
		actionContext.getSession().put("ComPic", commPicUrl);
		actionContext.getSession().put("ComName", commName);
		actionContext.getSession().put("OrderID", orderID);
		//actionContext.getSession().put("ComPic", commPicUrl);
		return "success";
	}
	public OrderAction() {
		super();
	}
}