package service;

import domain.Commodity;
import domain.Shop;

public interface IShopService {
	public boolean addShop(Shop shop);
	public Shop findShopById(Integer id);
}
