package dao.impl;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Repository;

import dao.ICommodityDao;
import domain.Commodity;
import domain.Order;
@Repository
public class CommodityDaoImpl extends BaseDaoImpl<Commodity> implements ICommodityDao {
	private static Logger LOG = Logger.getLogger(CommodityDaoImpl.class);
	@Override
	public boolean addCommodity(Commodity commodity) {
		// TODO Auto-generated method stub
		try {
			super.save(commodity);
		} catch (Exception e) {
			e.printStackTrace();
			LOG.error(e);
			return false;
		}
		return true;
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
	@Override
	public Commodity findCommodityById(String id) {
		return super.get(Commodity.class, id);
	}
	@Override
	public boolean updateCommodity(Commodity commodity) {
		try {
			super.update(commodity);
		} catch (Exception e) {
			e.printStackTrace();
			LOG.error(e);
			return false;
		}
		return true;
	}

}
