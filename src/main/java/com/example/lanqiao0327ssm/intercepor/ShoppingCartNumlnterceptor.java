package com.example.lanqiao0327ssm.intercepor;
//购物车数量的拦截器


import com.example.lanqiao0327ssm.pojo.User;
import com.example.lanqiao0327ssm.service.ShoppingCartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ShoppingCartNumlnterceptor implements HandlerInterceptor {

    @Autowired
    ShoppingCartService shoppingCartService;

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        //查询出购物车数据，然后放在session里面
        //1.获取userId  session里面
        HttpSession session=request.getSession();
        User user= (User) session.getAttribute("user");
        //2.查询   获得shoppingservice
        int num = shoppingCartService.getNumByUser(user.getId());
        //3.放入session
        session.setAttribute("cartNum",num);

        HandlerInterceptor.super.postHandle(request, response, handler, modelAndView);
    }
}
