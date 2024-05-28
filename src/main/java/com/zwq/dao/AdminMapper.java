package com.zwq.dao;

import com.zwq.pojo.*;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface AdminMapper {
    Admin getAdmin(Admin admin);

    List<User> queryAllUserByPage();

    void userOpen(int userId);

    void userClose(int userId);

    void userDelete(int userId);

    void postOpen(int postId);

    void postClose(int postId);

    void postDelete(int postId);

    void deleteUser_PostByPostId(int postId);

    Announcement addAnnounce(String textContent);

    Announcement getAnnounceByStatus();

    void updateAnnounce(Announcement newAnnounce);

    List<Report> getAllCommentByPage();

    Comment getCommentById(int commentId);

    void deleteReportById(int reportId);

    void deleteReportByCommentId(int commentId);

    void deleteComment_userByCommentId(int commentId);

    void deleteCommentByCommentId(int commentId);
}
