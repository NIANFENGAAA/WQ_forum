package com.zwq.controller;

import com.zwq.pojo.*;
import com.zwq.result.Result;
import com.zwq.service.PostService;
import com.zwq.service.UserService;
import com.zwq.vo.IndexPost;
import com.zwq.vo.NewComment;
import com.zwq.vo.PostDetail;
import lombok.extern.slf4j.Slf4j;
import org.junit.runners.Parameterized;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Controller
@Slf4j
public class PostController {
    @Autowired
    @Qualifier("PostServiceImpl")
    private PostService postService;

    @Autowired
    @Qualifier("UserServiceImpl")
    private UserService userService;

    //跳转文章内容页面
    @RequestMapping("goPostDetail")
    public String goPostDetail(int postId,HttpSession session){
        log.info("当前postId:{}",postId);

        User presentUser = (User) session.getAttribute("presentUser");

        //观看数量加一
        postService.addView(postId);
        //获取到当前的文章
        Post post = postService.getPostById(postId);

        PostDetail postDetail = new PostDetail();
        postDetail.setPost_id(postId);
        postDetail.setPost_title(post.getPost_title());
        postDetail.setPost_content(post.getPost_content());
        postDetail.setPost_create_time(post.getPost_create_time());
        postDetail.setView_volume(post.getView_volume());
        postDetail.setUser(userService.getUserById(post.getUser_id()));
        //设置作者的文章数量
        postDetail.setPost_quantity(postService.getPostQuantity(post.getUser_id()));
        //设置做的粉丝数量
        postDetail.setFans_quantity(userService.getFansQuantity(post.getUser_id()));

        //设置文章与当前用户的关注关系
        if(presentUser == null){
            //用户还未登录，处于游客状态，直接设置关注状态为false
            postDetail.setFans_status(false);
        }
        //用户已经登录
        //判断当前用户是否是作者的粉丝
        //根据文章作者id和当前用户id，先判断两者之间的关系是否已经存在user-user表中
        User_User user_user = new User_User();
        if (presentUser != null) {
            User_User existUserUser = userService.existUser_User(presentUser.getId(), post.getUser_id());
            if (existUserUser == null){
                //表中不存在两者的关系，表示两者之间不存在关注的关系
                //设置关注状态为false
                postDetail.setFans_status(false);
            }else {
                //表中存在该关系，表明文章作者已经被关注了
                postDetail.setFans_status(true);
            }

        }

        //获取到该文章的所有评论
        List<Comment> commentList = postService.getAllCommentByPostId(postId);
        //创建新的集合接收加工后的评论
        List<NewComment> newCommentList = new ArrayList<>();
        //对获得评论进行加工
        for (Comment comment : commentList) {
            NewComment newComment = new NewComment();

            User commenter = userService.getUserById(comment.getCommenter_id());
            newComment.setUser(commenter);
            //查看当前用户的点赞状态
            if (presentUser == null)//当前处于游客状态，点赞状态设置为false
                newComment.setGoodStatus(false);
            //用户已经登陆，判断当前用户与该评论是否存在联系
            if (presentUser != null) {
                Comment_User commentUser = postService.getComment_User(presentUser.getId(), comment.getComment_id());
                if (commentUser == null)//当前用户与该评论不存在联系
                    newComment.setGoodStatus(false);
                else
                    newComment.setGoodStatus(true);
            }
            newComment.setComment(comment);

            newCommentList.add(newComment);

        }

        postDetail.setCommentList(newCommentList);

        //设置当前用户和当前的文章的点赞和收藏状态
        if (presentUser == null){
            //当前处于游客状态
            postDetail.setGood_status(false);
            postDetail.setStar_status(false);
        }
        if (presentUser != null){
            //判断用户和当前文章在user_post表中是否存在
            User_Post flag = postService.isNull(postId, presentUser.getId());
            if (flag == null){
                //用户和当前文章在user_post表中不存在
                //先将两者关系插入user_post表中
                postService.addUser_Post(postId, presentUser.getId());
                //设置前端展示页面该文章和用户的点赞和收藏状态为false
                postDetail.setGood_status(false);
                postDetail.setStar_status(false);
            }else {
                //用户和当前文章在user_post表中存在
                //直接将获得的数据设置该文章和用户的点赞和收藏状态
                postDetail.setGood_status(flag.getGood() == 1);
                postDetail.setStar_status(flag.getStar() == 1);
            }
        }

        session.setAttribute("presentPost",postDetail);
        log.info("当前正在观看的文章id为：{}",postDetail.getPost_id());
        return "postDetail";
    }

