package com.zwq.controller;

import com.zwq.pojo.Category;
import com.zwq.pojo.Post;
import com.zwq.service.PostCategoryService;
import com.zwq.service.PostService;
import com.zwq.service.UserService;
import com.zwq.vo.IndexPost;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@Slf4j
public class PostCategoryController {
    @Autowired
    @Qualifier("PostCategoryServiceImpl")
    private PostCategoryService postCategoryService;

    @Autowired
    @Qualifier("PostServiceImpl")
    private PostService postService;

    @Autowired
    @Qualifier("UserServiceImpl")
    private UserService userService;





}
