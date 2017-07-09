package dao;

import domain.Order;
import domain.User;

public interface IOrderDao {
	public boolean addOrder(Order order);
	public Order findOrderById(String id);
	public boolean updateOrder(Order order);
}