    //跳转发文章页面
    @RequestMapping("goWritePost")
    public String goWritePost(){
        return "writePost";
    }

    //直接获得所有帖子
    @RequestMapping("getAllPost")
    public String getAllPost(HttpSession session){
        log.info("直接获得所有帖子...");
        List<Post> allPost = postService.getAllPost();
        session.setAttribute("allPost",allPost);
        log.info("所有帖子存到session中{}",allPost);
        return "index";
    }

    //获得用户写的文章（不包含图片）
    @PostMapping("/addPost")
    @ResponseBody
    public Result addPost(@RequestBody Post post,
                          HttpSession session){
        User presentUser = (User) session.getAttribute("presentUser");
        log.info("用户：{}，正在进行添加文章功能...",presentUser.getUsername());

        Post newPost = new Post();
        newPost.setPost_category_id(post.getPost_category_id());
        newPost.setPost_title(post.getPost_title());
        newPost.setPost_content(post.getPost_content());
        newPost.setUser_id(presentUser.getId());

        log.info("文章标题为：{}",post.getPost_title());
        log.info("文章内容为为：{}",post.getPost_content());

//        将文章加入数据库中
        Boolean flag = postService.addPost(newPost);

        if (!flag)
            return Result.error("文章添加失败，请稍后再试！");
        return Result.success();
    }

    //文章点赞功能
    @GetMapping("/post/updateGood")
    @ResponseBody
    public Result updateGood(@RequestParam("param1") int postId, @RequestParam("param2") boolean good, HttpSession session){
        User presentUser = (User) session.getAttribute("presentUser");
        log.info("文章点赞功能......当前文章id为：{}",postId);
        log.info("当前文章点赞状态为：{}",good);
        //判断该用户的点赞状态
        if (good){
            //该用户已经点赞，表明该关系已经存在表中，接下来将该文章的点赞状态设为0
            postService.deleteGood(presentUser.getId(),postId);
        }else{
            //未点赞，判断该关系是否存在表中
            if (postService.isNull(postId, presentUser.getId()) == null){
                //不存在，需要将该关系插入表中,此时点赞状态为0
                postService.addUser_Post(postId, presentUser.getId());
            }
            //将点赞状态设为1
            postService.addGoodById(presentUser.getId(),postId);
        }
        return Result.success();
    }

    //文章收藏功能
    @GetMapping("/post/updateStar")
    @ResponseBody
    public Result updateStar(@RequestParam("postId") int postId, @RequestParam("star") boolean star, HttpSession session){
        User presentUser = (User) session.getAttribute("presentUser");
        log.info("文章收藏功能......当前文章id为：{}",postId);
        log.info("当前文章收藏状态为：{}",star);
        //判断该用户的收藏状态
        if (star){
            //该用户已经收藏，表明该关系已经存在表中，接下来将该文章的收藏状态设为0
            postService.deleteStar(presentUser.getId(),postId);
        }else{
            //未收藏，判断该关系是否存在表中
            if (postService.isNull(postId, presentUser.getId()) == null){
                //不存在，需要将该关系插入表中,此时收藏状态为0
                postService.addUser_Post(postId, presentUser.getId());
            }
            //将收藏状态设为1
            postService.addStarById(presentUser.getId(),postId);
        }

        return Result.success();

    }



}
