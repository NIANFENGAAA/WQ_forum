package com.zwq.vo;

import com.zwq.pojo.Comment;
import com.zwq.pojo.User;
import lombok.*;

import java.sql.Timestamp;
import java.util.List;

@Data
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class PostDetail {
    private int post_id;
    private String post_title;
    private String post_content;
    private Timestamp post_create_time;
    private int view_volume;
    private User user;
    private int post_quantity;
    private int fans_quantity;
    private boolean fans_status;
    //文章的点赞状态
    private boolean good_status;
    //文章的收藏状态
    private boolean star_status;
    //该文章的评论列表
    private List<NewComment> commentList;
 }
