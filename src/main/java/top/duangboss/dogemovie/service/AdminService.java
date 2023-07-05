package top.duangboss.dogemovie.service;

import org.springframework.stereotype.Service;

import top.duangboss.dogemovie.pojo.Admin;

@Service
public interface AdminService {
	Admin get(String aname);
}
