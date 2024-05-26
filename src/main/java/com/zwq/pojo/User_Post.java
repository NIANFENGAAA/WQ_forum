package com.zwq.pojo;

import lombok.*;

@Data
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class User_Post {
    private int user_id;
    private int post_id;
    private int good;
    private int star;
}
