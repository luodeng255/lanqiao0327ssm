package com.example.lanqiao0327ssm.controller;


import com.example.lanqiao0327ssm.pojo.Category;
import com.example.lanqiao0327ssm.pojo.Product;
import com.example.lanqiao0327ssm.pojo.SearchBean;
import com.example.lanqiao0327ssm.service.CategoryService;
import com.example.lanqiao0327ssm.service.ProductService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;


@Controller
public class ProductController {

        @Autowired
        ProductService productService;
        @Autowired
        CategoryService categoryService;


//       page代表第几页  @RequestParam(defaultValue = "1")默认值默认第一页
        @RequestMapping("product")
        public String testall( SearchBean bean,@RequestParam(defaultValue = "1") int page, Model model) {
          PageInfo<Product> info = productService.getProductPage(bean, page);
            model.addAttribute("products", info.getList());
            model.addAttribute("num", info.getTotal());
            model.addAttribute("page",page);
            model.addAttribute("SearchBean",bean);
            List<Category> categorys = categoryService.getAllCategory();
            model.addAttribute("categorys", categorys);
            return "product";
        }


    @RequestMapping("toAddProduct")
    public String toAddProduct(Model model) {
        //获取所有类别
        List<Category> categorys = categoryService.getAllCategory();
        //将数据放入model
        model.addAttribute("categorys", categorys);
        return "addProduct";
    }

    //    添加数据
    @PostMapping("addProduct")
    public String addProduct(Product product) {
//        1.调用前端发来的数据
//        2.调用业务层的方法进行保存
        productService.addProduct(product);
//        3.不能返回列表页面  跳转productList请求
        return "redirect:/product";
    }

    @RequestMapping("deleteProduct/{id}")
    public String deleteProduct(@PathVariable int id) {

        productService.deleteProduct(id);

        return "redirect:/product";
    }


    @RequestMapping("toupdateProduct/{id}")
    public String updateProduct(@PathVariable int id, Model model) {
        Product product = productService.updateProduct(id);
        model.addAttribute("products", product);
        List<Category> categorys = categoryService.getAllCategory();
        model.addAttribute("categorys", categorys);
        return "updateProduct";
    }

    @RequestMapping("update")
    public String update(Product product) {
//       调用业务层   获取所有用户   发送给前端html
        productService.update(product);
        return "redirect:/product";
    }


    @RequestMapping("detailsProduct/{id}")
    public String detailsProduct(@PathVariable int id, Model model) {
        Product product = productService.updateProduct(id);
        model.addAttribute("products", product);
        List<Category> categorys = categoryService.getAllCategory();
        model.addAttribute("categorys", categorys);
        return "details";
    }



}

