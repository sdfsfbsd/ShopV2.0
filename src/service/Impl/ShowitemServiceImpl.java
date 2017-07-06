package service.Impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import dao.IShowitemDao;
import domain.Commodity;
import domain.User;
import service.IShowitemService;

@Transactional
@Service
public class ShowitemServiceImpl implements IShowitemService{
	
	@Resource
	private IShowitemDao ishowitemDao;

	@Override
	public Commodity findCommodityById(String id) {
		// TODO Auto-generated method stub
		Commodity commodity= new Commodity();
		commodity=ishowitemDao.findCommodityById(id);
		if(commodity==null){
			return null;
		}else{
			return commodity;
		}
	}
	
	

}
