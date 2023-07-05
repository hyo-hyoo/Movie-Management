package top.duangboss.dogemovie.service;

import java.util.List;

import org.springframework.stereotype.Service;

import top.duangboss.dogemovie.pojo.Hall;
import top.duangboss.dogemovie.util.Page;

@Service
public interface HallService {
	void add(Hall hall);
	
	void delete(Hall hall);
	
	Hall getByName(String hname);
	
	Hall getById(int hid);
	
	void update(Hall hall);
	
	List<Hall> list(Page page);
	
	List<Hall> listByCinema(int cid, Page page);
	
	int total(int hcid);
}
