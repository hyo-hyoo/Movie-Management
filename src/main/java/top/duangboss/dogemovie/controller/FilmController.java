package top.duangboss.dogemovie.controller;

import static org.junit.Assert.assertNotNull;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import top.duangboss.dogemovie.pojo.Film;
import top.duangboss.dogemovie.pojo.FilmDetailPicture;
import top.duangboss.dogemovie.pojo.FilmMade;
import top.duangboss.dogemovie.pojo.FilmType;
import top.duangboss.dogemovie.util.AddImage;
import top.duangboss.dogemovie.util.Page;
import top.duangboss.dogemovie.util.UploadImageFile;
import top.duangboss.dogemovie.service.FilmDetailPictureService;
import top.duangboss.dogemovie.service.FilmMadeService;
import top.duangboss.dogemovie.service.FilmService;
import top.duangboss.dogemovie.service.FilmTypeService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("")
public class FilmController {
	
	@Autowired
	FilmService filmService;
	
	@Autowired
	FilmTypeService filmTypeService;
	
	@Autowired
	FilmMadeService filmMadeService;
	
	@Autowired
	FilmDetailPictureService filmDetailPictureService;
	
	@RequestMapping("admin_listFilm")
	public ModelAndView listFilm(Page page) {
		ModelAndView mav = new ModelAndView();
		
		page.setCount(12);
		
		PageHelper.offsetPage(page.getStart(), page.getCount());
		
		List<Film> fs = filmService.list();
		
		int total = (int) new PageInfo<>(fs).getTotal();
        
        page.setTotal(total);
		
		mav.addObject("fs", fs);
		mav.addObject("page", page);
		
		mav.setViewName("admin/listFilm");
		return mav;
	}
	
	@RequestMapping("admin_deleteFilm")
	public ModelAndView deleteStudent(String fid) {
		ModelAndView mav = new ModelAndView();
		int Fid = Integer.parseInt(fid);
		filmService.delete(Fid);
		mav.setViewName("redirect:/admin_listFilm");
		return mav;
	}
	

	@RequestMapping("admin_addFilm")
	public ModelAndView addFilm(Film film){
		ModelAndView mav = new ModelAndView();
		filmService.add(film);
		
		mav.setViewName("redirect:/admin_listFilm");
		return mav;
	}
	
	@RequestMapping("admin_toUpdateFilm")
	public ModelAndView editStudent(String fid) {
		ModelAndView mav = new ModelAndView();
		
		int Fid = Integer.parseInt(fid);
		Film f = filmService.get(Fid);
		
		List<FilmDetailPicture> fdps = filmDetailPictureService.listByFdpfid(Fid);
		List<FilmType> fts = filmTypeService.list(Fid);
		List<FilmMade> fms = filmMadeService.list(Fid);
		
		mav.addObject("f", f);
		mav.addObject("fdps", fdps);
		mav.addObject("fts", fts);
		mav.addObject("fms", fms);
		
		mav.setViewName("admin/updateFilm");
		return mav;
	}
	
	@RequestMapping("admin_updateFilm")
	public ModelAndView updateStudent(Film film) {
		ModelAndView mav = new ModelAndView();
		filmService.update(film);
		mav.setViewName("redirect:/admin_listFilm");
		return mav; 
	}
	
	@RequestMapping("admin_updateFilmImageSignal")
	public ModelAndView updateFilmImageSignal(Film f, HttpSession session, UploadImageFile uploadedImageFile) {
		String imageFolder = session.getServletContext().getRealPath("");
		
		AddImage addImage = new AddImage();
		
		addImage.uploadFilmImageSignal(imageFolder, f.getFid(), uploadedImageFile);
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("redirect:/admin_toUpdateFilm?fid=" + f.getFid());
		
		return mav;
	}
	
	@RequestMapping("/admin_updateFilmImageDetail")
	public ModelAndView updateFilmImageDetail(FilmDetailPicture fdp, HttpSession session, UploadImageFile uploadedImageFile) {
		int fdppid = filmDetailPictureService.getMax() + 1;
		
		fdp.setFdppid(fdppid);
		
		String imageFolder = session.getServletContext().getRealPath("");
		
		AddImage addImage = new AddImage();
		
		addImage.uploadFilmImageDetail(imageFolder, fdppid, uploadedImageFile);
		
		filmDetailPictureService.add(fdp);
		
		ModelAndView mav = new ModelAndView();
		
		
		mav.setViewName("redirect:/admin_toUpdateFilm?fid=" + fdp.getFdpfid());
		
		return mav;
	}
	
	@RequestMapping("/admin_deleteFilmImageDetial")
	public ModelAndView deleteFilmImageDetial(FilmDetailPicture fdp, HttpSession session, UploadImageFile uploadedImageFile) {
		filmDetailPictureService.delete(fdp.getFdppid());
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("redirect:/admin_toUpdateFilm?fid=" + fdp.getFdpfid());
		
		return mav;
	}
	
