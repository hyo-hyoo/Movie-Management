package top.duangboss.dogemovie.service;

import java.util.List;

import org.springframework.stereotype.Service;

import top.duangboss.dogemovie.pojo.Film;

import java.util.HashMap;
import java.util.Map;

@Service
public interface FilmService {
	public void add(Film film);
		
	public void delete(int fid);
		
    public Film get(int fid);
		
	public void update(Film film);
		
	public List<Film> list();
		
	public int count();
	
	public List<Film> listByState(String state);
	
    public List<Film> listBySname(String fname_cn);
	
	public List<Film> rankByFboxoffice();
	
	public List<Film> rankByFlikes();
	
	public List<Film> rankByFscore();
	
	public List<Film> rankByFscore_on();
	
	public List<Film> listSTRO(Map map);
}