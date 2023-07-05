package top.duangboss.dogemovie.mapper;

import java.util.List;

import top.duangboss.dogemovie.pojo.Film;

import java.util.HashMap;
import java.util.Map;

public interface FilmMapper {
    public void add(Film film);
	
	public void delete(int fid);
	
	public Film get(int fid);
	
	public void update(Film film);
	
	public List<Film> list();
	
	public int count();
	
	public List<Film> listByState(String state);
	
    public List<Film> listBySname(String fname_en);
	
	public List<Film> rankByFboxoffice();
	
	public List<Film> rankByFlikes();
	
	public List<Film> rankByFscore();
	
	public List<Film> rankByFscore_on();
	
	public List<Film> listSTRO(Map map);
	
}
