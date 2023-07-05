package top.duangboss.dogemovie.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import top.duangboss.dogemovie.mapper.FilmTypeMapper;
import top.duangboss.dogemovie.pojo.FilmType;
import top.duangboss.dogemovie.service.FilmTypeService;

@Service
public class FilmTypeServiceImpl implements FilmTypeService{
	@Autowired
	FilmTypeMapper filmTypeMapper;
	
	@Override
    public void add(FilmType filmType) {
		filmTypeMapper.add(filmType);
	}
	
	@Override
	public void delete(FilmType filmType) {
		filmTypeMapper.delete(filmType);
	}
	
	@Override
	public List<FilmType> list(int ftfid){
		return filmTypeMapper.list(ftfid);
	}
	
	@Override
	public int count(int fifid) {
		return filmTypeMapper.count(fifid);
	}


}
