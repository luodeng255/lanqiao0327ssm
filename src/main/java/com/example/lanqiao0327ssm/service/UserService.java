package com.example.lanqiao0327ssm.service;

import com.example.lanqiao0327ssm.pojo.User;
import org.springframework.stereotype.Service;

import java.util.List;

//规范
@Service
public interface UserService {

    List<User> getAllUsers();

    User checkUser(User user);

    boolean insertUser(User user);

    boolean checkUsername(String username);
}
