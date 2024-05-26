package com.zwq.controller;

import com.zwq.pojo.*;
import com.zwq.service.AdminService;
import com.zwq.service.PostCategoryService;
import com.zwq.service.PostService;
import com.zwq.service.UserService;
import com.zwq.utils.HtmlToText;
import com.zwq.vo.HomePage;
import com.zwq.vo.IndexPost;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

import static org.apache.taglibs.standard.functions.Functions.substring;

@Controller
@Slf4j
public class VoController {
    @Autowired
    @Qualifier("PostCategoryServiceImpl")
    private PostCategoryService postCategoryService;

    @Autowired
    @Qualifier("PostServiceImpl")
    private PostService postService;

    @Autowired
    @Qualifier("UserServiceImpl")
    private UserService userService;

    @Autowired
    @Qualifier("AdminServiceImpl")
    private AdminService adminService;

    //跳转首页,并且进行首页的数据加载
    @RequestMapping("goIndex")
    public String goIndex(HttpSession session) {
        //获得所有帖子的所有种类
        log.info("获取所有帖子的所有种类中...");
        List<Category> allPostCategory = postCategoryService.getAllPostCategory();
        session.setAttribute("allPostCategory", allPostCategory);
        log.info("获得所有帖子的所有种类...{}", allPostCategory);

        //获得所有已经被审核通过的文章，并且进行处理作为首页数据展示
        log.info("获得所有已经被审核通过的文章......");
        List<Post> allPostByStatus = postService.getAllPostByStatus();
        log.info("查询到的文章数量为：{}", allPostByStatus.size());

        User presentUser = (User) session.getAttribute("presentUser");


        List<IndexPost> indexPostList = new ArrayList<>();

        for (Post post : allPostByStatus) {
            IndexPost indexPost = new IndexPost();

            indexPost.setPost_id(post.getPost_id());
            indexPost.setPost_title(post.getPost_title());
            //对文章内容展示进行处理
            HtmlToText htmlToText = new HtmlToText();
            String text = htmlToText.toText(post.getPost_content());
            String s = text.substring(0, Math.min(60, text.length())) + "...";

            indexPost.setPost_content(s);

            indexPost.setUserName(userService.getUserById(post.getUser_id()).getUsername());
            indexPost.setView(post.getView_volume());
            //设置点赞数量
            int goodQuality = postService.getGoodQuality(post.getPost_id());
            indexPost.setGoodQuantity(goodQuality);


            //设置点赞状态
            if (presentUser != null) {
                //用户已经登录
                //设置点赞状态
                //根据文章id和当前用户id判断两者的关系是否已经存在user_post表中
                if (postService.isNull(post.getPost_id(), presentUser.getId()) == null) {
                    //不存在
                    //将该关系插入表中,改在点赞时插入
                    /*postService.addUser_Post(post.getPost_id(), presentUser.getId());*/
                    indexPost.setGood(false);
                }

                User_Post userPost = postService.getGoodStatus(post.getPost_id(), presentUser.getId());

                if (userPost == null)
                    indexPost.setGood(false);

                if (userPost != null && userPost.getGood() == 1) {
                    //已点赞
                    indexPost.setGood(true);
                }else {
                    //未点赞
                    indexPost.setGood(false);
                }
            } else {
                ///用户尚未登录
                indexPost.setGood(false);
            }

            //设置文章观看数量
            indexPost.setView(postService.getPostById(post.getPost_id()).getView_volume());

            //加入集合中
            indexPostList.add(indexPost);

            //网站公告预加载
            //找到一个状态为1的公告
            Announcement presentAnnounce = adminService.getAnnounceByStatus();
            //设置当前需要展示的公告
            session.setAttribute("presentAnnounce",presentAnnounce);
        }

        log.info("首页需要展示的文章集合数量为：{}", indexPostList.size());
        session.setAttribute("indexPostList", indexPostList);

        return "index";
    }


