package dao.impl;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Repository;

import dao.IOrderDao;
import domain.Order;
import domain.User;

@Repository
public class OrderDaoImpl extends BaseDaoImpl<Order> implements IOrderDao {
	private static Logger LOG = Logger.getLogger(OrderDaoImpl.class);

	@Override
	public boolean addOrder(Order order) {
		try {
			super.save(order);
		} catch (Exception e) {
			e.printStackTrace();
			LOG.error(e);
			return false;
		}
		return true;
	}

	@Override
	public List<Order> find(String hql, Order[] param) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Order get(String hql, Order[] param) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Long count(String hql, Order[] param) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Integer executeHql(String hql, Order[] param) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Order findOrderById(String id) {
		return super.get(Order.class, id);
	}

	@Override
	public boolean updateOrder(Order order) {
		try {
			super.update(order);
		} catch (Exception e) {
			e.printStackTrace();
			LOG.error(e);
			return false;
		}
		return true;
	}

}