	@RequestMapping("/admin_addFilmType")
	public ModelAndView addFilmType(FilmType ft, HttpSession session, UploadImageFile uploadedImageFile) {
		filmTypeService.add(ft);
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("redirect:/admin_toUpdateFilm?fid=" + ft.getFtfid());
		
		return mav;
	}
	
	@RequestMapping("/admin_deleteFilmType")
	public ModelAndView deleteFilmType(FilmType ft, HttpSession session, UploadImageFile uploadedImageFile) {
		filmTypeService.delete(ft);
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("redirect:/admin_toUpdateFilm?fid=" + ft.getFtfid());
		
		return mav;
	}
	
	@RequestMapping("/admin_addFilmMade")
	public ModelAndView addFilmMade(FilmMade fm, HttpSession session, UploadImageFile uploadedImageFile) {
		filmMadeService.add(fm);
		
		System.out.println(fm.getFmaid() + "!!!!!!!");
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("redirect:/admin_toUpdateFilm?fid=" + fm.getFmfid());
		
		return mav;
	}
	
	@RequestMapping("/admin_deleteFilmMade")
	public ModelAndView deleteFilmMade(FilmMade fm, HttpSession session, UploadImageFile uploadedImageFile) {
		filmMadeService.delete(fm);
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("redirect:/admin_toUpdateFilm?fid=" + fm.getFmfid());
		
		return mav;
	}
	
	@RequestMapping("/admin_listByState")
	public ModelAndView listByState(String state) {
		ModelAndView mav = new ModelAndView();
		List<Film> fs = filmService.listByState(state);
		mav.addObject("fs", fs);
		mav.setViewName("admin/listFilm");
		return mav;
	}
	
	//主页
	@RequestMapping("/mainPage")
	public ModelAndView mainPage() {
		ModelAndView mav = new ModelAndView();
		
		List<Film> films_on = filmService.listByState("在映");
		List<Film> films_next = filmService.listByState("待映");
		List<Film> films_fboxoffice = filmService.rankByFboxoffice();
		List<Film> films_flikes = filmService.rankByFlikes();
		List<Film> films_fscore = filmService.rankByFscore();
		
		int total_on = (int)new PageInfo<>(films_on).getTotal();
		int total_next = (int)new PageInfo<>(films_next).getTotal();
		int total_fboxoffice = (int)new PageInfo<>(films_fboxoffice).getTotal();
		int total_flikes = (int)new PageInfo<>(films_flikes).getTotal();
		int total_fscore = (int)new PageInfo<>(films_fscore).getTotal();
		
		mav.addObject("films_on", films_on);
		mav.addObject("films_next", films_next);
		mav.addObject("films_fboxoffice", films_fboxoffice);
		mav.addObject("films_flikes", films_flikes);
		mav.addObject("films_fscore", films_fscore);
		
		mav.addObject("total_on", total_on);
		mav.addObject("total_next", total_next);
		mav.addObject("total_fboxoffice", total_fboxoffice);
		mav.addObject("total_flikes", total_flikes);
		mav.addObject("total_fscore", total_fscore);
		
		mav.setViewName("fore/mainPage");
		return mav;
	}
	
	
	@RequestMapping("/searchFilm")
	public ModelAndView searchFile(String name) {
	       ModelAndView mav = new ModelAndView();

	   List<Film> fs;
	   if(name.equals("")){
	      fs = filmService.list();
	   }
	   else {
	      fs = filmService.listBySname(name);
	   }

	   mav.addObject("fs", fs);
	   mav.addObject("name", name);

	   mav.setViewName("fore/searchFilm");
	   return mav;
	}
	
	@RequestMapping("/rankFilms")
	public ModelAndView rankFilms(String type) {
		ModelAndView mav = new ModelAndView();
		
		List<Film> films = null;
		
		//热映口碑榜
		if(type.equals("fscore_on")) {
	        films = filmService.rankByFscore_on();    	
		}
		
		//最受期待榜
		else if(type.equals("flikes_next")) {
	        films = filmService.rankByFlikes();    	
		}
		
		//票房榜
		else if(type.equals("fboxoffice")) {
	        films = filmService.rankByFboxoffice();    	
		}
		
		//Top10
		else {
	        films = filmService.rankByFscore();    	
		}
		
		mav.addObject("films", films);
		mav.addObject("type", type);
		mav.setViewName("fore/rankFilms");
		return mav;
	}
	
	@RequestMapping("/listFilm")
	public ModelAndView filmList(String showType, String typeId, String region, String orderType) {
	   Map map = new HashMap<String, String>();

	   map.put("showType", showType);
	   if(!typeId.equals("")) map.put("typeId", typeId);
	   if(!region.equals("")) map.put("region", region);
	   if(orderType.equals("1")) map.put("orderType", orderType);

	   List<Film> fs = filmService.listSTRO(map);
	   ModelAndView mav = new ModelAndView();

	   mav.addObject("fs", fs);
	   mav.addObject("showType", showType);
	   mav.addObject("typeId", typeId);
	   mav.addObject("region", region);
	   mav.addObject("orderType", orderType);

	   mav.setViewName("fore/listFilm");

	   return mav;
	}

}