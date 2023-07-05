package top.duangboss.dogemovie.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import top.duangboss.dogemovie.pojo.Admin;
import top.duangboss.dogemovie.pojo.User;
import top.duangboss.dogemovie.service.UserService;
import top.duangboss.dogemovie.util.Page;

@Controller
@RequestMapping("")
public class UserController {
	@Autowired
	UserService userService;

	@RequestMapping("toLogin")
	public ModelAndView toLogin(){
		ModelAndView mav = new ModelAndView();

		mav.setViewName("fore/login");
		return mav;
	}

	@RequestMapping("login")
	public ModelAndView login(User user, HttpSession session){
		ModelAndView mav = new ModelAndView();

		User u =  userService.getuname(user.getUname());

		if(u != null && u.getUpassword().equals(user.getUpassword())) {
			String url = (String) session.getAttribute("furl");

			mav.setViewName("redirect:" + url);
			session.setAttribute("user", u);
		}
		else {
			mav.setViewName("redirect:/toLogin");
		}

		return mav;
	}

	@RequestMapping("toRegister")
	public ModelAndView toRegister(){
		ModelAndView mav = new ModelAndView();

		mav.setViewName("fore/register");
		return mav;
	}

	@RequestMapping("register")
	public ModelAndView register(User user, HttpSession session){
		ModelAndView mav = new ModelAndView();

		User u =  userService.getuname(user.getUname());

		if(u != null && u.getUpassword().equals(user.getUpassword())) {
			String url = (String) session.getAttribute("furl");

			mav.setViewName("redirect:" + url);
			session.setAttribute("user", u);
		}
		else {
			mav.setViewName("redirect:/toLogin");
		}

		return mav;
	}

	@RequestMapping("logout")
	public ModelAndView logout(HttpSession session){
		ModelAndView mav = new ModelAndView();

		session.removeAttribute("user");

		mav.setViewName("fore/login");

		return mav;
	}

	@RequestMapping("admin_listUser")
	public ModelAndView listUser(Page page){
		ModelAndView mav = new ModelAndView();
		
		PageHelper.offsetPage(page.getStart(), page.getCount());
		
        List<User> us= userService.list();
        int total = (int) new PageInfo<>(us).getTotal();
        
        page.setTotal(total);
		
		mav.addObject("us", us);
		mav.addObject("page", page);

		mav.setViewName("admin/listUser");
		return mav;
	}
	
	@RequestMapping("admin_searchUser")
	public ModelAndView searchUser(Page page,@RequestParam("uname") String uname){
		ModelAndView mav = new ModelAndView();
		
		PageHelper.offsetPage(page.getStart(), page.getCount());
		
        List<User> us= userService.listByUname(uname);
        int total = (int) new PageInfo<>(us).getTotal();
        
        page.setTotal(total);
		
		mav.addObject("us", us);
		mav.addObject("page", page);

		mav.setViewName("admin/listUser");
		return mav;
	}
	
	@RequestMapping("addUser")
	public ModelAndView add(User user, Page page) throws Exception {
		userService.add(user);
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("redirect:/admin_listUser");
		return mav;
	}
	
	@RequestMapping("admin_toupdateUser")
	public ModelAndView toupdateUser(String UID){
		int uid = Integer.parseInt(UID);
		
		ModelAndView mav = new ModelAndView();
		User u= userService.getuid(uid);
		
		mav.addObject("u", u);

		mav.setViewName("admin/updateUser");
		return mav;
	}
	
	@RequestMapping("admin_updateUser")
	public ModelAndView updateUser(User user, Page page) throws Exception {
		userService.update(user);
		
		ModelAndView mav = new ModelAndView();

		mav.setViewName("redirect:/admin_listUser");
		return mav;
	}
	
	@RequestMapping("admin_deleteUser")
	public ModelAndView deleteUser(String UID, Page page){
		int uid = Integer.parseInt(UID);
		
		userService.delete(uid);
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("redirect:/admin_listUser");
		return mav;
	}
	
	@RequestMapping("myprofile")
	public ModelAndView myprofile(HttpServletRequest request){
	   HttpSession session = request.getSession();
	   User user = (User) session.getAttribute("user");

	   ModelAndView mav = new ModelAndView();

	   mav.addObject("user", user);

	   mav.setViewName("fore/myprofile");
	   return mav;
	}
	
}
