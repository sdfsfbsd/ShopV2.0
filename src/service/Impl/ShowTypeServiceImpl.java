package service.Impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import dao.IShowTypeDao;
import domain.Commodity;
import domain.User;
import service.IShowTypeService;;

@Transactional
@Service
public class ShowTypeServiceImpl implements IShowTypeService{
	
	@Resource
	private IShowTypeDao ishowTypeDao;

	@Override
	public List<Commodity> findCommodityByType(String type,boolean flag) {
		// TODO Auto-generated method stub
		
		List<Commodity> items = new ArrayList<Commodity>();
		items = ishowTypeDao.findCommodityByType(type,flag);
		return items;
	}
	
	

}
