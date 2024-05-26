package com.zwq.service;

import com.github.pagehelper.PageInfo;
import com.zwq.pojo.Comment;
import com.zwq.pojo.User;
import com.zwq.pojo.User_User;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Service
public interface UserService {
    User userLogin(User user);

    User userRegisterByEmail(User user);

    User userRegisterByName(User user);

    boolean addUser(User user);

    //根据传来的user类来查找并修改用户信息
    boolean updateUser(User user);

    //注销用户
    boolean destruction(User presentUser);

    //根据用户id找到该用户并且返回
    User getUserById(int id);

    int getFansQuantity(int userId);

    //根据当前用户id获取该用户关注的所有用户的id
    List<Integer> getconcernedIdList(int userId);

    //根据该用户的id来获得所有关注该用户的人的id
    List<Integer> getFansIdList(int userId);

    //根据文章作者id和当前用户id，先判断两者之间的关系是否已经存在user-user表中
    User_User existUser_User(int fansId, int userId);

    //user-user表中不存在两者的关系，需要先插入表中
    void addUser_User(int fansId, int userId);

    //通过当前用户id和被取消的用户id，删除两者在user-user表中
    void deleteUser_User(int fansId, int userId);

    //获取所有的用户
    List<User> getAllUser();

    //根据查询条件来获得符合条件的用户,并进行分页处理
    PageInfo<User> getUSerByCondition(Integer currentPage, Integer pageSize,String username, int status);

    ////查询全部状态用户,并进行分页处理
    PageInfo<User> getUSerByPageName(Integer currentPage, Integer pageSize, String flag);

    //用户正在进行添加评论操作
    void addComment(Comment comment);
}
