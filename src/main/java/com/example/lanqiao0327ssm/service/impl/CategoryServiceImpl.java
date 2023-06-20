package com.example.lanqiao0327ssm.service.impl;

import com.example.lanqiao0327ssm.mapper.CategoryMapper;
import com.example.lanqiao0327ssm.mapper.ProductMapper;
import com.example.lanqiao0327ssm.pojo.Category;
import com.example.lanqiao0327ssm.service.CategoryService;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class CategoryServiceImpl implements CategoryService {

    @Autowired
    CategoryMapper mapper;

    @Override
    public List<Category> getAllCategory(){
        //调用持久层对应的方法
        return mapper.queryAll();
    }
}
