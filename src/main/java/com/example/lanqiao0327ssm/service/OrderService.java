package com.example.lanqiao0327ssm.service;

import com.example.lanqiao0327ssm.pojo.Order;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface OrderService {

    List<Order> queryAllByOrder(int userId);

    List<List<Order>> queryAllByOrder1(int userId);

    List<List<Order>> queryAllByOrder2(int userId);

    boolean addOrder(int userId,int productId);

    boolean addOrderList(int userId);

}
