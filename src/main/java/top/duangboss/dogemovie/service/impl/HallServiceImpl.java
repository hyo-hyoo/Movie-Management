package top.duangboss.dogemovie.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import top.duangboss.dogemovie.mapper.HallMapper;
import top.duangboss.dogemovie.pojo.Hall;
import top.duangboss.dogemovie.util.Page;
import top.duangboss.dogemovie.service.HallService;

@Service
public class HallServiceImpl implements HallService{

	@Autowired
	HallMapper hallMapper;
	
	@Override
	public void add(Hall hall) {
		// TODO Auto-generated method stub
		hallMapper.add(hall);
	}

	@Override
	public void delete(Hall hall) {
		// TODO Auto-generated method stub
		hallMapper.delete(hall);
	}

	@Override
	public Hall getByName(String hname) {
		// TODO Auto-generated method stub
		return hallMapper.getByName(hname);
	}

	@Override
	public Hall getById(int hid) {
		// TODO Auto-generated method stub
		return hallMapper.getById(hid);
	}

	@Override
	public void update(Hall hall) {
		// TODO Auto-generated method stub
		hallMapper.update(hall);
	}

	@Override
	public List<Hall> list(Page page) {
		// TODO Auto-generated method stub
		return hallMapper.list(page);
	}

	@Override
	public List<Hall> listByCinema(int cid, Page page) {
		// TODO Auto-generated method stub
		return hallMapper.listByCinema(cid, page);
	}

	@Override
	public int total(int hcid) {
		// TODO Auto-generated method stub
		return hallMapper.total(hcid);
	}

}
