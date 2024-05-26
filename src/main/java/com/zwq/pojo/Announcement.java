package com.zwq.pojo;

import lombok.*;

import java.sql.Timestamp;

@Data
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Announcement {
    private int id;
    private Timestamp create_time;
    private String content;
}
