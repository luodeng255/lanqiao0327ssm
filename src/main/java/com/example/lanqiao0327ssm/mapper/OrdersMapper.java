package com.example.lanqiao0327ssm.mapper;

import com.example.lanqiao0327ssm.pojo.Order;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.ognl.enhance.OrderedReturn;
import org.aspectj.weaver.ast.Or;

import java.util.List;

public interface OrdersMapper {

    @Select("select * from orders s,product p where user_id=#{userId} and s.product_id=p.product_id order by s.order_time desc")
    @Results({
            @Result(column = "id", property = "id"),
            @Result(column = "order_id", property = "orderId"),
            @Result(column = "user_id", property = "userId"),
            @Result(column = "product_id", property = "productId"),
            @Result(column = "num", property = "num"),
            @Result(column = "price", property = "price"),
            @Result(column = "order_time", property = "orderTime"),
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
    List<Order> queryAllByOrder(int userId);

//          根据用户id   查询所有订单id
    @Select("select distinct order_id from orders where user_id=#{userId} order by order_time desc ")
    List<Long> allByOrder(int userId);

    @Select("select * from orders s,product p where order_id=#{orderId} and s.product_id=p.product_id ")
    @Results({
            @Result(column = "id", property = "id"),
            @Result(column = "order_id", property = "orderId"),
            @Result(column = "user_id", property = "userId"),
            @Result(column = "product_id", property = "productId"),
            @Result(column = "num", property = "num"),
            @Result(column = "price", property = "price"),
            @Result(column = "order_time", property = "orderTime"),
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
    List<Order> allByProduct(Long userId);


//       添加一条数据
      @Insert("insert into orders (order_id,user_id,product_id,num,price,order_time)  value(#{orderId},#{userId},#{productId},#{num},#{price},#{orderTime}) ")
      int addOrder(Order order);

//      添加多条数据
      @Insert("<script> " +
              "insert into orders (order_id,user_id,product_id,num,price,order_time) values " +
              "<foreach collection='list' item='order' separator=',' >" +
              "(#{order.orderId},#{order.userId},#{order.productId},#{order.num},#{order.price},#{order.orderTime})" +
              " </foreach>" +
              "</script>")
      int addOrderList(List<Order> orders);

}
