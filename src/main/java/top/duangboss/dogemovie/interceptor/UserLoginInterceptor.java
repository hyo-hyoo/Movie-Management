package top.duangboss.dogemovie.interceptor;

import org.apache.commons.lang.StringUtils;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import top.duangboss.dogemovie.pojo.User;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class UserLoginInterceptor extends HandlerInterceptorAdapter {
    public boolean preHandle(HttpServletRequest request,
                             HttpServletResponse response, Object handler) throws Exception {

        HttpSession session = request.getSession();
        String contextPath=session.getServletContext().getContextPath();

        String[] pass = {
                "/toLogin",
                "/login",
                "/logout",
                "/toRegister",
                "/register",
                "/notfound"
        };

        String uri = request.getRequestURI();
        String query = request.getQueryString();
        uri = StringUtils.remove(uri, contextPath);

        if(uri.startsWith("/admin")){
            return true;
        }

        for(int i = 0;i < pass.length;i ++) {
            if(uri.equals(pass[i])) return true;
        }

        User user = (User) session.getAttribute("user");
        if(null == user){
            session.setAttribute("furl", uri + "?" + query);
            response.sendRedirect("toLogin");
            return false;
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