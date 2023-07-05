package top.duangboss.dogemovie.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import top.duangboss.dogemovie.pojo.Order;
import top.duangboss.dogemovie.pojo.Session;
import top.duangboss.dogemovie.service.OrderService;
import top.duangboss.dogemovie.service.SessionService;
import top.duangboss.dogemovie.util.GetTime;
import top.duangboss.dogemovie.util.Page;
import top.duangboss.dogemovie.pojo.User;

@Controller
@RequestMapping("")
public class OrderController {
	@Autowired
	OrderService orderService;

	@Autowired
	SessionService sessionService;

	@RequestMapping("admin_listOrder")
	public ModelAndView listOrder(Page page){
		ModelAndView mav = new ModelAndView();

		PageHelper.offsetPage(page.getStart(),5);

		List<Order> os= orderService.list(page);

		int total = (int) new PageInfo<>(os).getTotal();

		page.setTotal(total);

		mav.addObject("os", os);
		mav.addObject("page", page);

		mav.setViewName("admin/listOrder");
		return mav;
	}

	@RequestMapping("admin_deleteOrder")
	public ModelAndView deleteUser(String OID, Page page){
		int oid = Integer.parseInt(OID);

		Order order = orderService.get(oid);

		String ost = order.getOseats();

		Session s =  sessionService.getById(order.getOsid());

		char ss[] = s.getSseatstate().toCharArray();

		for(int i = 0;i < ost.length();i += 7) {
			int row = Integer.parseInt(ost.substring(i, i + 2));
			int col = Integer.parseInt(ost.substring(i + 3, i + 5));

			int index = (row - 1) * 16 + col - 1;

			ss[index] = '0';
		}

		s.setSseatstate(new String(ss));

		sessionService.update(s);

		orderService.delete(oid);

		ModelAndView mav = new ModelAndView();
		List<Order> os= orderService.list(page);

		mav.addObject("os", os);

		mav.setViewName("redirect:/admin_listOrder");
		return mav;
	}

	@RequestMapping("myorders")
	public ModelAndView myorders(HttpSession session) {
		User user = (User) session.getAttribute("user");

		List<Order> os = orderService.listByUser(user.getUid());

		ModelAndView mav = new ModelAndView();

		mav.addObject("os", os);

		mav.setViewName("fore/myorders");
		return mav;
	}

	@RequestMapping("confirmOrder")
	public ModelAndView confirmOrder(Order order, String seat1, String seat2, String seat3, String ofname, String ocname, String ohname, String ostime) {
		ModelAndView mav = new ModelAndView();

		String ss = "";

		if(seat1 != null) ss += seat1;

		if(seat2 != null) ss += " " + seat2;

		if(seat3 != null) ss += " " + seat3;

		order.setOseats(ss);

		mav.addObject("o", order);
		mav.addObject("ofname", ofname);
		mav.addObject("ocname", ocname);
		mav.addObject("ohname", ohname);
		mav.addObject("ostime", ostime);

		mav.setViewName("fore/confirmOrder");

		return mav;
	}

	@RequestMapping("addOrder")
	@ResponseBody
	public String addOrder(Order order) {
		order.setOdealtime(GetTime.getTime());

		System.out.println("OOOOOOOOOOO");

		String os = order.getOseats();

		System.out.println(os);

		Session s =  sessionService.getById(order.getOsid());

		char ss[] = s.getSseatstate().toCharArray();

		for(int i = 0;i < os.length();i += 7) {
			int row = Integer.parseInt(os.substring(i, i + 2));
			int col = Integer.parseInt(os.substring(i + 3, i + 5));

			int index = (row - 1) * 16 + col - 1;

			if(ss[index] == '1') return "error";

			ss[index] = '1';
		}

		Integer oid = orderService.add(order);

		s.setSseatstate(new String(ss));

		sessionService.update(s);

		return oid.toString();
	}
}
