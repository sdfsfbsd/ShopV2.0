package service.Impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import dao.ICommodityDao;
import domain.Commodity;
import domain.Order;
import service.ICommodityService;
@Transactional
@Service
public class CommodityServiceImpl implements ICommodityService {
	
	@Resource
	private ICommodityDao icommodityDao;
	
	
	@Override
	public boolean addCommodity(Commodity commodity) {
		// TODO Auto-generated method stub
		try {
			icommodityDao.addCommodity(commodity);
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public Commodity findCommodityById(String id) {
		// TODO Auto-generated method stub
		Commodity commodity = new Commodity();
		commodity= icommodityDao.findCommodityById(id);
		return commodity;
	}

	@Override
	public boolean updateCommodity(Commodity commodity) {
		try {
			icommodityDao.updateCommodity(commodity);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

}
