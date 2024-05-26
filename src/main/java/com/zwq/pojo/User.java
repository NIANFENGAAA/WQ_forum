package com.zwq.pojo;

import lombok.*;

@Data
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class User {
    private int id;
    private String username;
    private String password;
    private String email;
    private String phone;
    private String company;
    private String introduction;
    private String img;
    private int status;
}
