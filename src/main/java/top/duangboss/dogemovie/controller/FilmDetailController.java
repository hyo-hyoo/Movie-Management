package top.duangboss.dogemovie.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import top.duangboss.dogemovie.pojo.Film;
import top.duangboss.dogemovie.pojo.FilmDetailPicture;
import top.duangboss.dogemovie.pojo.FilmMade;
import top.duangboss.dogemovie.pojo.FilmType;
import top.duangboss.dogemovie.pojo.Session;
import top.duangboss.dogemovie.pojo.User;
import top.duangboss.dogemovie.pojo.UserComment;
import top.duangboss.dogemovie.pojo.UserLike;
import top.duangboss.dogemovie.service.FilmDetailPictureService;
import top.duangboss.dogemovie.service.FilmMadeService;
import top.duangboss.dogemovie.service.FilmService;
import top.duangboss.dogemovie.service.FilmTypeService;
import top.duangboss.dogemovie.service.UserCommentService;
import top.duangboss.dogemovie.service.UserLikeService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("")
public class FilmDetailController {

	@Autowired
	FilmService filmService;
	
	@Autowired
	FilmTypeService filmTypeService;
	
	@Autowired
	FilmMadeService filmMadeService;
	
	@Autowired
	FilmDetailPictureService filmDetailPictureService;
	
	@Autowired
	UserCommentService usercommentService;
	
	@Autowired
	UserLikeService userLikeService;

	
	@RequestMapping("/filmDetail")
	public ModelAndView filmDetail(int fid, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		int uid = user.getUid();

		ModelAndView mav = new ModelAndView();
		
		Film film = filmService.get(fid);
		List<UserComment> comments = usercommentService.getucfid(fid);
		List<FilmMade> stuff = filmMadeService.list(fid);
		List<FilmDetailPicture> stills = filmDetailPictureService.listByFdpfid(fid);
		boolean islike = isLike(uid, fid);
		List<FilmType> types = filmTypeService.list(fid);
		UserComment usercomment = usercommentService.getByBoth(uid, fid);
		
		mav.addObject("f", film);
		mav.addObject("comments", comments);
		mav.addObject("stuff", stuff);
		mav.addObject("stills", stills);
		mav.addObject("islike", islike);
		mav.addObject("types", types);
		mav.addObject("usercomment", usercomment);
		
		mav.setViewName("fore/filmDetail");
		return mav;
	}	
	
	@RequestMapping("likeFilm")
	@ResponseBody
	public String likeFilm(int uid, int fid) {
	
		boolean islike = isLike(uid, fid);
		
		if(islike) {
			userLikeService.delete(uid, fid);
			return "deletelike";			
		}
		else {
			userLikeService.add(uid, fid);
			return "addlike";
		}
	}
	
	@RequestMapping("isLike")
	@ResponseBody
	public boolean isLike (int uid, int fid) {
		
		UserLike ul = userLikeService.listByUidAndFid(uid, fid);
		
		return ul!=null?true:false;
	}
	
	@RequestMapping("addComment")
	@ResponseBody
	public String addComment(UserComment comment) {
        
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd-HH:mm");
		Date time = new Date();
	    comment.setUctime(df.format(time));
		
		usercommentService.add(comment);
		
		return "success";
		
	}
	
	@RequestMapping("isComment")
	@ResponseBody
	public String isComment(int uid, int fid) {
		UserComment comment = usercommentService.getByBoth(uid, fid);
		if( null == comment )    return "false";
		else    return "true";
	}
}
