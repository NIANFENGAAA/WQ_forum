package com.zwq.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zwq.dao.UserMapper;
import com.zwq.pojo.Comment;
import com.zwq.pojo.User;
import com.zwq.pojo.User_User;
import com.zwq.result.Result;
import com.zwq.service.UserService;
import com.zwq.utils.MD5Util;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;

import java.util.List;
import java.util.UUID;

@Slf4j
public class UserServiceImpl implements UserService {
    private UserMapper userMapper;

    public void setUserMapper(UserMapper userMapper) {
        this.userMapper = userMapper;
    }

    @Override
    public User userLogin(User user) {
        if (userMapper.getUserByLogin(user) != null)
            return userMapper.getUserByLogin(user);
        return null;
    }

    @Override
    public User userRegisterByEmail(User user) {
        return userMapper.userRegisterByEmail(user);
    }

    @Override
    public User userRegisterByName(User user) {
        return userMapper.userRegisterByName(user);
    }

    @Override
    public boolean addUser(User user) {
        String password = user.getPassword();
        String encryptMD5 = MD5Util.encryptMD5(password);
        user.setPassword(encryptMD5);
        return userMapper.addUser(user);
    }

    @Override
    public boolean updateUser(User user) {
        return userMapper.updateUser(user);
    }

    @Override
    public boolean destruction(User presentUser) {
        return userMapper.destruction(presentUser);
    }

    @Override
    public User getUserById(int id) {
        return userMapper.getUserById(id);
    }

    @Override
    public int getFansQuantity(int userId) {
        return userMapper.getFansQuantity(userId);
    }

    @Override
    public List<Integer> getconcernedIdList(int userId) {
        return userMapper.getconcernedIdList(userId);
    }

    @Override
    public List<Integer> getFansIdList(int userId) {
        return userMapper.getFansIdList(userId);
    }

    @Override
    public User_User existUser_User(int fansId, int userId) {
        return userMapper.existUser_User(fansId,userId);
    }

    @Override
    public void addUser_User(int fansId, int userId) {
        userMapper.addUser_User(fansId, userId);
    }

    @Override
    public void deleteUser_User(int fansId, int userId) {
        userMapper.deleteUser_User(fansId,userId);
    }

    @Override
    public List<User> getAllUser() {
        return userMapper.getAllUser();
    }

    @Override
    public PageInfo<User> getUSerByCondition(Integer currentPage, Integer pageSize, String username, int status) {
        PageHelper.startPage(currentPage, pageSize);
        List<User> users = userMapper.getUSerByCondition(username, status);

        PageInfo<User> pageInfo = new PageInfo<User>(users);
        return pageInfo;
    }

    @Override
    public PageInfo<User> getUSerByPageName(Integer currentPage, Integer pageSize, String flag) {
        PageHelper.startPage(currentPage, pageSize);
        List<User> users = userMapper.getUSerByPageName(flag);

        PageInfo<User> pageInfo = new PageInfo<User>(users);
        return pageInfo;
    }

    @Override
    public void addComment(Comment comment) {
        userMapper.addComment(comment);
    }


}
