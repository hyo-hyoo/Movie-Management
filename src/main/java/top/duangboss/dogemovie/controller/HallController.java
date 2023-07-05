package top.duangboss.dogemovie.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import top.duangboss.dogemovie.pojo.Cinema;
import top.duangboss.dogemovie.pojo.Hall;
import top.duangboss.dogemovie.util.Page;
import top.duangboss.dogemovie.service.HallService;

@Controller
@RequestMapping("")
public class HallController {
	@Autowired
	HallService hallService;
	
	@RequestMapping("admin_listHallByCinema")
	public ModelAndView listHallByCinema(Cinema cinema, Page page) {
		ModelAndView mav = new ModelAndView();
		List<Hall> hs = hallService.listByCinema(cinema.getCid(), page);
		int total = hallService.total(cinema.getCid());
		page.setTotal(total);
		page.setParam("&cid="+cinema.getCid());

		mav.addObject("hs", hs);
		mav.addObject("page", page);
		mav.addObject("cid", cinema.getCid());
		mav.setViewName("admin/listHallByCinema");
		return mav;
	}
	
	@RequestMapping("admin_addHall")
    public ModelAndView addHall(Hall hall) {
		hallService.add(hall);
    	ModelAndView mav = new ModelAndView("redirect:/admin_listHallByCinema?cid="+hall.getHcid());
    	return mav;
    }
    
    @RequestMapping("admin_deleteHall")
    public ModelAndView deleteHall(Hall hall) {
    	hallService.delete(hall);
    	ModelAndView mav = new ModelAndView("redirect:/admin_listHallByCinema?cid="+hall.getHcid());
    	return mav;
    }
    
	@RequestMapping("admin_editHall")
	public ModelAndView editHall(Hall hall){
		Hall h= hallService.getById(hall.getHid());
		ModelAndView mav = new ModelAndView("admin/editHall");
		mav.addObject("h", h);
		return mav;
	}	
    
    @RequestMapping("admin_updateHall")
    public ModelAndView updateHall(Hall hall) {
    	hallService.update(hall);
    	ModelAndView mav = new ModelAndView("redirect:/admin_listHallByCinema?cid="+hall.getHcid());
    	return mav;
    }
}
