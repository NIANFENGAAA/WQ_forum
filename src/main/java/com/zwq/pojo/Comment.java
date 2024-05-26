package com.zwq.pojo;

import lombok.*;

import java.sql.Timestamp;

@Data
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Comment {
    private int comment_id;
    private int commenter_id;
    private int post_id;
    private String comment_content;
    private Timestamp comment_time;
    private int comment_good;


}
