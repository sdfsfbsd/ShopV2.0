package action;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import dao.impl.CommentDaoImpl;
import domain.Comment;
import domain.CommentId;
import domain.Shop;
import domain.User;
import service.ICommentService;

/**
 * 类描述：这是一个评论的 ACTION
 * @author buicyb
 *
 */
public class CommentAction extends ActionSupport {

	

	private String comment;
	private Integer type;
	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}
	/**
	 * 
	 */
	 @Resource
		private ICommentService icommentservice;
	 public ICommentService getIcommentservice() {
			return icommentservice;
		}

		public void setIcommentservice(ICommentService icommentservice) {
			this.icommentservice = icommentservice;
		}
		
	public String saveComment(){
		type=type*24;
		
		System.out.println("传进来的comment值:"+comment);
		HttpServletRequest request = ServletActionContext.getRequest ();
		Shop shop=(Shop)request.getSession().getAttribute("SellerShop");
		
		System.out.println("comment测试-shopID："+shop.getId().getIdshop());	
		User user=(User)request.getSession().getAttribute("User");
		CommentId cid=new CommentId(1,shop,user); 
		System.out.println("comment测试-commentID："+cid.getIdcomment());	
		
		/*comment = "comment测试";*/
		Comment cm=new Comment(cid,comment,type);
		CommentDaoImpl cd=new CommentDaoImpl();
		icommentservice.addComment(cm);
		/*cd.insertUser(cm);*/
		return SUCCESS;
	}
	   	
}

