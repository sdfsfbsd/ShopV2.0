package dao;

import domain.Commodity;

/**
 * @author 王潇毅
 * @date 2017年7月4日 下午2:46
 * @description	商品信息持久层接口定义，包括商品查询
 * @modify BUPT-TC
 * @modifyDate 
 */

public interface IShowitemDao {
	public Commodity findCommodityById(String id);

}
