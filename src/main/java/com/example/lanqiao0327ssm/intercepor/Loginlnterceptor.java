package com.example.lanqiao0327ssm.intercepor;

import com.example.lanqiao0327ssm.pojo.User;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//登录拦截器
//判断用户是否登录
public class Loginlnterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
    //判断是否登录
    //判断session里面是否有用户
        HttpSession session = request.getSession();
        User user=(User) session.getAttribute("user");
        if(user!=null){
            return true;
        }else{
//          response.sendRedirect("/login");  //重定向
            request.setAttribute("loginInfo",true);
            request.getRequestDispatcher("/login").forward(request,response);    //转发
            return false;
        }
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        HandlerInterceptor.super.postHandle(request, response, handler, modelAndView);
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
        HandlerInterceptor.super.afterCompletion(request, response, handler, ex);
    }
}
