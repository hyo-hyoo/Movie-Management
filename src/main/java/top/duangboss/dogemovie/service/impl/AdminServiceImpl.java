package top.duangboss.dogemovie.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import top.duangboss.dogemovie.mapper.AdminMapper;
import top.duangboss.dogemovie.pojo.Admin;
import top.duangboss.dogemovie.service.AdminService;

@Service
public class AdminServiceImpl implements AdminService{
	@Autowired
	AdminMapper adminMapper;
	
	public Admin get(String aname) {
		return adminMapper.get(aname);
	}
}
