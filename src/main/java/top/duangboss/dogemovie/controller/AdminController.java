package top.duangboss.dogemovie.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import top.duangboss.dogemovie.pojo.Admin;
import top.duangboss.dogemovie.service.AdminService;

@Controller
@RequestMapping("")
public class AdminController {
	@Autowired
	AdminService adminService;

	@RequestMapping("admin_toLogin")
	public ModelAndView toLoginAdmin(){
		ModelAndView mav = new ModelAndView();

		mav.setViewName("admin/login");
		return mav;
	}

	@RequestMapping("admin_login")
	public ModelAndView loginAdmin(Admin admin, HttpSession session){
		ModelAndView mav = new ModelAndView();

		Admin a =  adminService.get(admin.getAname());

		if(a != null && a.getApassword().equals(admin.getApassword())) {
			String url = (String) session.getAttribute("afurl");

			if(url == null) {
				url = "admin_listUser";
			}

			mav.setViewName("redirect:" + url);
			session.setAttribute("admin", admin);
		}
		else {
			mav.setViewName("redirect:/admin_toLogin");
		}

		return mav;
	}


	@RequestMapping("admin_logoff")
	public ModelAndView admin_logoff(HttpSession session){
		ModelAndView mav = new ModelAndView();

		session.removeAttribute("admin");

		mav.setViewName("admin/login");

		return mav;
	}
}
