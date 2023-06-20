package com.example.lanqiao0327ssm.controller;
import com.example.lanqiao0327ssm.pojo.Order;
import com.example.lanqiao0327ssm.pojo.User;
import com.example.lanqiao0327ssm.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("order")
public class OrderControllder {

    @Autowired
    OrderService service;

    @RequestMapping("list")
    public String list(HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        List<Order> orders = service.queryAllByOrder(user.getId());
        model.addAttribute("orders",orders);
        return "order";
    }

    @RequestMapping("list1")
    public String list1(HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        List<List<Order>> orders = service.queryAllByOrder2(user.getId());
        model.addAttribute("orders",orders);
        return "order1";
    }
@RequestMapping("addOrder")
  public  String addOrder(HttpSession session,int productId){
        User user=(User) session.getAttribute("user");
        service.addOrder(user.getId(),productId);
        return "redirect:/order/list1";

  }
    @RequestMapping("addAll")
    public  String addOrderAll(HttpSession session){
        User user=(User) session.getAttribute("user");
        service.addOrderList(user.getId());
        return "redirect:/order/list1";

    }



}
