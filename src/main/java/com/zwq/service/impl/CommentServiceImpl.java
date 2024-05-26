package com.zwq.service.impl;

import com.zwq.dao.CommentMapper;
import com.zwq.service.CommentService;

public class CommentServiceImpl implements CommentService {
    private CommentMapper commentMapper;

    public void setCommentMapper(CommentMapper commentMapper) {
        this.commentMapper = commentMapper;
    }

    @Override
    public void insertComment_user(int userId, int commentId) {
        commentMapper.insertComment_user(userId,commentId);
    }

    @Override
    public void addCommentGood(int commentId) {
        commentMapper.addCommentGood(commentId);
    }

    @Override
    public void deleteComment_user(int userId, int commentId) {
        commentMapper.deleteComment_user(userId,commentId);
    }

    @Override
    public void deleteCommentGood(int commentId) {
        commentMapper.deleteCommentGood(commentId);
    }
}
