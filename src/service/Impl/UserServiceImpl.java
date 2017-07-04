package service.Impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import dao.IUserDao;
import domain.User;
import service.IUserService;
@Transactional
@Service
public class UserServiceImpl implements IUserService {

	@Resource
	private IUserDao iUserDao;
   
	@Override
	public User findUser(String userName, String password) {
		// TODO Auto-generated method stub
		User user= new User();
		user.setUsername(userName);
		user.setPassword(password);
		user=iUserDao.findUser(user);
		if(user==null || !user.getPassword().equals(password)){
			return null;
		}else{
			return user;
		}
	}
	

	@Override
	public List<User> findAllUser() {
		// TODO Auto-generated method stub
		return iUserDao.findAllUser();
	}	
	
	
	
}
