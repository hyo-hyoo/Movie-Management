package top.duangboss.dogemovie.service;

import java.util.List;

import org.springframework.stereotype.Service;

import top.duangboss.dogemovie.pojo.User;

@Service
public interface UserService {
	List<User> list();
	
	List<User> listByUname(String uname);
	
	void update(User user);
	
	void delete(int uid);
	
	void add(User user);
	
	User getuid(int uid);
	
	User getuname(String uname);
}
