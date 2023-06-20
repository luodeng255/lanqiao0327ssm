package com.example.lanqiao0327ssm.service.impl;


import com.example.lanqiao0327ssm.mapper.ShoppingCartMapper;
import com.example.lanqiao0327ssm.pojo.ShoppingCart;
import com.example.lanqiao0327ssm.service.ShoppingCartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ShoppingCartServiceImpl implements ShoppingCartService {

    //依赖注入
    @Autowired
    ShoppingCartMapper mapper;

    @Override
    public List<ShoppingCart> queryAllByUserId(int userId) {
        //调用mapper      业务层
        return mapper.queryAllByUserId(userId);
    }

    @Override
    public boolean add(ShoppingCart cart) {
        //添加
        ShoppingCart shoppingCart = mapper.selectuserId(cart);
        if (shoppingCart == null) {
            //添加数据
            return mapper.insertShoppingCart(cart) == 1;
        } else {
         //修改
            return mapper.update(shoppingCart.getId(), 1) == 1;
        }
    }

    @Override
    public boolean deleteShopping(int id) {
        return mapper.deleteShopping(id) == 1;
    }


    @Override
    public boolean update(int id, int num) {

        if (num == -1) {
//          查询出这条购物车数据
            ShoppingCart cart = mapper.selectById(id);
            if (cart.getNum() == 1) {
//                删除
                return mapper.deleteShopping(id) == 1;
            }
        }
            return mapper.update(id, num) == 1;
    }

    @Override
    public int getNumByUser(int userId) {
        return mapper.queryUserNum(userId);
    }


}
