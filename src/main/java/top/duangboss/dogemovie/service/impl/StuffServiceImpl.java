package top.duangboss.dogemovie.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import top.duangboss.dogemovie.mapper.StuffMapper;
import top.duangboss.dogemovie.pojo.Stuff;
import top.duangboss.dogemovie.service.StuffService;
import top.duangboss.dogemovie.util.Page;
	
	
@Service
public class StuffServiceImpl implements StuffService{
	@Autowired
	StuffMapper stuffMapper;
	
	@Override
    public List<Stuff> list(Page page){
    	return stuffMapper.list(page);
    }
	
	@Override
	public void update(Stuff stuff) {
		stuffMapper.update(stuff);
	}
	
	@Override
	public void delete(int stid) {
		stuffMapper.delete(stid);
	}
	
	@Override
	public void add(Stuff stuff) {
		stuffMapper.add(stuff);
	}
	
	@Override
	public Stuff get(int stid) {
		return stuffMapper.get(stid);
	}
	
	@Override
	public int count() {
		return stuffMapper.count();
	}
	
	public int getMax() {
		return stuffMapper.getMax();
	}
}
