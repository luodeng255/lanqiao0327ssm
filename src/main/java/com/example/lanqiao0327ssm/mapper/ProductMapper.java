package com.example.lanqiao0327ssm.mapper;

import com.example.lanqiao0327ssm.pojo.Product;
import com.example.lanqiao0327ssm.pojo.SearchBean;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

public interface ProductMapper {

    //    注解的写法    大部分情况只能满足单表查询    将原来的注释掉
//    @Select("select * from product ")
    List<Product> queryAll();

    @Insert("INSERT INTO product (product_name, category_id, product_title, product_intro, product_picture, product_price, product_selling_price, product_num, product_sales)\n" +
            "VALUES (#{productName}, #{categoryId}, #{productTitle}, #{productIntro}, #{productPicture}, #{productPrice}, #{productSellingPrice}, #{productNum}, #{productSales})\n")
    int addProduct(Product product);

   @Delete("DELETE FROM product WHERE product_id=(#{id})")
    int deleteProduct(int id);

  @Select("select * from product where product_id=(#{id})")
   Product updateProduct(int id);

  //根据id修改
   @Update("update product set product_name=#{productName}, category_id=#{categoryId}, product_title=#{productTitle}, product_intro=#{productIntro}, product_picture=#{productPicture}, product_price=#{productPrice}, product_selling_price=#{productSellingPrice}, product_num=#{productNum}, product_sales=#{productSales} WHERE product_id=#{productId}")
//      返回值返回值都是实体类
 //    返回结果有多条用list<实体类>(结果多条 0或1都可)
    int update(Product product);

   List<Product> queryBySearchBean(SearchBean bean);



}
