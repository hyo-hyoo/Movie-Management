package top.duangboss.dogemovie.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import top.duangboss.dogemovie.mapper.FilmMadeMapper;
import top.duangboss.dogemovie.pojo.FilmMade;
import top.duangboss.dogemovie.service.FilmMadeService;

@Service
public class FilmMadeServiceImpl implements FilmMadeService{
	@Autowired
	FilmMadeMapper filmMadeMapper;
	
	public void add(FilmMade filmMade) {
		filmMadeMapper.add(filmMade);
	}
	
	public void delete(FilmMade filmMade) {
		filmMadeMapper.delete(filmMade);
	}
	
	public List<FilmMade> list(int fmfid) {
		return filmMadeMapper.list(fmfid);
	}
	
	public int count(int fmfid) {
		return filmMadeMapper.count(fmfid);
	}


}
