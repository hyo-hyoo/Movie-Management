package top.duangboss.dogemovie.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageInfo;

import top.duangboss.dogemovie.pojo.Cinema;
import top.duangboss.dogemovie.pojo.Film;
import top.duangboss.dogemovie.pojo.FilmDetailPicture;
import top.duangboss.dogemovie.pojo.FilmMade;
import top.duangboss.dogemovie.pojo.FilmType;
import top.duangboss.dogemovie.pojo.User;
import top.duangboss.dogemovie.pojo.UserComment;
import top.duangboss.dogemovie.util.Page;
import top.duangboss.dogemovie.service.CinemaService;
import top.duangboss.dogemovie.service.FilmDetailPictureService;
import top.duangboss.dogemovie.service.FilmMadeService;
import top.duangboss.dogemovie.service.FilmService;
import top.duangboss.dogemovie.service.FilmTypeService;
import top.duangboss.dogemovie.service.UserCommentService;
import top.duangboss.dogemovie.service.UserLikeService;

@Controller
@RequestMapping("")
public class CinemaController {
	@Autowired
	CinemaService cinemaService;
	
	@Autowired
	FilmService filmService;
	
	@Autowired
	FilmTypeService filmTypeService;
	
	@Autowired
	UserCommentService usercommentService;
	
	@Autowired
	UserLikeService userLikeService;
	
	@RequestMapping("admin_listCinema")
	public ModelAndView listCinema(Page page) {
		ModelAndView mav = new ModelAndView();
		List<Cinema> cs = cinemaService.list(page);
		int total = cinemaService.total();
		page.setTotal(total);
		mav.addObject("cs", cs);
		mav.addObject("page", page);
		mav.setViewName("admin/listCinema");
		return mav;
	}
	
	@RequestMapping("listCinema1")
	public ModelAndView listCinema1() {
		ModelAndView mav = new ModelAndView();
		List<Cinema> cs = cinemaService.list1();
		
		mav.addObject("cs", cs);
		mav.setViewName("fore/listCinema1");
		return mav;
	}
	
	@RequestMapping("admin_addCinema")
	public ModelAndView addCinema(Cinema cinema) {
		cinemaService.add(cinema);
    	ModelAndView mav = new ModelAndView("redirect:/admin_listCinema");
    	return mav;
	}
	
	@RequestMapping("admin_deleteCinema")
	public ModelAndView deleteCinema(Cinema cinema) {
		cinemaService.delete(cinema);
    	ModelAndView mav = new ModelAndView("redirect:/admin_listCinema");
    	return mav;
	}

	
	@RequestMapping("admin_editCinema")
	public ModelAndView editCinema(Cinema cinema) {
		Cinema c = cinemaService.getById(cinema.getCid());
		ModelAndView mav = new ModelAndView("admin/editCinema");
		mav.addObject("c", c);
		return mav;
	}
	
	@RequestMapping("admin_updateCinema")
	public ModelAndView updateCinema(Cinema cinema) {
		cinemaService.update(cinema);
    	ModelAndView mav = new ModelAndView("redirect:/admin_listCinema");
    	return mav;
	}
	
	@RequestMapping("listCinemas")
	public ModelAndView listCinemas() {
		
		ModelAndView mav = new ModelAndView();
		
		List<Cinema> cinemas = cinemaService.list1();
		
		mav.addObject("cinemas", cinemas);
		
		mav.setViewName("fore/listCinemas");
		return mav;
	}
	
	@RequestMapping("listCinemaByFilm")
	public ModelAndView listCinemaByFilm(int fid, String date, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		int uid = user.getUid();
		
		ModelAndView mav = new ModelAndView();
		
		SimpleDateFormat sdf = new SimpleDateFormat("MM月dd日"); 
		SimpleDateFormat ldf = new SimpleDateFormat("yyyy-MM-dd"); 
		Calendar cal = Calendar.getInstance();
		String[] sdate = new String[5];
		String[] ldate = new String[5];
		
		for(int i = 0; i < 5; i++) {
			sdate[i] = sdf.format(cal.getTime());
			ldate[i] = ldf.format(cal.getTime());
			if(i != 4) cal.add(Calendar.DATE, 1);
		}
		
		if(date==null) date=ldate[0];
		
		Film film = filmService.get(fid);
		List<Cinema> cinemas = cinemaService.listByFilmAndDate(fid, date);
		List<FilmType> types = filmTypeService.list(fid);
		UserComment usercomment = usercommentService.getByBoth(uid, fid);
		boolean islike = false;
		if(userLikeService.listByUidAndFid(uid, fid) != null)
			islike = true;
		
		mav.addObject("film", film);
		mav.addObject("date", date);
		mav.addObject("sdate", sdate);
		mav.addObject("ldate", ldate);
		mav.addObject("cinemas", cinemas);
		mav.addObject("types", types);
		mav.addObject("usercomment", usercomment);
		mav.addObject("islike", islike);
	
		mav.setViewName("fore/listCinemaByFilm");
		return mav;
	}
	
}
