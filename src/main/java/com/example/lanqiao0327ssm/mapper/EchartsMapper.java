package com.example.lanqiao0327ssm.mapper;

import com.example.lanqiao0327ssm.pojo.Product;
import com.example.lanqiao0327ssm.pojo.ToDay;
import org.apache.ibatis.annotations.Select;

import java.util.List;
import java.util.Map;

public interface EchartsMapper {

    //查询商品信息
    @Select("Select * from product")
    List<Product> queryAll();

    //    实现过去30天  每天订单量的柱状图
    @Select("SELECT DATE(order_time) AS date, COUNT(DISTINCT order_id) AS orderCount" +
            " FROM orders " +
            "WHERE order_time >= DATE_SUB(CURDATE(), INTERVAL 30 DAY) " +
            "GROUP BY DATE(order_time)")
    List<Map> queryOrder();


    //  今日订单量
    @Select("SELECT COUNT(DISTINCT order_id) AS dayNum FROM orders WHERE DATE(order_time) = CURDATE()")
    List<Map> selectDayNum();


    //   本周订单量
    @Select(" SELECT COUNT(*) AS weekly_orders FROM orders WHERE order_time >= DATE_SUB(CURDATE(), INTERVAL WEEKDAY(CURDATE()) DAY) AND order_time < DATE_ADD(DATE_SUB(CURDATE(), INTERVAL WEEKDAY(CURDATE()) DAY), INTERVAL 1 WEEK)")
    List<Map> selectWeek();

    //本月订单量
    @Select("SELECT COUNT(*) AS monthly_orders FROM orders WHERE YEAR(order_time) = YEAR(CURDATE()) AND MONTH(order_time) = MONTH(CURDATE())")
    List<Map> selectMoth();

    //    今日销售额
    @Select("SELECT CAST(SUM(price*num) AS UNSIGNED) AS dailySales FROM orders WHERE DATE(order_time) = CURDATE()")
    List<ToDay> selectDayPrice();

    //    本周销售额
    @Select("SELECT CAST(SUM(price*num) AS UNSIGNED) AS weekly_sales FROM orders WHERE order_time >= DATE_SUB(CURDATE(), INTERVAL WEEKDAY(CURDATE()) DAY) AND order_time < DATE_ADD(DATE_SUB(CURDATE(), INTERVAL WEEKDAY(CURDATE()) DAY), INTERVAL 1 WEEK)")
    List<Map> selectWeekPrice();

    //    本月销售额
    @Select("SELECT CAST(SUM(price*num) AS UNSIGNED) AS monthly_sales FROM orders WHERE YEAR(order_time) = YEAR(CURDATE()) AND MONTH(order_time) = MONTH(CURDATE())")
    List<Map> selectMothPrice();


    //    最近十天销售额
    @Select("SELECT DATE_FORMAT(order_time, '%m-%d') AS date, SUM(price*num) AS sales_amount FROM orders WHERE order_time >= DATE_SUB(CURDATE(), INTERVAL 7 DAY) GROUP BY DATE_FORMAT(order_time, '%m-%d')")
    List<Map> AllTen();


    //查询总人数
    @Select("select COUNT(id) AS user_sum FROM user")
    List<Map> selectAllUser();

    //查询总商品
    @Select("select count(*) AS product from product")
    List<Map> selectProduct();

    //查询订单总数
    @Select("select count(distinct order_id) AS sum_order from orders")
    List<Map> selectOrder();

    //    查询所有销售额
    @Select("SELECT CAST(SUM(price*num) AS UNSIGNED) AS total_sales FROM orders")
    List<Map> selectPrice();

    //    占比
    @Select("SELECT c.category_id, c.category_name, COUNT(p.product_id) AS product_count, COUNT(p.product_id)/(SELECT COUNT(*) FROM product) AS product_ratio FROM category c LEFT JOIN product p ON c.category_id = p.category_id GROUP BY c.category_id, c.category_name ORDER BY c.category_id ASC, product_ratio DESC")
    List<Map> selectCate();

    //    折线图
    @Select("SELECT DATE_FORMAT(order_time, '%m-%d') AS order_date, COUNT(DISTINCT order_id) AS order_count FROM orders WHERE order_time >= DATE_SUB(CURDATE(), INTERVAL 15 DAY) GROUP BY order_date ORDER BY order_date ASC")
    List<Map> selectEday();

    //    排名第一
    @Select("SELECT c.category_id, c.category_name, COUNT(p.product_id) AS product_count, ROUND(COUNT(p.product_id) / (SELECT COUNT(*) FROM product) * 100, 2) AS total_ratio FROM category c LEFT JOIN product p ON c.category_id = p.category_id GROUP BY c.category_id, c.category_name ORDER BY product_count DESC limit 6;")
    List<Map> first();

    //    商品详情
    @Select("SELECT o.product_id, SUBSTRING(p.product_name, 1, 5) AS name, o.price, o.num FROM orders o JOIN product p ON o.product_id = p.product_id ORDER BY o.order_time ")
    List<Map> selectTen();

}
