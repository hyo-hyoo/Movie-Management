package top.duangboss.dogemovie.mapper;

import java.util.List;

import top.duangboss.dogemovie.pojo.Order;
import top.duangboss.dogemovie.util.Page;

public interface OrderMapper {

    public Integer add(Order order);

    public void delete(int oid);

    public Order get(int oid);

    public List<Order> list(Page page);

    public int count();

    public List<Order> listByUser(int ouid);
}