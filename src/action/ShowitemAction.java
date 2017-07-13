package action;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import domain.Commodity;
import service.IShowcomService;
import service.IShowitemService;

public class ShowitemAction  extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String idcommodity;

	public ShowitemAction(String idcommodity) {
		super();
		this.idcommodity = idcommodity;
	}

	@Resource
	private IShowitemService showitemService;

	public IShowitemService getShwotiemService() {
		return showitemService;
	}

	public void setShowitemService(IShowitemService showitemService) {
		this.showitemService = showitemService;
	}

	public String getIdcommodity() {
		return idcommodity;
	}

	public void setIdcommodity(String idcommodity) {
		this.idcommodity = idcommodity;
	}
	
	
	public boolean Showitem() throws Exception {
		// TODO Auto-generated method stu
		Commodity c =new Commodity();
		c = showitemService.findCommodityById(idcommodity);
		//System.out.println("Name:" + c.getCommName());
		return true;
	}
	
	@Resource
	private IShowcomService showcomService;

	public IShowcomService getShowcomService() {
		return showcomService;
	}

	public void setShowcomService(IShowcomService showcomService) {
		this.showcomService = showcomService;
	}
	
	public boolean Showcom() throws Exception {
		// TODO Auto-generated method stu
		boolean t = true;
		t = showcomService.findComment();
		//System.out.println("Name:" + c.getCommName());
		System.out.println(t);
		return t;
	}
	
	
	public String execute() throws Exception {
		if(Showitem()){
			if(Showcom()){
				System.out.println("Õý³£");
				return "success";
				}
			else
				return "error";
			}
		else{
			return "error";
		}
	}
	
	public ShowitemAction() {
		super();
	}

}
