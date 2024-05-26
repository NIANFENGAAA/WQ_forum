package com.zwq.pojo;

import lombok.*;

import java.sql.Timestamp;

@Data
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Post {
    private int post_id;
    private int user_id;
    private int post_category_id;
    private String post_title;
    private String post_content;
    private Timestamp post_create_time;
    private int view_volume;
    private int status;
}
