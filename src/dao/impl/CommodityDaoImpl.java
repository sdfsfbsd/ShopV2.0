package dao.impl;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Repository;

import dao.ICommodityDao;
import domain.Commodity;
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

}
