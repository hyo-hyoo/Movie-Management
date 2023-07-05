package top.duangboss.dogemovie.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import top.duangboss.dogemovie.mapper.UserCommentMapper;
import top.duangboss.dogemovie.pojo.UserComment;
import top.duangboss.dogemovie.service.UserCommentService;
import top.duangboss.dogemovie.util.Page;

@Service
public class UserCommentServiceImpl implements UserCommentService{
	@Autowired
	UserCommentMapper usercommentMapper;
	
	public List<UserComment> list(Page page){
		return usercommentMapper.list(page);
	}
	
	public void update(UserComment usercomment){
		usercommentMapper.update(usercomment);
	}
	
	public void delete(int ucid){
		usercommentMapper.delete(ucid);
	}
	
	public void add(UserComment usercomment) {
		usercommentMapper.add(usercomment);
	}
	
	public UserComment getucid(int ucid) {
		return usercommentMapper.getucid(ucid);
	}
	
	public List<UserComment> getucuid(int ucuid) {
		return usercommentMapper.getucuid(ucuid);
	}
	
	public List<UserComment> getucfid(int ucfid) {
		return usercommentMapper.getucfid(ucfid);
	}
	
	public UserComment getByBoth(int ucuid, int ucfid) {
		return usercommentMapper.getByBoth(ucuid, ucfid);
	}
}
