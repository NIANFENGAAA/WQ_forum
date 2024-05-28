package com.zwq.vo;

import com.zwq.pojo.Comment;
import com.zwq.pojo.Report;
import lombok.*;

@Data
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class ReportVo {
    private Comment comment;
    private Report report;
}