    //跳转到个人主页
    @RequestMapping("goUserHomepage")
    public String goUserHomepage(int userId, HttpSession session) {
        log.info("加载个人主页相关资料...");
        log.info("当前用户个人主页id为:{}",userId);

        User presentUser = (User) session.getAttribute("presentUser");

        HomePage homePage = new HomePage();

        //获取当前用户自己的文章
        List<Post> postByUser = postService.getPostByUserId(userId);
        List<IndexPost> myPost = new ArrayList<>();
        for (Post post : postByUser) {
            IndexPost indexPost = new IndexPost();
            indexPost.setPost_id(post.getPost_id());
            indexPost.setPost_title(post.getPost_title());
            //对文章内容展示进行处理
            HtmlToText htmlToText = new HtmlToText();
            String text = htmlToText.toText(post.getPost_content());
            String s = text.substring(0, Math.min(60, text.length())) + "...";

            indexPost.setPost_content(s);

            indexPost.setUserName(userService.getUserById(post.getUser_id()).getUsername());
            indexPost.setView(post.getView_volume());
            //设置点赞数量
            int goodQuality = postService.getGoodQuality(post.getPost_id());
            indexPost.setGoodQuantity(goodQuality);
            //自己的文章不准点赞，未点赞
            indexPost.setGood(false);

            myPost.add(indexPost);
        }
        //将要展示的文章进行处理后存到homePage里在前端页面进行展示
        homePage.setPostList(myPost);

        //获取用户的关注列表
        //先根据当前用户id获取该用户关注的所有用户的id
        List<Integer> concernedIdList = userService.getconcernedIdList(userId);
        //根据被关注者的id获取该用户的信息,并进行处理
        List<User> concernedUser = new ArrayList<>();
        for (Integer i : concernedIdList) {
            //得到每一个用户
            User user = userService.getUserById(i);
            concernedUser.add(user);
        }
        //将要展示的被关注的所有人存到homePage里在前端页面进行展示
        homePage.setUserList(concernedUser);

        //获取用户点赞的文章列表
        //1.先根据当前用户id和点赞状态为条件查询user_post表，拿到所有被该用户点赞的帖子的id
        List<Integer> idList = postService.getGooded(userId);
        //2.根据文章id拿到每一个文章
        List<Post> likedPost = new ArrayList<>();
        List<IndexPost> newLikedPost = new ArrayList<>();
        //拿到所有点赞的文章
        for (Integer i : idList) {
            Post post = postService.getPostById(i);
            likedPost.add(post);
        }
        for (Post post : likedPost) {
            IndexPost indexPost = new IndexPost();
            indexPost.setPost_id(post.getPost_id());
            indexPost.setPost_title(post.getPost_title());
            //对文章内容展示进行处理
            HtmlToText htmlToText = new HtmlToText();
            String text = htmlToText.toText(post.getPost_content());
            String s = text.substring(0, Math.min(60, text.length())) + "...";

            indexPost.setPost_content(s);

            indexPost.setUserName(userService.getUserById(post.getUser_id()).getUsername());
            indexPost.setView(post.getView_volume());
            //设置点赞数量
            int goodQuality = postService.getGoodQuality(post.getPost_id());
            indexPost.setGoodQuantity(goodQuality);
            //获取的所有文章都已经点赞
            indexPost.setGood(true);

            newLikedPost.add(indexPost);
        }
        //用户所有点赞文章已加入前端展示的实体类中
        homePage.setGoodPostList(newLikedPost);

        //获取用户的粉丝列表
        //1.首先根据该用户的id来获得所有关注该用户的人的id
        List<Integer> fansIdList = userService.getFansIdList(userId);
        //2.根据粉丝的id拿到所有粉丝用户
        List<User> fans = new ArrayList<>();
        for (Integer i : fansIdList) {
            User user = userService.getUserById(i);
            fans.add(user);
        }
        homePage.setFansList(fans);

        //根据当前用户id拿到该用户
        User user = userService.getUserById(userId);
        homePage.setUser(user);

        session.setAttribute("HomePage", homePage);


        return "userHomepage";
    }


}
