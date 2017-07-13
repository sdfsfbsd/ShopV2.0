package dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Repository;

import com.opensymphony.xwork2.ActionContext;

import dao.IShowcomDao;
import dao.IShowitemDao;
import domain.Comment;
import domain.Commodity;
@Repository
public class ShowcomDaoImpl extends BaseDaoImpl<Comment> implements IShowcomDao{
	private static Logger LOG = Logger.getLogger(ShowitemDaoImpl.class);
	@Override
	public boolean findComment() {
		try {
			List<Comment> clist = new ArrayList<Comment>();
			//int id = Integer.parseInt(idcommodity);
			//List<Commodity> list2 = new ArrayList<Commodity>();
			//list2 = super.find("from Commodity as c where c.id.idcommodity =?",new Integer[]{id});
			Commodity comd = new Commodity();
			 
			ActionContext actionContext = ActionContext.getContext(); 
			comd = (Commodity) actionContext.getSession().get("item");
			int shopid = comd.getId().getShop().getId().getIdshop();
			clist = super.find("from Comment as o where o.id.shop.id.idshop =?",new Integer[]{shopid});
		    System.out.print("ÆÀÂÛ¸öÊý"+clist.size());
		    ActionContext actionContext3 = ActionContext.getContext(); 
		    actionContext3.getSession().put("csize", clist.size());   
		    ActionContext actionContext2 = ActionContext.getContext(); 
		    actionContext2.getSession().put("clist", clist);
		    return true;
		    
		} catch (Exception e) {
			e.printStackTrace();
			LOG.error(e);
			return false;
		}
	}
	@Override
	public List<Comment> find(String hql, Comment[] param) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public Comment get(String hql, Comment[] param) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public Long count(String hql, Comment[] param) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public Integer executeHql(String hql, Comment[] param) {
		// TODO Auto-generated method stub
		return null;
	}
}
