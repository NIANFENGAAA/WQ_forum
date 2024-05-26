package com.zwq.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zwq.dao.PostMapper;
import com.zwq.pojo.Comment;
import com.zwq.pojo.Comment_User;
import com.zwq.pojo.Post;
import com.zwq.pojo.User_Post;
import com.zwq.service.PostService;
import com.zwq.vo.NewComment;

import java.util.List;

public class PostServiceImpl implements PostService {
    private PostMapper postMapper;

    public void setPostMapper(PostMapper postMapper) {
        this.postMapper = postMapper;
    }

    @Override
    public List<Post> getAllPost() {
        return postMapper.getAllPost();
    }

    @Override
    public Boolean addPost(Post newPost) {
        return postMapper.addPost(newPost);
    }

    @Override
    public Post getPostById(int postId) {
        return postMapper.getPostById(postId);
    }

    @Override
    public int getGoodQuality(int postId) {
        return postMapper.getGoodQuality(postId);
    }

    @Override
    public User_Post getGoodStatus(int postId, int userId) {
        return postMapper.getGoodStatus(postId,userId);
    }

    @Override
    public void addView(int postId) {
        postMapper.addView(postId);
    }

    @Override
    public int getPostQuantity(int userId) {
        return postMapper.getPostQuantity(userId);
    }

    @Override
    public User_Post isNull(int postId, int userId) {
        return postMapper.isNull(postId,userId);
    }

    @Override
    public void addUser_Post(int postId, int userId) {
        postMapper.addUser_Post(postId,userId);
    }

    @Override
    public List<Post> getPostByUserId(int userId) {
        return postMapper.getPostByUserId(userId);
    }

    @Override
    public List<Integer> getGooded(int userId) {
        return postMapper.getGooded(userId);
    }

    @Override
    public void addGoodById(int userId, int postId) {
        postMapper.addGoodById(userId,postId);
    }

    @Override
    public void deleteGood(int userId, int postId) {
        postMapper.deleteGood(userId,postId);
    }

    @Override
    public PageInfo<Post> getPostByPagePostName(Integer currentPage, Integer pageSize, String flag) {
        PageHelper.startPage(currentPage,pageSize);
        List<Post> posts = postMapper.getPostByPagePostName(flag);
        PageInfo<Post> pageInfo = new PageInfo<Post>(posts);
        return pageInfo;
    }

    @Override
    public PageInfo<Post> getPostByPageCondition(Integer currentPage, Integer pageSize, String flag, int postOption) {
        PageHelper.startPage(currentPage,pageSize);
        List<Post> posts = postMapper.getPostByPageCondition(flag, postOption);
        PageInfo<Post> pageInfo = new PageInfo<Post>(posts);
        return pageInfo;
    }

    @Override
    public List<Post> getAllPostByStatus() {
        return postMapper.getAllPostByStatus();
    }

    @Override
    public List<Comment> getAllCommentByPostId(int postId) {
        return postMapper.getAllCommentByPostId(postId);
    }

    @Override
    public Comment_User getComment_User(int userId, int commentId) {
        return postMapper.getComment_User(userId,commentId);
    }

    @Override
    public void deleteStar(int userId, int postId) {
        postMapper.deleteStar(userId,postId);
    }

    @Override
    public void addStarById(int userId, int postId) {
        postMapper.addStarById(userId,postId);
    }
}
