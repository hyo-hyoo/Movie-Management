package top.duangboss.dogemovie.service;

import java.util.List;

import org.springframework.stereotype.Service;

import top.duangboss.dogemovie.pojo.UserComment;
import top.duangboss.dogemovie.util.Page;

@Service
public interface UserCommentService {
	List<UserComment> list(Page page);
	
	void update(UserComment usercomment);
	
	void delete(int ucid);
	
	void add(UserComment usercomment);
	
	UserComment getucid(int ucid);
	
	List<UserComment> getucuid(int ucuid);
	
	List<UserComment> getucfid(int ucfid);
	
	UserComment getByBoth(int ucuid, int ucfid);
}
