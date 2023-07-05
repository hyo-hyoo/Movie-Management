package top.duangboss.dogemovie.mapper;

import java.util.List;

import top.duangboss.dogemovie.pojo.Stuff;
import top.duangboss.dogemovie.util.Page;

public interface StuffMapper {

	public void add(Stuff stuff);
	
	public void delete(int stid);
	
	public Stuff get(int stid);
	
	public void update(Stuff stuff);
	
	public List<Stuff> list(Page page);
	
	public int count();

	public int getMax();
}
