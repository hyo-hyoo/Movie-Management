package top.duangboss.dogemovie.service;

import java.util.List;

import org.springframework.stereotype.Service;

import top.duangboss.dogemovie.pojo.FilmType;

@Service
public interface FilmTypeService {
    public void add(FilmType filmType);
	
	public void delete(FilmType filmType);
	
	public List<FilmType> list(int ftfid);
	
	public int count(int fifid);

}
