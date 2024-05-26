package com.zwq.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zwq.dao.AdminMapper;
import com.zwq.pojo.Admin;
import com.zwq.pojo.Announcement;
import com.zwq.pojo.User;
import com.zwq.service.AdminService;

import java.util.List;

public class AdminServiceImpl implements AdminService {
    private AdminMapper adminMapper;

    public void setAdminMapper(AdminMapper adminMapper) {
        this.adminMapper = adminMapper;
    }

    @Override
    public Admin getAdmin(Admin admin) {
        return adminMapper.getAdmin(admin);
    }

    @Override
    public PageInfo<User> queryAllUserByPage(Integer currentPage, Integer pageSize) {
        PageHelper.startPage(currentPage,pageSize);
        List<User> users = adminMapper.queryAllUserByPage();

        PageInfo<User> pageInfo = new PageInfo<User>(users);
        return pageInfo;
    }

    @Override
    public void updateUserStatus(int userId, int status) {
        if (status == 1)//修改为启用状态
            adminMapper.userOpen(userId);
        if (status == 0)//修改为禁用状态
            adminMapper.userClose(userId);
    }

    @Override
    public void userDelete(int userId) {
        adminMapper.userDelete(userId);
    }

    @Override
    public void updatePostStatus(int postId, int status) {
        if (status == 1)//修改为通过
            adminMapper.postOpen(postId);
        else
            adminMapper.postClose(postId);
    }

    @Override
    public void postDelete(int postId) {
        adminMapper.postDelete(postId);
    }

    @Override
    public void deleteUser_PostByPostId(int postId) {
        adminMapper.deleteUser_PostByPostId(postId);
    }

    @Override
    public Announcement addAnnounce(String textContent) {
        return adminMapper.addAnnounce(textContent);
    }

    @Override
    public Announcement getAnnounceByStatus() {
        return adminMapper.getAnnounceByStatus();
    }

    @Override
    public void updateAnnounce(Announcement newAnnounce) {
        adminMapper.updateAnnounce(newAnnounce);
    }
}
