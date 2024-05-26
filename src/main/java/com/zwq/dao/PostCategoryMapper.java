package com.zwq.dao;

import com.zwq.pojo.Category;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface PostCategoryMapper {

    List<Category> getAllPostCategory();
}
