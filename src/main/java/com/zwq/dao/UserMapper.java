package com.zwq.dao;

import com.zwq.pojo.Comment;
import com.zwq.pojo.User;
import com.zwq.pojo.User_User;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface UserMapper {

    User getUserByLogin(User user);

    User userRegisterByEmail(User user);

    User userRegisterByName(User user);


    boolean addUser(User user);

    boolean updateUser(User user);

    boolean destruction(User presentUser);
    @Select("select * from bbs.user where id = #{id}")
    User getUserById(int id);

    @Select("select count(*) from bbs.user_user where concerned_id = #{userId}")
    int getFansQuantity(int userId);

    List<Integer> getconcernedIdList(int userId);

    List<Integer> getFansIdList(int userId);

    User_User existUser_User(@Param("fansId") int fansId, @Param("userId")int userId);

    void addUser_User(@Param("fansId") int fansId, @Param("userId")int userId);

    void deleteUser_User(@Param("fansId") int fansId, @Param("userId")int userId);

    @Select("select * from bbs.user")
    List<User> getAllUser();

    List<User> getUSerByCondition(@Param("username")String username, @Param("status")int status);

    List<User> getUSerByPageName(String flag);

    void addComment(Comment comment);
}
