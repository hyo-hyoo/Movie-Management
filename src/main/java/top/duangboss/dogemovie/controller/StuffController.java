package top.duangboss.dogemovie.controller;

import java.util.List;

import top.duangboss.dogemovie.pojo.Stuff;
import top.duangboss.dogemovie.service.StuffService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import top.duangboss.dogemovie.util.AddImage;
import top.duangboss.dogemovie.util.Page;
import top.duangboss.dogemovie.util.UploadImageFile;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("")
public class StuffController {
	@Autowired
	StuffService stuffService;
	
	@RequestMapping("admin_listStuff")
	public ModelAndView admin_listStuff(Page page) {
		ModelAndView mav = new ModelAndView();
		List<Stuff> sts = stuffService.list(page);
		int total = stuffService.count();
		page.setTotal(total);
		mav.addObject("sts", sts);
		mav.setViewName("admin/listStuff");
		return mav;
	}
	
	@RequestMapping("admin_deleteStuff")
	public ModelAndView deleteStudent(int stid) {
		ModelAndView mav = new ModelAndView();
		stuffService.delete(stid);
		mav.setViewName("redirect:/admin_listStuff");
		return mav;
	}
	
	@RequestMapping("admin_updateStuffImage")
	public ModelAndView updateStuffImage(Stuff stuff, HttpSession session, UploadImageFile uploadedImageFile) {
		String imageFolder = session.getServletContext().getRealPath("");
		
		AddImage addImage = new AddImage();
		
		addImage.uploadStuffImage(imageFolder, stuff.getStid(), uploadedImageFile);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/admin_listStuff");
		return mav;
	}

	@RequestMapping("admin_addStuff")
	public ModelAndView admin_addStuff(Stuff stuff, HttpSession session, Page page) {
		ModelAndView mav = new ModelAndView();
		
		stuffService.add(stuff);
		
		mav.setViewName("redirect:/admin_listStuff");
		return mav;
	}
	
	@RequestMapping("admin_updateStuff")
	public ModelAndView updateStudent(Stuff stuff) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/admin_listStuff");
		return mav;
	}
}

