package service;

import java.util.List;
import java.util.Map;

import domain.User;

/**
 * @author 杨涛
 * @date 2017年7月3日16:23:44
 * @description 用户相关功能接口定义，包括增删改查
 * @modify BUPT
 *
 */

public interface IUserService {
	public User findUser(String userName, String password);
	public User findUser(String userName);
	public boolean insertUser(User user);
	public List<User> searchUser(String choose);
	public boolean deleteUser(String id);
	public boolean addUser(User user);
	public boolean updateUser(User user);	
	public List findPage(Map param,Integer page,Integer rows);
	public Long count(Map param );
	public List<User> findAllUser();
}
