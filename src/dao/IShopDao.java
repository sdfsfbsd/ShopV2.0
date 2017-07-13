package dao;

import domain.Commodity;
import domain.Shop;

/**
 * @author 杨涛
 * @date 2015年10月11日 下午2:46
 * @description	用户信息持久层接口定义，包括用户增加，保存，查询
 * @modify BUPT-TC
 * @modifyDate 
 */
public interface IShopDao {
	public boolean addShop(Shop shop);
	public Shop findShopById(Integer id);
}
