package top.duangboss.dogemovie.service;

import java.util.List;

import org.springframework.stereotype.Service;

import top.duangboss.dogemovie.pojo.Order;
import top.duangboss.dogemovie.util.Page;

@Service
public interface OrderService {
	List<Order> list(Page page);

	void delete(int oid);

	Integer add(Order order);

	Order get(int uid);

	public List<Order> listByUser(int ouid);
}
