package service;

import java.util.List;
import domain.Commodity;

/**
 * @author 唐威
 * @date 2017年7月4日14:33:44
 * @description 商品相关功能接口定义，包括查
 * @modify BUPT
 *
 */
public interface IShowTypeService {
	public List<Commodity> findCommodityByType(String type,boolean flag);
}

