package top.duangboss.dogemovie.mapper;

import java.util.List;

import top.duangboss.dogemovie.pojo.User;
 
public interface UserMapper {
	
    public void add(User user);  
      
    public void delete(int uid);  
      
    public User getuid(int uid);
    
    public User getuname(String uname);
      
    public void update(User user);    
      
    public List<User> list();
    
    public List<User> listByUname(String uname);

    public int count();  
    
}