package com.example.lanqiao0327ssm.service;

import com.example.lanqiao0327ssm.pojo.Product;
import com.example.lanqiao0327ssm.pojo.SearchBean;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface ProductService {

    public List<Product> getAllProduct();

    boolean addProduct(Product product);

    boolean deleteProduct(int id);

    Product updateProduct(int id);

    boolean update(Product product);

    List<Product> getProductBean(SearchBean bean);


//   PageInfo 分页信息
   PageInfo<Product> getProductPage(SearchBean bean, int page);
}
