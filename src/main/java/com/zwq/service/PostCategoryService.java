package com.zwq.service;

import com.zwq.pojo.Category;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface PostCategoryService {
    //获得所有种类
    List<Category> getAllPostCategory();
}
