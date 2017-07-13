package dao;

import domain.Commodity;

public interface ICommodityDao {
	public boolean addCommodity(Commodity commodity);
	public Commodity findCommodityById(String id);
	public boolean updateCommodity(Commodity commodity);
}
