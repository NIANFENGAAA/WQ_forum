package com.zwq.pojo;

import lombok.*;

@Data
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class UserFans {
    private User user;
    private int fansStatus;
}
