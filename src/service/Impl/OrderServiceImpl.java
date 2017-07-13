package service.Impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import dao.IOrderDao;
import dao.IUserDao;
import domain.Order;
import domain.User;
import service.IOrderService;

@Transactional
@Service
public class OrderServiceImpl implements IOrderService {

	@Resource
	private IOrderDao iOrderDao;

	@Override
	public boolean addOrder(Order order) {
		// TODO Auto-generated method stub
		try {
			iOrderDao.addOrder(order);
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public Order findOrderById(String id) {
		// TODO Auto-generated method stub
		Order order = new Order();
		order = iOrderDao.findOrderById(id);
		return order;
	}

	@Override
	public boolean updateOrder(Order order) {
		// TODO Auto-generated method stub
		try {
			iOrderDao.updateOrder(order);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

}
