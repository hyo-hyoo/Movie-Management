package top.duangboss.dogemovie.mapper;

import java.util.List;

import top.duangboss.dogemovie.pojo.FilmMade;

public interface FilmMadeMapper {
    public void add(FilmMade filmMade);
	
	public void delete(FilmMade filmMade);
	
	public List<FilmMade> list(int fmfid);
	
	public int count(int fmfid);

}
