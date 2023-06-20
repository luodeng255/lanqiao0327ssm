package com.example.lanqiao0327ssm.service.impl;

import com.example.lanqiao0327ssm.Utill.DateUtill;
import com.example.lanqiao0327ssm.Utill.SnowflakeIdGenerator;
import com.example.lanqiao0327ssm.mapper.OrdersMapper;
import com.example.lanqiao0327ssm.mapper.ProductMapper;
import com.example.lanqiao0327ssm.mapper.ShoppingCartMapper;
import com.example.lanqiao0327ssm.pojo.Order;
import com.example.lanqiao0327ssm.pojo.Product;
import com.example.lanqiao0327ssm.pojo.ShoppingCart;
import com.example.lanqiao0327ssm.service.OrderService;
import org.aspectj.weaver.ast.Or;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class OrderImpl implements OrderService {

    @Autowired
    OrdersMapper mapper;

    @Autowired
    ProductMapper productMapper;

    @Autowired
    SnowflakeIdGenerator snow;

    @Autowired
    ShoppingCartMapper shoppingCartMapper;

    @Override
    public List<Order> queryAllByOrder(int userId) {
//        1.查询
        List<Order> orderList = mapper.queryAllByOrder(userId);

        for (int i = 0; i < orderList.size(); i++) {
//            对每一个订单进行处理
            Order order = orderList.get(i);
//            拿到date类型的订单时间
            Date orderTime = order.getOrderTime();
//            转换成String类型
            String datStr = DateUtill.dateToString(orderTime);
//            放入订单对象
            order.setOrderTimeStr(datStr);
        }
//        将处理好的数据返回订单列表
        return orderList;

    }

    @Override
    public List<List<Order>> queryAllByOrder1(int userId) {
//      如何转换
//     1.通过一定的算法 进行转换
//     2.通过 用户id   查询订单id
//          做for循环   每个订单id    list<order>
//          将根据订单id查询出来的结果    放入List<List<Order>>集合当中
        List<Long> orderIds = mapper.allByOrder(userId);
//       增强for循环
        List<List<Order>> orders = new ArrayList<>();

        for (Long orderId : orderIds) {
            List<Order> orderList = mapper.allByProduct(orderId);
            orders.add(orderList);
        }
        return orders;
    }

    @Override
    public List<List<Order>> queryAllByOrder2(int userId) {
        List<Order> orderList = queryAllByOrder(userId);
//        通过一定的算法进行转换    转换成List<List<Order>>
//        循环列表
//        创建一个mapper
        LinkedHashMap<Long, List<Order>> orderMap = new LinkedHashMap<>();
        for (Order order : orderList) {
            Long orderId = order.getOrderId();
            List<Order> list = orderMap.computeIfAbsent(orderId, k -> new ArrayList<>());
            list.add(order);
        }
        Collection<List<Order>> values = orderMap.values();

        List<List<Order>> lists = new ArrayList<>(values);
        return lists;

    }

    @Override
    public boolean addOrder(int userId, int productId) {
//        1.创建order对象
        Product product = productMapper.updateProduct(productId);
        Order order = new Order();
        order.setOrderId(snow.nextId());
        order.setUserId(userId);
        order.setProductId(productId);
        order.setNum(1);
        order.setPrice(product.getProductSellingPrice());
        order.setOrderTime(new Date());
//        2.添加
        return mapper.addOrder(order) == 1;
    }

    @Override
    public boolean addOrderList(int userId) {
//        1.创建order对象
        List<ShoppingCart> carts = shoppingCartMapper.queryAllByUserId(userId);
//      2.将数据创建成多个orders对象
        List<Order> orders = new ArrayList<>();
//       2.1订单号 时间
        long orderId = snow.nextId();
        Date date = new Date();
//      3.调用mapper 将多个order对象
        for (ShoppingCart cart : carts) {
            Order order = new Order();
            order.setOrderId(orderId);
            order.setUserId(userId);
            order.setProductId(cart.getProductId());
            order.setNum(cart.getNum());
            order.setPrice(cart.getProduct().getProductSellingPrice());
            order.setOrderTime(date);
            orders.add(order);
        }
        mapper.addOrderList(orders);
        shoppingCartMapper.deleteByUserId(userId);

        return false;
    }


}
