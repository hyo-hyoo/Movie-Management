package top.duangboss.dogemovie.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import top.duangboss.dogemovie.pojo.UserComment;
import top.duangboss.dogemovie.util.Page;
 
public interface UserCommentMapper {
	
    public void add(UserComment usercomment);  
      
    public void delete(int ucid);  
      
    public UserComment getucid(int ucid);
    
    public List<UserComment> getucuid(int ucuid);
    
    public List<UserComment> getucfid(int ucfid);
    
    public UserComment getByBoth(@Param("ucuid")int ucuid, @Param("ucfid")int ucfid);
      
    public void update(UserComment usercomment);    
      
    public List<UserComment> list(Page page);

    public int count();  
}