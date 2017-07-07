package dao.impl;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import dao.IShopDao;
import domain.Shop;

@Repository
public class ShopDaoImpl extends BaseDaoImpl<Shop> implements IShopDao {
	private static Logger LOG = Logger.getLogger(ShopDaoImpl.class);

	@Override
	public List<Shop> find(String hql, Shop[] param) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Shop get(String hql, Shop[] param) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Long count(String hql, Shop[] param) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Integer executeHql(String hql, Shop[] param) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean addShop(Shop shop) {
		try {
			super.save(shop);
		} catch (Exception e) {
			e.printStackTrace();
			LOG.error(e);
			return false;
		}
		return true;
	}



}
