package top.duangboss.dogemovie.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageInfo;

import top.duangboss.dogemovie.pojo.Cinema;
import top.duangboss.dogemovie.pojo.Film;
import top.duangboss.dogemovie.pojo.Hall;
import top.duangboss.dogemovie.util.Page;
import top.duangboss.dogemovie.pojo.Session;
import top.duangboss.dogemovie.service.SessionService;
import top.duangboss.dogemovie.service.FilmService;
import top.duangboss.dogemovie.service.CinemaService;

@Controller
@RequestMapping("")
public class SessionController {
	@Autowired
	SessionService sessionService; 
	
	@Autowired
	CinemaService cinemaService;
	
	@Autowired
	FilmService filmService;
	
	@RequestMapping("admin_listSession")
	public ModelAndView listSession(Page page) {
		ModelAndView mav = new ModelAndView();
		List<Session> ss = sessionService.list(page);
		int total = sessionService.total();
		page.setTotal(total);
		
		mav.addObject("ss", ss);
		mav.addObject("page", page);
		mav.setViewName("admin/listSession");
		return mav;
	}
	
	@RequestMapping("admin_listSessionByHall")
	public ModelAndView listSessionByHall(Hall hall, Page page) {
		ModelAndView mav = new ModelAndView();
		List<Session> ss = sessionService.listByHall(hall.getHid(), page);
		int total = sessionService.totalByHall(hall.getHid());
		page.setTotal(total);
		page.setParam("&hid="+hall.getHid());
		
		mav.addObject("ss", ss);
		mav.addObject("page", page);
		mav.addObject("hid", hall.getHid());
		
		mav.setViewName("admin/listSessionByHall");
		return mav;
	}
	
	@RequestMapping("admin_findResult")
	public ModelAndView findResult(Session session, Page page) {

		ModelAndView mav = new ModelAndView();
		List<Session> ss = sessionService.listByFilm(session.getSfname(), page);
		int total = sessionService.totalByFilm(session.getSfname());
		page.setTotal(total);
		
		mav.addObject("ss", ss);
		mav.addObject("page", page);
		mav.setViewName("admin/listSession");
		return mav;
	}
	
	@RequestMapping("admin_addSession")
    public ModelAndView addSession(Session session) {
		String state = "";
		
		for(int i = 0;i < 40;i ++)
		{
			state += "0";
		}
		
		session.setSseatstate(state);
		
		sessionService.add(session);
    	ModelAndView mav = new ModelAndView("redirect:/admin_listSessionByHall?hid="+session.getShid());
    	return mav;
    }
    
    @RequestMapping("admin_deleteSession")
    public ModelAndView deleteSession(Session session) {
    	sessionService.delete(session);
    	ModelAndView mav = new ModelAndView("redirect:/admin_listSessionByHall?hid="+session.getShid());
    	return mav;
    }
    
    @RequestMapping("admin_deleteSessionAlone")
    public ModelAndView deleteSessionAlone(Session session) {
    	sessionService.delete(session);
    	ModelAndView mav = new ModelAndView("redirect:/admin_listSession");
    	return mav;
    }
    
	@RequestMapping("admin_editSession")
	public ModelAndView editSession(Session session){
		Session s= sessionService.getById(session.getSid());
		ModelAndView mav = new ModelAndView("admin_editSession");
		mav.addObject("s", s);
		return mav;
	}	
    
    @RequestMapping("admin_updateSession")
    public ModelAndView updateSession(Session session) {
    	sessionService.update(session);
    	ModelAndView mav = new ModelAndView("redirect:/admin_listSessionByHall?hid="+session.getShid());
    	return mav;
    }
    
    @RequestMapping("admin_showSessionState")
    public ModelAndView showSessionState(String sseatstate) {
    	char[] a = sseatstate.toCharArray();
    	
    	int[] as = new int[sseatstate.length()];
    	
    	for(int i = 0;i < sseatstate.length();i ++) {
    		as[i] = a[i] - '0';
    	}
    	
    	ModelAndView mav = new ModelAndView();
    	
    	mav.addObject("as", as);
    	mav.setViewName("admin/showSessionState");
    	return mav;
    }
    
    @RequestMapping("listSessionByCinema")
	public ModelAndView listSessionByCinema(Cinema cinema) {
		ModelAndView mav = new ModelAndView();
		List<Session> ss = sessionService.listByCinema(cinema.getCid());
		
		mav.addObject("ss", ss);
		mav.setViewName("fore/listSessionByCinema");
		return mav;
	}
	
	//listSessionByFilmAndCinema
	@RequestMapping("selectSession")
	public ModelAndView selectSession(int cid, @RequestParam(required = false)Integer fid) {
		
		ModelAndView mav = new ModelAndView();
		
		Cinema cinema = cinemaService.getById(cid);		
		
		List<Film> films = filmService.listByState("在映");
		if(fid==null) fid = films.get(0).getFid();
		Film f = filmService.get(fid);
		
		Date now = new Date();
		
		List<Session> sessions = sessionService.listByFilmCinema(cid, fid);
		int total = (int)new PageInfo<>(sessions).getTotal();
		
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd-HH:mm");
		for(int i = 0; i < total; i++) {
			try {
				Session s = sessions.get(i);
				Date time = df.parse(s.getStime());
				if(time.after(now))    s.setState(1);
				time.setMinutes(time.getMinutes()+f.getFlength());
				s.setEnd(df.format(time));
			}
			catch(ParseException e) {
				System.out.println("Unparseable using " + df); 
			}
		}
		
		mav.addObject("cinema", cinema);
		mav.addObject("films", films);
		mav.addObject("f", f);
		mav.addObject("sessions", sessions);
		mav.addObject("total", total);
		
		mav.setViewName("fore/selectSession");
		return mav;
	}
	
	@RequestMapping("getSessions")
	@ResponseBody
	public List<Session> getSessions(int cid, int fid) {
		List<Session> sessions = sessionService.listByFilmCinema(cid, fid);
		return sessions;
	}
	
	
	@RequestMapping("chooseSeats")
	public ModelAndView chooseSeats(String sid){
		ModelAndView mav = new ModelAndView();

		Session s = sessionService.getAllById(Integer.parseInt(sid));

		char[] a = s.getSseatstate().toCharArray();

		int[] as = new int[a.length];

		for(int i = 0;i < a.length;i ++) {
			as[i] = a[i] - '0';
		}

		mav.addObject("s", s);
		mav.addObject("as", as);

		mav.setViewName("fore/chooseSeats");
		return mav;
	}

}