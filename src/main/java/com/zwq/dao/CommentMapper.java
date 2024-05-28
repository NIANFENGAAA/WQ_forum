package com.zwq.dao;

import com.zwq.pojo.Report;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface CommentMapper {

    void insertComment_user(@Param("userId") int userId, @Param("commentId")int commentId);

    void addCommentGood(int commentId);

    void deleteComment_user(@Param("userId") int userId, @Param("commentId")int commentId);

    void deleteCommentGood(int commentId);

    void insertToReport(Report report);
}
