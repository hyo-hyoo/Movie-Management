package top.duangboss.dogemovie.service;

import java.util.List;

import org.springframework.stereotype.Service;

import top.duangboss.dogemovie.pojo.FilmDetailPicture;

@Service
public interface FilmDetailPictureService {
	public List<FilmDetailPicture> listByFdpfid(int fdpfid);

	public void add(FilmDetailPicture filmDetailPicture);
	
	public int getMax();
	
	public void delete(int fdppid);
}
