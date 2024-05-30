package com.zwq.service;

import com.github.pagehelper.PageInfo;
import com.zwq.pojo.Comment;
import com.zwq.pojo.Comment_User;
import com.zwq.pojo.Post;
import com.zwq.pojo.User_Post;
import com.zwq.vo.NewComment;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface PostService {
    //获得所有帖子
    List<Post> getAllPost();

    Boolean addPost(Post newPost);

    Post getPostById(int postId);

    //根据文章id，获得一个文章的点赞数量
    int getGoodQuality(int postId);

    //根据文章id和用户id，获得一个文章的点赞状态
    User_Post getGoodStatus(int postId,int userId);

    //点击一次文章的观看量就加一
    void addView(int postId);

    //根据用户id得到该作者的所有文章数量
    int getPostQuantity(int userId);

    //根据文章id和用户id来查看用户和文章的关系是否已经存在user_post表中
    User_Post isNull(int postId, int userId);

    void addUser_Post(int postId, int userId);

    List<Post> getPostByUserId(int userId);

    //根据当前用户id和点赞状态为条件查询user_post表，拿到所有被该用户点赞的帖子的id
    List<Integer> getGooded(int userId);

    //根据用户的id和文章id，将该文章的点赞状态设为1
    void addGoodById(int userId, int postId);

    //根据用户的id和文章id，将该文章的点赞状态设为0
    void deleteGood(int userId, int postId);

    //管理员通过文章关键字，分页查询获得文章
    PageInfo<Post> getPostByPagePostName(Integer currentPage, Integer pageSize, String flag);

    //管理员通过 文章关键字·文章状态，分页查询获得文章
    PageInfo<Post> getPostByPageCondition(Integer currentPage, Integer pageSize, String flag, int postOption);

    //获得所有已经被审核通过的文章
    List<Post> getAllPostByStatus();

    //获取到该文章的所有评论
    List<Comment> getAllCommentByPostId(int postId);

    //判断当前用户与该评论是否存在联系
    Comment_User getComment_User(int userId, int commentId);

    //接下来将该文章的收藏状态设为0
    void deleteStar(int userId, int postId);

    //将收藏状态设为1
    void addStarById(int userId, int postId);

    //根据文章分类查询
    List<Post> getPostByPostCategoryId(int postCategoryId);

    //用户根据关键词搜索
    List<Post> getPostByKeyword(String keyword);

    //根据当前用户id拿到所有收藏的文章id
    List<Integer> getStarPostId(int userId);
}
