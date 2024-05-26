package com.zwq.dao;

import com.zwq.pojo.Comment;
import com.zwq.pojo.Comment_User;
import com.zwq.pojo.Post;
import com.zwq.pojo.User_Post;
import com.zwq.vo.NewComment;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface PostMapper {
    List<Post> getAllPost();

    Boolean addPost(Post newPost);

    Post getPostById(@Param("postId") int postId);

    int getGoodQuality(@Param("postId") int postId);

    User_Post getGoodStatus(@Param("postId")int postId, @Param("userId")int userId);

    void addView(int postId);

    int getPostQuantity(int userId);

    User_Post isNull(@Param("postId") int postId, @Param("userId")int userId);

    @Insert("insert into bbs.user_post(post_id, user_id) VALUES (#{postId}, #{userId})")
    void addUser_Post(@Param("postId") int postId, @Param("userId")int userId);

    List<Post> getPostByUserId(int userId);

    List<Integer> getGooded(int userId);

    void addGoodById(@Param("userId")int userId, @Param("postId")int postId);

    void deleteGood(@Param("userId")int userId, @Param("postId")int postId);

    List<Post> getPostByPagePostName(String flag);

    List<Post> getPostByPageCondition(@Param("flag")String flag, @Param("postOption")int postOption);

    List<Post> getAllPostByStatus();

    List<Comment> getAllCommentByPostId(int postId);

    Comment_User getComment_User(@Param("userId")int userId, @Param("commentId")int commentId);

    void deleteStar(@Param("userId")int userId, @Param("postId")int postId);

    void addStarById(@Param("userId")int userId, @Param("postId")int postId);
}
