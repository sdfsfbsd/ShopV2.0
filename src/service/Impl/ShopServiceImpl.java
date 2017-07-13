package service.Impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import dao.IShopDao;
import dao.IUserDao;
import domain.Commodity;
import domain.Shop;
import domain.User;
import service.IShopService;
@Transactional
@Service
public class ShopServiceImpl implements IShopService {

	@Resource
	private IShopDao iShopDao;
	
	@Override
	public boolean addShop(Shop shop) {
		// TODO Auto-generated method stub
		try {
			iShopDao.addShop(shop);
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public Shop findShopById(Integer id) {
		// TODO Auto-generated method stub
		Shop shop= new Shop();
		shop=iShopDao.findShopById(id);
		if(shop==null){
			return null;
		}else{
			return shop;
		}
	}



}
