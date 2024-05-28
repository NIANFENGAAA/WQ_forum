package com.zwq.controller;

import com.zwq.pojo.Report;
import com.zwq.pojo.User;
import com.zwq.result.Result;
import com.zwq.service.CommentService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

@Controller
@Slf4j
public class CommentController {
    @Autowired
    @Qualifier("CommentServiceImpl")
    private CommentService commentService;

    //当前用户给评论点赞
    @GetMapping("/user/addGoodComment")
    @ResponseBody
    public Result addGoodComment(@RequestParam("commentId") int commentId,
                                 HttpSession session) {
        log.info("当前用户给评论点赞");
        User presentUser = (User) session.getAttribute("presentUser");
        //先将当前用户id和评论id加入到表comment_user中
        commentService.insertComment_user(presentUser.getId(), commentId);
        //再将comment表中的点赞数量加一
        commentService.addCommentGood(commentId);
        return Result.success();
    }

    //当前用户给评论取消点赞
    @GetMapping("/user/deleteGoodComment")
    @ResponseBody
    public Result deleteGoodComment(@RequestParam("commentId") int commentId,
                                    HttpSession session) {
        log.info("当前用户给评论取消点赞");
        User presentUser = (User) session.getAttribute("presentUser");
        //先将当前用户id和评论id在表comment_user中的数据删除
        commentService.deleteComment_user(presentUser.getId(), commentId);
        //再将comment表中的点赞数量减一
        commentService.deleteCommentGood(commentId);
        return Result.success();
    }

    //用户举报评论功能
    @PostMapping("submitReportComment")
    @ResponseBody
    public Result submitReportComment(@RequestBody Report report,HttpSession session) {
        log.info("用户举报评论功能......");
        log.info("接收到的举报评论的数据为：{}",report);
        //将前端传来的数据封装为实体
        report.setComment_id((Integer) session.getAttribute("presentReportCommentId"));
        //将其插入表中
        commentService.insertToReport(report);
        return Result.success();
    }

    //跳转举报评论页面
    @RequestMapping("goCommentReport")
    public String goCommentReport(int commentId,HttpSession session){
        log.info("被举报的评论id为：{}",commentId);
        if (session.getAttribute("presentReportCommentId") != null)
            session.removeAttribute("presentReportCommentId");
        session.setAttribute("presentReportCommentId",commentId);
        return "commentReport";
    }
}
