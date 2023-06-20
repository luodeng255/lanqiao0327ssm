package com.example.lanqiao0327ssm.mapper;

import com.example.lanqiao0327ssm.pojo.Category;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface CategoryMapper {

    @Select("select * from category")
    public List<Category> queryAll();
}
