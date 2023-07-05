package top.duangboss.dogemovie.service;

import java.util.List;

import org.springframework.stereotype.Service;

import top.duangboss.dogemovie.pojo.FilmMade;

@Service
public interface FilmMadeService {
    public void add(FilmMade filmMade);
	
	public void delete(FilmMade filmMade);
	
	public List<FilmMade> list(int fmfid);
	
	public int count(int fmfid);

}
