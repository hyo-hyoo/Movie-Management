package top.duangboss.dogemovie.service;

import java.util.List;

import org.springframework.stereotype.Service;

import top.duangboss.dogemovie.pojo.Stuff;
import top.duangboss.dogemovie.util.Page;

@Service
public interface StuffService {
    public void add(Stuff stuff);
	
	public void delete(int stid);
	
	public Stuff get(int stid);
	
	public void update(Stuff stuff);
	
	public List<Stuff> list(Page page);
	
	public int count();
	
	public int getMax();
}