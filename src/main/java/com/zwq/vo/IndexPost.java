package com.zwq.vo;

import lombok.*;

@Data
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class IndexPost {
    private int post_id;
    private String post_title;
    private String post_content;
    private String userName;
    private int view;
    //点赞的数量
    private int goodQuantity;
    //判断是否点赞
    private boolean isGood;
}
