package com.zwq.vo;

import com.zwq.pojo.Comment;
import com.zwq.pojo.User;
import lombok.*;

import java.sql.Timestamp;

@Data
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class NewComment {
    //设置评论者的信息
    private User user;
    //当前用户对于该文章的点赞状态
    private boolean goodStatus;

    private Comment comment;

}
