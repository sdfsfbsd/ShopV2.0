package service;

import domain.Order;

public interface IOrderService {
	public boolean addOrder(Order order);
	public Order findOrderById(String id);
	public boolean updateOrder(Order order);
}
