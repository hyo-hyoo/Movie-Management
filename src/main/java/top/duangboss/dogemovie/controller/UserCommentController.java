package top.duangboss.dogemovie.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import top.duangboss.dogemovie.pojo.UserComment;
import top.duangboss.dogemovie.service.UserCommentService;
import top.duangboss.dogemovie.util.Page;

@Controller
@RequestMapping("")
public class UserCommentController {
	@Autowired
	UserCommentService usercommentService;

	@RequestMapping("admin_listUserComment")
	public ModelAndView listUserComment(Page page){
		ModelAndView mav = new ModelAndView();
		
		PageHelper.offsetPage(page.getStart(),5);
        List<UserComment> ucs= usercommentService.list(page);
        int total = (int) new PageInfo<>(ucs).getTotal();
         
        page.setTotal(total);
		
		mav.addObject("ucs", ucs);
		mav.addObject("page", page);

		mav.setViewName("admin/listUserComment");
		return mav;
	}
	
//	@RequestMapping("addUser")
//	public ModelAndView add(UserComment usercomment, Page page) throws Exception {
//		usercommentService.add(usercomment);
//		
//		return mav;
//	}
	
	@RequestMapping("admin_deleteUserComment")
	public ModelAndView deleteUserComment(String UCID, Page page) {
		int ucid = Integer.parseInt(UCID);

		usercommentService.delete(ucid);

		ModelAndView mav = new ModelAndView();
		List<UserComment> ucs = usercommentService.list(page);

		mav.addObject("ucs", ucs);

		mav.setViewName("redirect:/admin_listUserComment");
		return mav;
	}
}
