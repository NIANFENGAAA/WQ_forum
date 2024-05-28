package com.zwq.pojo;

import lombok.*;

@Data
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Report {
    private int report_id;
    private int comment_id;
    private int content_violation;
    private int lack_friendliness;
    private int violate_equity;
    private int other_reasons;
    private  String text;

    public Report(int comment_id, int content_violation, int lack_friendliness, int violate_equity, int other_reasons) {
        this.comment_id = comment_id;
        this.content_violation = content_violation;
        this.lack_friendliness = lack_friendliness;
        this.violate_equity = violate_equity;
        this.other_reasons = other_reasons;
    }

    public Report(int comment_id, int content_violation, int lack_friendliness, int violate_equity, int other_reasons, String text) {
        this.comment_id = comment_id;
        this.content_violation = content_violation;
        this.lack_friendliness = lack_friendliness;
        this.violate_equity = violate_equity;
        this.other_reasons = other_reasons;
        this.text = text;
    }
}
