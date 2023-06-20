package com.example.lanqiao0327ssm.service;

import com.example.lanqiao0327ssm.pojo.Category;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

public interface CategoryService {
    public List<Category> getAllCategory();
}
