package com.example.lanqiao0327ssm.controller;


import com.example.lanqiao0327ssm.pojo.Category;
import com.example.lanqiao0327ssm.pojo.Product;
import com.example.lanqiao0327ssm.pojo.SearchBean;
import com.example.lanqiao0327ssm.service.CategoryService;
import com.example.lanqiao0327ssm.service.ProductService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class    UserPageController {


    @Autowired
    ProductService productService;
    @Autowired
    CategoryService categoryService;

    @RequestMapping("userPages")
    public String userPage(SearchBean bean, @RequestParam(defaultValue = "1") int page, Model model) {
        PageInfo<Product> info = productService.getProductPage(bean, page);
        model.addAttribute("userproduct", info.getList());
        model.addAttribute("num", info.getTotal());
        model.addAttribute("page",page);
        model.addAttribute("SearchBean",bean);
        List<Category> categorys = categoryService.getAllCategory();
        model.addAttribute("categorys", categorys);
        return "userPage";
    }
    @RequestMapping("userpages/{id}")
    public String detailsProduct(@PathVariable int id, Model model) {
        Product product = productService.updateProduct(id);
        model.addAttribute("products", product);
        List<Category> categorys = categoryService.getAllCategory();
        model.addAttribute("categorys", categorys);
        return "userPage";
    }


}
