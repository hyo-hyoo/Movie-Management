package top.duangboss.dogemovie.mapper;

import org.apache.ibatis.annotations.Param;

import top.duangboss.dogemovie.pojo.UserLike;

public interface UserLikeMapper {
	
	 public void add(@Param("uid")int uid, @Param("fid")int fid);  
     
	 public void delete(@Param("uid")int uid, @Param("fid")int fid);  
	      
	 public UserLike listByUidAndFid(@Param("uid")int uid, @Param("fid")int fid);

}
