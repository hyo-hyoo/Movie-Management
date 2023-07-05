package top.duangboss.dogemovie.mapper;

import java.util.List;

import top.duangboss.dogemovie.pojo.FilmType;

public interface FilmTypeMapper {
    public void add(FilmType filmType);
	
	public void delete(FilmType filmType);
	
	public List<FilmType> list(int ftfid);
	
	public int count(int fifid);

}
