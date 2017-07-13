package service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import domain.User;

/**
 * @author ����
 * @date 2017��7��3��16:23:44
 * @description �û���ع��ܽӿڶ��壬������ɾ�Ĳ�
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
