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

	public List<User> findAllUser();
}
