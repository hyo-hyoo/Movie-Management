package top.duangboss.dogemovie.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import top.duangboss.dogemovie.mapper.UserLikeMapper;

import top.duangboss.dogemovie.pojo.UserLike;
import top.duangboss.dogemovie.service.UserLikeService;

@Service
public class UserLikeServiceImpl implements UserLikeService {
	@Autowired
	UserLikeMapper userLikeMapper;
	
	@Override
	public void add(int uid, int fid) {
		userLikeMapper.add(uid, fid);
	}
    
	@Override
	public void delete(int uid, int fid) {
		userLikeMapper.delete(uid, fid);
	}
	
	@Override
	public UserLike listByUidAndFid(int uid, int fid) {
		return userLikeMapper.listByUidAndFid(uid, fid);
	}

}
