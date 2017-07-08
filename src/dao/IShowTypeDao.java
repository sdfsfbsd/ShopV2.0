package dao;

import java.util.List;

import domain.Commodity;

/**
 * @author 唐威
 * @date 2017年7月3日 14:36
 * @description	商品信息持久层接口定义，包括商品查询
 * @modify BUPT
 * @modifyDate 
 */

public interface IShowTypeDao {
	public List<Commodity> findCommodityByType(String type);

}