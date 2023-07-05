package top.duangboss.dogemovie.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import top.duangboss.dogemovie.pojo.Hall;
import top.duangboss.dogemovie.util.Page;

public interface HallMapper {
	public void add(Hall hall);
	
	public void delete(Hall hall);
	
	public Hall getByName(String hname);
	
	public Hall getById(int hid);
	
	public void update(Hall hall);
	
	public List<Hall> list(Page page);
	
	
	public List<Hall> listByCinema(@Param("cid") int cid,@Param("page") Page page);
	
	public int total(int hcid);
}
