package com.example.lanqiao0327ssm.mapper;

import com.example.lanqiao0327ssm.pojo.Product;
import com.example.lanqiao0327ssm.pojo.User;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface UserMapper {

    @Select("select * from user")
    List<User> queryAll();

    // 查询用户名为xxx并且密码为xxx的用户   查询到了就会把这个用户信息当作返回值
    //                                  查询不到就会返回一个null
    @Select("select * from user where username = #{username} and password =#{password}")
    public User queryOne(User user);

    @Insert("insert into user (username,password) values (#{username},#{password})")
    public int insertUser(User user);

    @Select("select * from user where username = #{username}")
    public User queryOneByUserName(String username);


}
