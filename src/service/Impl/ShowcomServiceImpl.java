package service.Impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import dao.IShowcomDao;
import dao.IShowitemDao;
import domain.Commodity;
import service.IShowcomService;
import service.IShowitemService;

@Transactional
@Service
public class ShowcomServiceImpl  implements IShowcomService{
	
	@Resource
	private IShowcomDao ishowcomDao;

	@Override
	public boolean findComment() {
		// TODO Auto-generated method stub
		boolean p = true;
		p=ishowcomDao.findComment();
		if(p== true){
			return true;
		}else{
			return false;
		}
	}

}
