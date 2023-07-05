package top.duangboss.dogemovie.mapper;

import java.util.List;

import top.duangboss.dogemovie.pojo.Cinema;
import top.duangboss.dogemovie.util.Page;
import org.apache.ibatis.annotations.Param;

public interface CinemaMapper {
	public void add(Cinema cinema);
	
	public void delete(Cinema cinema);
	
	public Cinema getByName(String cname);
	
	public Cinema getById(int cid);
	
	public void update(Cinema cinema);
	
	public List<Cinema> list();
	
	public List<Cinema> list1();
	
	public List<Cinema> list(Page page);
	
	public int total();
	
	public List<Cinema> listByFilm(int fid);
	
	public List<Cinema> listByFilmAndDate(@Param("sfid")int sfid, @Param("stime")String stime);
}
