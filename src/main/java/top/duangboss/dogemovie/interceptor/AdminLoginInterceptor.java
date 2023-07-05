package top.duangboss.dogemovie.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import top.duangboss.dogemovie.pojo.Admin;


public class AdminLoginInterceptor extends HandlerInterceptorAdapter {
    public boolean preHandle(HttpServletRequest request,
                             HttpServletResponse response, Object handler) throws Exception {

        HttpSession session = request.getSession();
        String contextPath=session.getServletContext().getContextPath();

        String[] pass = {
                "/admin_toLogin",
                "/admin_login",
                "/admin_logoff"
        };

        String uri = request.getRequestURI();
        String query = request.getQueryString();
        uri = StringUtils.remove(uri, contextPath);

        for(int i = 0;i < pass.length;i ++) {
            if(uri.equals(pass[i])) return true;
        }

        if(!uri.startsWith("/admin_list")) {
            uri = "/admin_listUser";
        }

        if(uri.startsWith("/admin")) {
            Admin admin = (Admin) session.getAttribute("admin");
            if(null == admin) {
                session.setAttribute("afurl", uri + "?" + query);
            	response.sendRedirect("admin_login");
                return false;
            }
        }

        return true;
    }

    public void postHandle(HttpServletRequest request,
            HttpServletResponse response, Object handler,    
            ModelAndView modelAndView) throws Exception {


    }
 
    public void afterCompletion(HttpServletRequest request,    
            HttpServletResponse response, Object handler, Exception ex)  
    throws Exception {  
           
    }  
       
}