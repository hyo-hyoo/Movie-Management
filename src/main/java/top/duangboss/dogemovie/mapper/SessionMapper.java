package top.duangboss.dogemovie.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import top.duangboss.dogemovie.util.Page;
import top.duangboss.dogemovie.pojo.Session;

public interface SessionMapper {
	public void add(Session session);
	
	public void delete(Session session);
	
	
	public Session getById(int sid);
	
	public void update(Session session);
	
	public List<Session> list(Page page);
	
	public List<Session> listByHall(@Param("hid") int hid,@Param("page") Page page);
	
	public List<Session> listByFilm(@Param("fname_cn") String fname_cn,@Param("page") Page page);
	
    public List<Session> listByFilmCinema(@Param("cid") int cid, @Param("fid") int fid);
	
	public List<Session> listByCinema(int cid);
	
	public int total();
	
	public int totalByHall(int shid);
	
	public int totalByFilm(String fname_cn);
	
	public Session getAllById(int sid);
}
