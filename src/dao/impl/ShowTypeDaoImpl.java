package dao.impl;


import java.sql.Timestamp;

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
	public List<Commodity> findCommodityByType(String type ,boolean flag) {
		// TODO Auto-generated method stub
		
		try {
			List<Commodity> list = new ArrayList<Commodity>();
			list = super.find("from Commodity as c where( c.type = ? and c.isSold = 0)",new String[]{type});
			if(flag ==true){
				List<Commodity> listofdate = new ArrayList<Commodity>();
				Timestamp now_time = new Timestamp(System.currentTimeMillis());
				Timestamp dead_time = new Timestamp(System.currentTimeMillis());
				dead_time.setHours(now_time.getHours()+23);
				dead_time.setMinutes(now_time.getMinutes()+59);
				dead_time.setSeconds(now_time.getSeconds()+59);
				String hql = "from Commodity as c where( c.expireTime between '" + now_time + "' and '" + dead_time + "')";
				listofdate = super.find(hql);
				ActionContext actionContext = ActionContext.getContext();
				actionContext.getSession().put("Deadline", listofdate);
				System.out.println(listofdate.size());
			}
			return list;
			
		} catch (Exception e) {
			e.printStackTrace();
			LOG.error(e);
			return null;
		}
	}

	@Override
	public List<Commodity> find(String hql, Commodity[] param) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Commodity get(String hql, Commodity[] param) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Long count(String hql, Commodity[] param) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Integer executeHql(String hql, Commodity[] param) {
		// TODO Auto-generated method stub
		return null;
	}

	

}
