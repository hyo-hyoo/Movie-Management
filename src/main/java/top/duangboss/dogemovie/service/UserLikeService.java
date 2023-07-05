package top.duangboss.dogemovie.service;

import org.springframework.stereotype.Service;

import top.duangboss.dogemovie.pojo.UserLike;

@Service
public interface UserLikeService {
	
	public void add(int uid, int fid);  
    
	public void delete(int uid, int fid);  
	      
	public UserLike listByUidAndFid(int uid, int fid);

}
