package top.duangboss.dogemovie.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import top.duangboss.dogemovie.mapper.OrderMapper;
import top.duangboss.dogemovie.pojo.Order;
import top.duangboss.dogemovie.service.OrderService;
import top.duangboss.dogemovie.util.Page;

@Service
public class OrderServiceImpl implements OrderService{
	@Autowired
	OrderMapper orderMapper;

	public List<Order> list(Page page){
		return orderMapper.list(page);
	}

	public void delete(int oid){
		orderMapper.delete(oid);
	}

	public Integer add(Order order) {
		orderMapper.add(order);

		return order.getOid();
	}

	public Order get(int oid) {
		return orderMapper.get(oid);
	}

	public List<Order> listByUser(int ouid) {
		return orderMapper.listByUser(ouid);
	}
}
