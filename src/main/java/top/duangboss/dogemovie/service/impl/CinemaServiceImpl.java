package top.duangboss.dogemovie.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import top.duangboss.dogemovie.mapper.CinemaMapper;
import top.duangboss.dogemovie.pojo.Cinema;
import top.duangboss.dogemovie.util.Page;
import top.duangboss.dogemovie.service.CinemaService;

@Service
public class CinemaServiceImpl implements CinemaService {
	@Autowired
	CinemaMapper cinemaMapper;
	
	@Override
	public void add(Cinema cinema) {
		// TODO Auto-generated method stub
		cinemaMapper.add(cinema);
	}

	@Override
	public void delete(Cinema cinema) {
		// TODO Auto-generated method stub
		cinemaMapper.delete(cinema);
	}

	@Override
	public void update(Cinema cinema) {
		// TODO Auto-generated method stub
		cinemaMapper.update(cinema);
	}

	@Override
	public List<Cinema> list1() {
		// TODO Auto-generated method stub
		return cinemaMapper.list();
	}

	@Override
	public Cinema getByName(String cname) {
		// TODO Auto-generated method stub
		return cinemaMapper.getByName(cname);
	}

	@Override
	public Cinema getById(int cid) {
		// TODO Auto-generated method stub
		return cinemaMapper.getById(cid);
	}

	@Override
	public List<Cinema> list(Page page) {
		// TODO Auto-generated method stub
		return cinemaMapper.list(page);
	}

	@Override
	public int total() {
		// TODO Auto-generated method stub
		return cinemaMapper.total();
	}
	
	@Override
	public List<Cinema> listByFilm(int fid) {
		// TODO Auto-generated method stub
		return cinemaMapper.listByFilm(fid);
	}
	
	@Override
	public List<Cinema> listByFilmAndDate(int fid, String date) {
		return cinemaMapper.listByFilmAndDate(fid, date);
	}

}
