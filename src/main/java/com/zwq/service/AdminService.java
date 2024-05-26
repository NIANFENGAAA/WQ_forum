package com.zwq.service;

import com.github.pagehelper.PageInfo;
import com.zwq.pojo.Admin;
import com.zwq.pojo.Announcement;
import com.zwq.pojo.User;
import org.springframework.stereotype.Service;

@Service
public interface AdminService {
    Admin getAdmin(Admin admin);
    //分页查询获得用户
    public PageInfo<User> queryAllUserByPage(Integer currentPage, Integer pageSize);

    //管理员修改用户账号状态
    void updateUserStatus(int userId, int status);

    //管理员删除用户账号
    void userDelete(int userId);

    //管理员修改文章的状态
    void updatePostStatus(int postId, int status);

    //管理员删除文章
    void postDelete(int postId);

    //将user-post表中的该文章的有关信息全部删除
    void deleteUser_PostByPostId(int postId);

    //管理员添加网站公告
    Announcement addAnnounce(String textContent);

    Announcement getAnnounceByStatus();

    //管理员更新网站公告
    void updateAnnounce(Announcement newAnnounce);
}
