package com.zwq.service.impl;

import com.zwq.dao.PostCategoryMapper;
import com.zwq.pojo.Category;
import com.zwq.service.PostCategoryService;

import java.util.List;

public class PostCategoryServiceImpl implements PostCategoryService {
    private PostCategoryMapper postCategoryMapper;

    public void setPostCategoryMapper(PostCategoryMapper postCategoryMapper) {
        this.postCategoryMapper = postCategoryMapper;
    }

    @Override
    public List<Category> getAllPostCategory() {
        return postCategoryMapper.getAllPostCategory();
    }
}
