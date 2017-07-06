package service;

import domain.Commodity;

/**
 * @author 王潇毅
 * @date 2017年7月4日15:01:44
 * @description 商品相关功能接口定义，包括查
 * @modify BUPT
 *
 */
public interface IShowitemService {
	public Commodity findCommodityById(String id);
}
