package top.duangboss.dogemovie.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import top.duangboss.dogemovie.mapper.SessionMapper;
import top.duangboss.dogemovie.util.Page;
import top.duangboss.dogemovie.pojo.Session;
import top.duangboss.dogemovie.service.SessionService;

@Service
public class SessionServiceImpl implements SessionService{
	@Autowired
	SessionMapper sessionMapper;
	
	@Override
	public void add(Session session) {
		// TODO Auto-generated method stub
		sessionMapper.add(session);
	}

	@Override
	public void delete(Session session) {
		// TODO Auto-generated method stub
		sessionMapper.delete(session);
	}

	@Override
	public Session getById(int sid) {
		// TODO Auto-generated method stub
		return sessionMapper.getById(sid);
	}

	@Override
	public void update(Session session) {
		// TODO Auto-generated method stub
		sessionMapper.update(session);
	}

	@Override
	public List<Session> list(Page page) {
		// TODO Auto-generated method stub
		return sessionMapper.list(page);
	}

	@Override
	public List<Session> listByHall(int hid, Page page) {
		// TODO Auto-generated method stub
		return sessionMapper.listByHall(hid, page);
	}

	@Override
	public int total() {
		// TODO Auto-generated method stub
		return sessionMapper.total();
	}

	@Override
	public List<Session> listByFilm(String fname_cn, Page page) {
		// TODO Auto-generated method stub
		return sessionMapper.listByFilm(fname_cn, page);
	}

	@Override
	public int totalByFilm(String fname_cn) {
		// TODO Auto-generated method stub
		return sessionMapper.totalByFilm(fname_cn);
	}

	@Override
	public int totalByHall(int shid) {
		// TODO Auto-generated method stub
		return sessionMapper.totalByHall(shid);
	}
	
	@Override
	public List<Session> listByFilmCinema(int cid, int fid) {
		// TODO Auto-generated method stub
		return sessionMapper.listByFilmCinema(cid, fid);
	}

	@Override
	public List<Session> listByCinema(int cid) {
		// TODO Auto-generated method stub
		return sessionMapper.listByCinema(cid);
	}
	
	@Override
	public Session getAllById(int sid) {
		return sessionMapper.getAllById(sid);
	}
	
}
