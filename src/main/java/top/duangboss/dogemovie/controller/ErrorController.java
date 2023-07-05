package top.duangboss.dogemovie.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import top.duangboss.dogemovie.pojo.Film;
import top.duangboss.dogemovie.util.Page;

import java.util.List;

@Controller
@RequestMapping("")
public class ErrorController {
    @RequestMapping("notfound")
    public ModelAndView listFilm(Page page) {
        ModelAndView mav = new ModelAndView();

        mav.setViewName("error");
        return mav;
    }
}
