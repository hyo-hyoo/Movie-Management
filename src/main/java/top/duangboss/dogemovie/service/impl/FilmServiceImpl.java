package top.duangboss.dogemovie.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import top.duangboss.dogemovie.mapper.FilmMapper;
import top.duangboss.dogemovie.pojo.Film;
import top.duangboss.dogemovie.service.FilmService;

import java.util.HashMap;
import java.util.Map;

@Service
public class FilmServiceImpl implements FilmService{
	@Autowired
	FilmMapper filmMapper;
	
	@Override
	public void add(Film film) {
		filmMapper.add(film);
	}
	
	@Override
	public void delete(int fid) {
		filmMapper.delete(fid);
	}
	
	@Override
	public Film get(int fid) {
		return filmMapper.get(fid);
	}
	
	@Override
	public void update(Film film) {
		filmMapper.update(film);
	}
	
	@Override
	public List<Film> list(){
		return filmMapper.list();
	}
	
	@Override
	public int count() {
		return filmMapper.count();
	}
	
	@Override
	public List<Film> listByState(String state) {
		return filmMapper.listByState(state);
	}
	
	@Override
	public List<Film> listBySname(String fname_cn){
		return filmMapper.listBySname(fname_cn);
	}
	
	@Override
	public List<Film> rankByFboxoffice(){
		return filmMapper.rankByFboxoffice();
	}
	
	@Override
	public List<Film> rankByFlikes(){
		return filmMapper.rankByFlikes();
	}
	
	@Override
	public List<Film> rankByFscore(){
		return filmMapper.rankByFscore();
	}
	
	@Override
	public List<Film> rankByFscore_on(){
		return filmMapper.rankByFscore_on();
	}
	
	@Override
	public List<Film> listSTRO(Map map) {
		return filmMapper.listSTRO(map); 
	}

}
