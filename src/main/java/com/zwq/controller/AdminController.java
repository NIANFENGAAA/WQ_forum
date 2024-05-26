package com.zwq.controller;

import com.github.pagehelper.PageInfo;
import com.zwq.pojo.Admin;
import com.zwq.pojo.Announcement;
import com.zwq.pojo.Post;
import com.zwq.pojo.User;
import com.zwq.result.Result;
import com.zwq.service.AdminService;
import com.zwq.service.PostCategoryService;
import com.zwq.service.PostService;
import com.zwq.service.UserService;
import com.zwq.utils.TimeToBeijing;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.sql.Timestamp;
import java.util.List;

@Controller
@Slf4j
public class AdminController {
    @Autowired
    @Qualifier("AdminServiceImpl")
    private AdminService adminService;

    @Autowired
    @Qualifier("PostCategoryServiceImpl")
    private PostCategoryService postCategoryService;

    @Autowired
    @Qualifier("PostServiceImpl")
    private PostService postService;

    @Autowired
    @Qualifier("UserServiceImpl")
    private UserService userService;

    //跳转管理员登录页面
    @RequestMapping("goAdminLogin")
    public String goAdminLogin(){
        return "adminLogin";
    }

    //跳转用户管理页面
    @RequestMapping("goAdminIndex")
    public String goAdminIndex(){return "adminIndex";}

    //跳转文章管理页面
    @RequestMapping("/admin/goAdminPost")
    public String goAdminPost(){return "adminPost";}

    //管理员登录
    @RequestMapping("admin/login")
    public String adminLogin(String username, String password, HttpSession session){
        log.info("管理员正在尝试登录......");
        log.info("管理员账号：{}，密码：{}",username,password);
        Admin admin = new Admin(username,password);
        //通过实体类Admin在Admin表中查看是否存在
        if (adminService.getAdmin(admin) == null){
            //账号或密码错误，管理员账号不存在
            session.setAttribute("adminLoginMSg","账号或密码错误！");
            return "adminLogin";
        }
        log.info("管理员{}登录成功！",admin.getUsername());
        session.setAttribute("adminLoginSuc","登陆成功！");
        return "adminLogin";
    }

    //管理员获取所有的用户
    @RequestMapping("/admin/getAllUser")
    public String getAllUser(HttpSession session){
        log.info("管理员获取所有的用户......");

        //分页查询
        PageInfo<User> pageInfo = adminService.queryAllUserByPage(1, 6);
        session.setAttribute("pageInfo",pageInfo);

//        List<User> allUser = userService.getAllUser();
//        session.setAttribute("adminAllUser",allUser);
        return "adminIndex";
    }

    //根据查询条件来获得符合条件的用户
    @RequestMapping("/admin/getUserByUS")
    public String getUserByUS(@RequestParam(value = "username",required = false) String username,
                              @RequestParam(value = "optionValue",required = false) int status,
                              HttpSession session){
        log.info("根据查询条件来获得符合条件的用户,条件为：{},{}......",username,status);
        if (session.getAttribute("pageInfo") != null){
            session.removeAttribute("pageInfo");
        }
        String flag = "";
        if (username == null){
            flag = "%%";
        }else {
            flag = "%" + username + "%";
        }

        if (status == -1){
            //查询全部状态用户
            PageInfo<User> userPageInfo = userService.getUSerByPageName(1, 6, flag);
            session.setAttribute("pageInfo",userPageInfo);
        }else {
            PageInfo<User> pageInfo = userService.getUSerByCondition(1, 6, flag, status);
            session.setAttribute("pageInfo",pageInfo);
        }
        return "adminIndex";
    }

    //管理员分页查询获得文章
    @RequestMapping("admin/getPostByPage")
    public String getPostByPage(@RequestParam(value = "postname",defaultValue = "") String postName,
                                @RequestParam(value = "postOption",defaultValue = "-1") int postOption,
                                @RequestParam(value = "currentPage",required = false,defaultValue = "1") int currentPage,
                                HttpSession session){
        log.info("管理员分页查询获得文章,查询条件为：文章名称为：{}，文章章台为：{},当前查询的页数：{}",postName,postOption,currentPage);

        if (session.getAttribute("postPageInfo") != null){
            session.removeAttribute("postPageInfo");
        }
        String flag = "";
        if (postName == null){
            flag = "%%";
        }else {
            flag = "%" + postName + "%";
        }

        if (postOption == -1){
            PageInfo<Post> postPageInfo = postService.getPostByPagePostName(currentPage, 6, flag);
            session.setAttribute("postPageInfo",postPageInfo);
        }else {
            PageInfo<Post> postPageInfo = postService.getPostByPageCondition(currentPage, 6, flag, postOption);
            session.setAttribute("postPageInfo",postPageInfo);
        }
        return "adminPost";
    }

    //管理员启用用户账号
    @RequestMapping("admin/userOpen")
    public Result userOpen(@RequestParam("userId")int userId){
        log.info("管理员启用用户账号,用户账号id为：{}",userId);
        adminService.updateUserStatus(userId,1);
        return Result.success();
    }

    //管理员禁用用户账号
    @RequestMapping("admin/userClose")
    public Result userClose(@RequestParam("userId")int userId){
        log.info("管理员禁用用户账号,用户账号id为：{}",userId);
        adminService.updateUserStatus(userId,0);
        return Result.success();
    }

    //管理员删除用户账号
    @RequestMapping("admin/userDelete")
    public Result userDelete(@RequestParam("userId") int userId){
        log.info("管理员删除用户账号,用户账号id为：{}",userId);
        adminService.userDelete(userId);
        return Result.success();
    }

    //管理员审核文章通过
    @GetMapping("admin/postOpen")
    @ResponseBody
    public Result postOpen(@RequestParam("postId") int postId){
        log.info("管理员审核文章通过,文章id为：{}",postId);
        adminService.updatePostStatus(postId,1);
        return Result.success();
    }

    //管理员修改文章未通过
    @GetMapping("admin/postClose")
    @ResponseBody
    public Result postClose(@RequestParam("postId") int postId){
        log.info("管理员修改文章未通过,文章id为：{}",postId);
        adminService.updatePostStatus(postId,0);
        return Result.success();
    }

    //管理员删除文章
    @GetMapping("admin/postDelete")
    @ResponseBody
    public Result postDelete(@RequestParam("postId") int postId){
        log.info("管理员删除文章,文章id为：{}",postId);
        //先将user-post表中的该文章的有关信息全部删除
        adminService.deleteUser_PostByPostId(postId);
        //在post表中删除该文章的有关信息
        adminService.postDelete(postId);
        return Result.success();
    }

    //管理员更新网站公告
    @GetMapping("admin/updateAnnounce")
    @ResponseBody
    public Result updateAnnounce(@RequestParam("textContent") String textContent,
                                 HttpSession session){
        log.info("管理员更新网站公告......");
        Announcement presentAnnounce = (Announcement) session.getAttribute("presentAnnounce");
        presentAnnounce.setCreate_time(new Timestamp(System.currentTimeMillis()));
        presentAnnounce.setContent(textContent);

        adminService.updateAnnounce(presentAnnounce);

        session.removeAttribute("presentAnnounce");
        session.setAttribute("presentAnnounce",presentAnnounce);
        return Result.success();
    }

}
