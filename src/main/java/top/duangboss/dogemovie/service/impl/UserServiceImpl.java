package top.duangboss.dogemovie.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import top.duangboss.dogemovie.mapper.UserMapper;
import top.duangboss.dogemovie.pojo.User;
import top.duangboss.dogemovie.service.UserService;

@Service
public class UserServiceImpl implements UserService{
	@Autowired
	UserMapper userMapper;
	
	public List<User> list(){
		return userMapper.list();
	}
	
	public List<User> listByUname(String uname){
		return userMapper.listByUname(uname);
	}
	
	public void update(User user){
		userMapper.update(user);
	}
	
	public void delete(int uid){
		userMapper.delete(uid);
	}
	
	public void add(User user) {
		userMapper.add(user);
	}
	
	public User getuid(int uid) {
		return userMapper.getuid(uid);
	}
	
	public User getuname(String uname) {
		return userMapper.getuname(uname);
	}
}
