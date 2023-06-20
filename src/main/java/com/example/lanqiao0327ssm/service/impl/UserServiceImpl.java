package com.example.lanqiao0327ssm.service.impl;

import com.example.lanqiao0327ssm.mapper.UserMapper;
import com.example.lanqiao0327ssm.pojo.Product;
import com.example.lanqiao0327ssm.pojo.User;
import com.example.lanqiao0327ssm.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    //    依赖注入
    @Autowired
    UserMapper mapper;


    //    获取所有用户
    @Override
    public List<User> getAllUsers() {
//       调用持久层接口的方法进行数据查询
        List<User> users = mapper.queryAll();
        return users;

    }


    @Override
    public User checkUser(User user) {

        User one = mapper.queryOne(user);

        return one;

    }

    @Override
    public boolean insertUser(User user) {
        //判断
        User queryUser = mapper.queryOneByUserName(user.getUsername());
        if (queryUser != null) {
            return false;
        }


        int a = mapper.insertUser(user);
        if (a == 0) {
            return false;
        } else {
            return true;
        }

    }

    @Override
    public boolean checkUsername(String username) {
        //去数据库里面根据username查询
        User user = mapper.queryOneByUserName(username);
//        if (user==null){
//            return false;
//        }else
//        {
//            return true;
//        }
        return user != null;   //与上面等效

    }


}
