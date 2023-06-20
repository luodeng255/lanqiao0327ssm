package com.example.lanqiao0327ssm.service.impl;


import com.example.lanqiao0327ssm.mapper.ProductMapper;
import com.example.lanqiao0327ssm.pojo.Product;
import com.example.lanqiao0327ssm.pojo.SearchBean;
import com.example.lanqiao0327ssm.service.ProductService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductImpl implements ProductService {

    @Autowired
    ProductMapper mapper;

    @Override
    public List<Product> getAllProduct() {
        List<Product> products = mapper.queryAll();
        return products;
    }

    @Override
    public boolean addProduct(Product product) {
//        如果被修改的行数等于1   等于1修改成功   等于0修改失败
        return mapper.addProduct(product) == 1;
    }

    @Override
    public boolean deleteProduct(int id) {
        return mapper.deleteProduct(id) == 1;
    }

    @Override
    public Product updateProduct(int id) {
        return mapper.updateProduct(id);
    }

    @Override
    public boolean update(Product product) {
         return  mapper.update(product)==1;
    }


    @Override
    public List<Product> getProductBean(SearchBean bean) {
        return mapper.queryBySearchBean(bean);
    }

    @Override
    public PageInfo<Product> getProductPage(SearchBean bean, int page) {
        PageHelper.startPage(page,10);
        List<Product> products = mapper.queryBySearchBean(bean);
         PageInfo<Product> info = new PageInfo<>(products);  //将list转换为page
         return info;
    }


}
