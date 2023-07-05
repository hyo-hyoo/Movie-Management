package top.duangboss.dogemovie.mapper;

import java.util.List;

import top.duangboss.dogemovie.pojo.FilmDetailPicture;

public interface FilmDetailPictureMapper {
	
	public List<FilmDetailPicture> listByFdpfid(int fdpfid);
	
	public void add(FilmDetailPicture filmDetailPicture);
	
	public int getMax();
	
	public void delete(int fdppid);
}
