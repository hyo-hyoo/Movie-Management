package top.duangboss.dogemovie.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import top.duangboss.dogemovie.mapper.FilmDetailPictureMapper;
import top.duangboss.dogemovie.pojo.FilmDetailPicture;
import top.duangboss.dogemovie.service.FilmDetailPictureService;

@Service
public class FilmDetailPictureServiceImpl implements FilmDetailPictureService {
	@Autowired
	FilmDetailPictureMapper filmdetailpicturesMapper;
	
	public List<FilmDetailPicture> listByFdpfid(int fdpfid) {
		return filmdetailpicturesMapper.listByFdpfid(fdpfid);
	}

	public void add(FilmDetailPicture filmDetailPicture) {
		filmdetailpicturesMapper.add(filmDetailPicture);
	}
	
	public int getMax() {
		return filmdetailpicturesMapper.getMax();
	}
	
	public void delete(int fdppid) {
		filmdetailpicturesMapper.delete(fdppid);
	}

}
