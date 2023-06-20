package com.example.lanqiao0327ssm.controller;

import com.example.lanqiao0327ssm.pojo.User;
import com.example.lanqiao0327ssm.pojo.ShoppingCart;
import com.example.lanqiao0327ssm.service.ShoppingCartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("shoppingcart")
public class ShoppingCartController {

    @Autowired
    ShoppingCartService service;

    @RequestMapping("list")
    public String list(HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        List<ShoppingCart> shoppingCarts = service.queryAllByUserId(user.getId());
//        List<shoppingCart> shoppingCarts = service.queryAllByUserId(1);
//       做循环，每次循环拿到价格和数量   最后在进行累加
//       再放入model里面      在前端显示
        double sum = 0;   //定义一个总数为0
        for (int i = 0; i < shoppingCarts.size(); i++) {
//            打印每一个
            sum = sum + shoppingCarts.get(i).getNum() * shoppingCarts.get(i).getProduct().getProductSellingPrice();
        }
        model.addAttribute("sum", sum);
        int num = 0;
        for (int i = 0; i < shoppingCarts.size(); i++) {
            num = num + shoppingCarts.get(i).getNum();
        }
        model.addAttribute("num", num);

        model.addAttribute( "carts", shoppingCarts);
        return "shoppingCart";
    }

    @RequestMapping("add")
    public String add(HttpSession session, Integer productId,Model model) {
        User user= (User) session.getAttribute("user");//拿到用户信息   强转
        ShoppingCart cart=new  ShoppingCart();            //拿实体类

        cart.setProductId(productId);
        cart.setUserId(user.getId());
        service.add(cart);

        //添加提示信息
        model.addAttribute("addCartSuccess",true);
//        跳转到商品详情页
//        转发跳转可以携带参数
        return "forward:/detailsProduct/"+productId ;
    }


    @RequestMapping("deleteshopping/{id}")
    public String deleteShopping(@PathVariable int id) {
        service.deleteShopping(id);
        return "redirect:/shoppingcart/list";
    }

    @RequestMapping("update")
    public  String update(int id,int num){
       service.update(id, num);
           return "redirect:/shoppingcart/list";
    }



}

//       return  三种格式，
//       1.return+返回页面；
//       2.return+重定向+requestMapping里面的值
//       3.return+数组；
