package com.example.lanqiao0327ssm.service;

import com.example.lanqiao0327ssm.pojo.ShoppingCart;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface ShoppingCartService {

    List<ShoppingCart> queryAllByUserId(int userId);

    boolean add(ShoppingCart cart);

    boolean deleteShopping(int id);

    boolean update(int id,int num);

    int  getNumByUser(int  UserId);

}
