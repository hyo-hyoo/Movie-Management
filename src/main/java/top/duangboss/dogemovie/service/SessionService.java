package top.duangboss.dogemovie.service;

import java.util.List;

import org.springframework.stereotype.Service;

import top.duangboss.dogemovie.util.Page;
import top.duangboss.dogemovie.pojo.Session;

@Service
public interface SessionService {
	void add(Session session);
	
	void delete(Session session);
	
	
	Session getById(int sid);
	
	void update(Session session);
	
	List<Session> list(Page page);
	
	List<Session> listByHall(int hid, Page page);
	
	List<Session> listByFilm(String fname_cn, Page page);
	
    List<Session> listByFilmCinema(int cid, int fid);
	
	List<Session> listByCinema(int cid);
	
	int total();
	
	int totalByHall(int shid);
	
	int totalByFilm(String fname_cn);
	
	public Session getAllById(int sid);
}
