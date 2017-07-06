package dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Repository;

import com.opensymphony.xwork2.ActionContext;

import dao.IShowitemDao;
import domain.Commodity;
import domain.User;

@Repository
public class ShowitemDaoImpl extends BaseDaoImpl<Commodity> implements IShowitemDao{
	private static Logger LOG = Logger.getLogger(ShowitemDaoImpl.class);
	
	@Override
	public Commodity findCommodityById(String idcommodity) {
		// TODO Auto-generated method stub
		try {
			List<Commodity> list = new ArrayList<Commodity>();
			list = super.find("from Commodity");
			for (int i = 0; i < list.size(); i++) {
				if (idcommodity.equals(list.get(i).getId())) {
					ActionContext actionContext = ActionContext.getContext(); 
				    actionContext.getSession().put("item", list.get(i));
					return list.get(i);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			LOG.error(e);
			return null;
		}
		return null;
	}

}
