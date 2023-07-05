package top.duangboss.dogemovie.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import top.duangboss.dogemovie.pojo.Cinema;
import top.duangboss.dogemovie.util.Page;

@Service
public interface CinemaService {
	void add(Cinema cinema);
	
	void delete(Cinema cinema);
	
	Cinema getByName(String cname);
	
	Cinema getById(int cid);
	
	void update(Cinema cinema);
	
	List<Cinema> list1();
	
	List<Cinema> listByFilm(int fid);
	
	List<Cinema> list(Page page);
	
	int total();
	
	List<Cinema> listByFilmAndDate(int fid, String date);
}
