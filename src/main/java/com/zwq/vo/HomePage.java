package com.zwq.vo;

import com.zwq.pojo.Post;
import com.zwq.pojo.User;
import com.zwq.pojo.UserFans;
import lombok.*;

import java.util.List;

@Data
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class HomePage {
    //个人主页的当前用户的文章
    private List<IndexPost> postList;
    //当前用户的关注列表
    private List<User> userList;
    //当前用户点赞的文章列表
    private List<IndexPost> goodPostList;
    //粉丝列表
    private List<User> fansList;
    //当前主页用户信息
    private User user;

}
