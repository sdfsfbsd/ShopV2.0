package action;

import javax.annotation.Resource;
import com.opensymphony.xwork2.ActionSupport;
import domain.Commodity;
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
	
	
	public String Showitem() throws Exception {
		// TODO Auto-generated method stu
		Commodity c =new Commodity();
		c = showitemService.findCommodityById(idcommodity);
		//System.out.println("Name:" + c.getCommName());
		System.out.println(idcommodity);
		return "success";
	}

	public ShowitemAction() {
		super();
	}

}
