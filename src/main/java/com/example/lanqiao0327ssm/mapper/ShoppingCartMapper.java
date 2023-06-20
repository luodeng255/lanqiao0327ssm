package com.example.lanqiao0327ssm.mapper;


import com.example.lanqiao0327ssm.pojo.Product;
import com.example.lanqiao0327ssm.pojo.ShoppingCart;
import com.example.lanqiao0327ssm.pojo.User;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface ShoppingCartMapper {


    @Select("select * from shoppingCart s,product p where user_id=#{userId} and s.product_id=p.product_id")
    @Results({
            @Result(column = "id", property = "id"),
            @Result(column = "user_id", property = "userId"),
            @Result(column = "product_id", property = "productId"),
            @Result(column = "num", property = "num"),
            @Result(column = "product_id", property = "product.productId"),
            @Result(column = "product_name", property = "product.productName"),
            @Result(column = "category_id", property = "product.categoryId"),
            @Result(column = "product_title", property = "product.productTitle"),
            @Result(column = "product_intro", property = "product.productIntro"),
            @Result(column = "product_picture", property = "product.productPicture"),
            @Result(column = "product_price", property = "product.productPrice"),
            @Result(column = "product_selling_price", property = "product.productSellingPrice"),
            @Result(column = "product_num", property = "product.productNum"),
            @Result(column = "product_sales", property = "product.productSales"),
    })
    List<ShoppingCart> queryAllByUserId(int userId);


    //1.根据用户id和商品id查询数据
    @Select("select * from shoppingcart where product_id=#{productId} and user_id=#{userId} ")
    ShoppingCart selectuserId(ShoppingCart cart);

    //2.添加一条数据，用户id 商品id num=1
    @Insert("insert into shoppingcart (user_id,product_id,num) values (#{userId},#{productId},1)")
    int insertShoppingCart(ShoppingCart cart);

    //3.修改一条数据  用户id 商品id修改   num=num+1;
    @Update("update shoppingcart set num = num + #{num} where id = #{id}")
    int update(@Param("id")int id, @Param("num") int num );

    //4.删除  根据id删除
    @Delete("DELETE FROM shoppingcart WHERE id=#{id} ")
    int deleteShopping(int id);

    //4.删除  根据id删除
    //oeder删除
    @Delete("DELETE FROM shoppingcart WHERE user_id=#{id} ")
    int deleteByUserId(int id);

    //5.根据id查询一条数据
    @Select("select * from shoppingcart where id=#{Id} ")
    ShoppingCart selectById(int id);

    //6.根据用户id查询num总数
    // cout  代表数据总和
    // sum   代表数据条数总和       sum 求和  avg 求平均   max 最大   min  最小  count 总数
    //                          ifnull
    //                     判断的值，如果为空的值
    @Select("select  ifnull(sum(num),0) from shoppingcart where user_id=#{userId}")
    int queryUserNum(int userId);

}
