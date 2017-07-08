package dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Repository;

import com.opensymphony.xwork2.ActionContext;

import dao.IShowTypeDao;
import domain.Commodity;
import domain.User;

@Repository
public class ShowTypeDaoImpl extends BaseDaoImpl<Commodity> implements IShowTypeDao{
	private static Logger LOG = Logger.getLogger(ShowTypeDaoImpl.class);
	
	@Override
	public List<Commodity> findCommodityByType(String type) {
		// TODO Auto-generated method stub
		
		try {
			List<Commodity> list = new ArrayList<Commodity>();
			//list = super.find("from Commodity commodity where commodity.type = \"" + type + "\"");
			list = super.find("from Commodity as c where c.type = ?",new String[]{type});
			/*ActionContext actionContext = ActionContext.getContext(); 
			actionContext.getSession().put("item", list);*/
			return list;
			
		} catch (Exception e) {
			e.printStackTrace();
			LOG.error(e);
			return null;
		}
	}

}
