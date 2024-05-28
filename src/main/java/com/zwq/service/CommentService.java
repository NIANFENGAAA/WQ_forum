package com.zwq.service;

import com.zwq.pojo.Report;
import org.springframework.stereotype.Service;

@Service
public interface CommentService {

    //将当前用户id和评论id加入到表comment_user中
    void insertComment_user(int userId, int commentId);

    //将comment表中的点赞数量加一
    void addCommentGood(int commentId);

    //将当前用户id和评论id在表comment_user中的数据删除
    void deleteComment_user(int userId, int commentId);

    //将comment表中的点赞数量减一
    void deleteCommentGood(int commentId);

    //将举报的实体类插入report表中
    void insertToReport(Report report);
}
