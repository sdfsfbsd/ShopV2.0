package service.Impl;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
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
	@Cacheable(value="User")
	public User findUser(String userName){
		User user = new User();
		user.setUsername(userName);
//		System.err.println("finding user.......");
		user = iUserDao.findUser(user);
		if(user == null){
			return null;
		}else{
			return user;
		}
	}
	
	 
	/* (non-Javadoc)
	 * @see com.buptsse.spm.service.IUserService#insertUser(com.buptsse.spm.domain.User)
	 */
	@Override
	public boolean insertUser(User user) {
		// TODO Auto-generated method stub
		return false;
	}

	/* (non-Javadoc)
	 * @see com.buptsse.spm.service.IUserService#searchUser(java.lang.String)
	 */
	@Override
	public List<User> searchUser(String choose) {
		// TODO Auto-generated method stub
		return null;
	}

	/* (non-Javadoc)
	 * @see com.buptsse.spm.service.IUserService#deleteUser(java.lang.String)
	 */
	@Override
	public boolean deleteUser(String id) {
		// TODO Auto-generated method stub
		User user = new User();
		user= iUserDao.findUserById(id);
		
		return iUserDao.deleteUser(user);
	}

	/* (non-Javadoc)
	 * @see com.buptsse.spm.service.IUserService#addUser(com.buptsse.spm.domain.User)
	 */
	@Override
	public boolean addUser(User user) 
	{
		
		return iUserDao.addUser(user);
	}

	@Override
	@CacheEvict(value="User", allEntries=true)
	public boolean updateUser(User user) {
		return iUserDao.updateUser(user);
	}

	@Override
	public List findPage(Map param, Integer page, Integer rows) {
		// TODO Auto-generated method stub
		String hql = "from User where 1=1 ";
		List paramList = new ArrayList();
		Iterator iter = param.keySet().iterator();
		
		while (iter.hasNext()){
			String key = (String) iter.next();
			String value = (String) param.get(key);
			if(!"".equals(value)){
				hql+="and "+key+"=? ";
				paramList.add(value);				
			}
		}		
		
		return iUserDao.findPage(hql,paramList, page, rows);		
		
	}

	@Override
	public Long count(Map param) {
		// TODO Auto-generated method stub
		String hql = "select count(*) from User where 1=1 ";
		List paramList = new ArrayList();
		Iterator iter = param.keySet().iterator();
		
		while (iter.hasNext()){
			String key = (String) iter.next();
			String value = (String) param.get(key);
			System.out.println("&&&&&value&&&&:"+value);
			if(!"".equals(value)){
				hql+="and "+key+"=? ";
				paramList.add(value);				
			}
		}		
		
		return iUserDao.countUser(hql, paramList);
	}


	@Override
	public List<User> findAllUser() {
		// TODO Auto-generated method stub
		return iUserDao.findAllUser();
	}	
	
	
	
}
