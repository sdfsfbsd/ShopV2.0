package service;

import domain.Commodity;
import domain.Shop;

public interface ICommodityService {
	public boolean addCommodity(Commodity commodity);
	public Commodity findCommodityById(String id);
	public boolean updateCommodity(Commodity commodity);
}
