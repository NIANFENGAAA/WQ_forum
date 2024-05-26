package com.zwq.controller;


import com.zwq.pojo.Comment;
import com.zwq.pojo.Post;
import com.zwq.pojo.User;
import com.zwq.result.Result;
import com.zwq.service.UserService;
import com.zwq.utils.HtmlToText;
import com.zwq.utils.MD5Util;
import com.zwq.vo.HomePage;
import com.zwq.vo.IndexPost;
import lombok.extern.slf4j.Slf4j;
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
public class UserController {

    @Autowired
    @Qualifier("UserServiceImpl")
    private UserService userService;


    //跳转登陆注册页面
    @RequestMapping("goRegister")
    public String goRegister(){
        return "register";
    }


    //跳转用户个人资料页面
    @RequestMapping("goUserData")
    public String goUserData(){
        return "userData";
    }

    //跳转用户个人中心页面
    @RequestMapping("goUserDetail")
    public String goUserDetail(){
        return "userDetail";
    }

    //跳转用户账号修改
    @RequestMapping("goUserUpdateAccount")
    public String goUserUpdateAccount(){return "userUpdateAccount";}

    //用户注册
    @PostMapping("/user/register")
    public String userRegister(@RequestParam(value = "email") String email,
                               @RequestParam(value = "username") String username,
                               @RequestParam(value = "password1") String password1,
                               @RequestParam(value = "password2") String password2,
                               HttpSession session){
        if (!password1.equals(password2)){
            session.setAttribute("registerMsg1","两次密码不一致");
            return "register";
        }

        User user = new User();
        user.setEmail(email);
        user.setUsername(username);
        user.setPassword(password1);

        if (userService.userRegisterByName(user) != null){
            session.setAttribute("registerMsg2","用户名太受欢迎了，请换一个吧！");
            return "register";
        }

        if(userService.userRegisterByEmail(user) != null){
            session.setAttribute("registerMsg3","该用户已注册，去登录吧！");
            return "register";
        }


        userService.addUser(user);

        return "register";

    }

    //用户登录
    @PostMapping("/user/login")
//    @ResponseBody
    public String userLogin(@RequestParam(value = "email") String email,
                            @RequestParam(value = "password") String password,
                            HttpSession session){
        User user = new User();
        user.setEmail(email);
        user.setPassword(MD5Util.encryptMD5(password));

        User flag = userService.userLogin(user);
        if (flag == null){
            session.setAttribute("msgLogin","用户名或密码错误！");
            System.out.println("登录失败！");
            return "register";
        }else {
            //判断用户状态是否禁用
            if (flag.getStatus() == 1){
                //用户处于可用状态
                session.setAttribute("presentUser",flag);
                log.info("登录成功，当前用户为：{}",flag);
                session.setAttribute("loginSuccess","登录成功！");
                return "register";
            }else {
                //用户被禁用
                session.setAttribute("UserLoginMsg","当前用户已被冻结！");
                return "register";
            }


        }

    }

    //修改用户信息
    @PostMapping("/user/update")
    @ResponseBody
    public Result update(@RequestBody User user,HttpSession session){
        log.info("修改用户信息");
        User presentUser = (User) session.getAttribute("presentUser");
        log.info("当前用户id：{}",presentUser.getId());
        log.info("需要修改的用户信息为：{}",user);
        //将原来的信息修改为新的信息
        if (user.getCompany() != null)
            presentUser.setCompany(user.getCompany());
        if (user.getUsername() != null)
            presentUser.setUsername(user.getUsername());
        if (user.getIntroduction() != null)
            presentUser.setIntroduction(user.getIntroduction());
        if (user.getPassword() != null)
            //先进行MD5加密
            presentUser.setPassword(MD5Util.encryptMD5(user.getPassword()));
        if (user.getPhone() != null)
            presentUser.setPhone(user.getPhone());
        //将新的信息在表中修改
        boolean flag = userService.updateUser(presentUser);
        //判断修改结果
        if (flag){
            //修改成功，更新session的presentUser信息
            session.setAttribute("presentUser",presentUser);
            return Result.success("修改成功！");
        }else
            //修改失败
            return Result.error("修改失败！");

    }

    //上传图片
    @RequestMapping("/user/upload")
    public String createFile(MultipartFile file,HttpSession session) {
        // 获取文件名
        String fileName = file.getOriginalFilename();
        String type = fileName.substring(fileName.lastIndexOf("."));
        long size = file.getSize();
        String path = "D:\\IDEA_UI_CODE\\Project\\ssm整合测试\\test01\\src\\main\\webapp\\avatar";
        log.info("文件类型：{}", type);
        log.info("原来的文件名为：{}", fileName);
        log.info("文件大小为：{}", size);
        String newFileName = UUID.randomUUID() + fileName;
        // 重命名，避免文件名重复
        File newFile = new File(path, newFileName);

        if (size > 500000 * 1024) {
            session.setAttribute("userUpload","文件太大，无法上传！");
            return "userData";
        } else if (type.equalsIgnoreCase(".png") ||
                type.equalsIgnoreCase(".jpg") ||
                type.equalsIgnoreCase(".jpeg")) {
            File file1 = new File(new File(path), newFileName);
            //不存在创建
            if (!file1.exists()) {
                file1.mkdirs();
            }
            try {
                //把文件写入磁盘
                file.transferTo(file1);
            } catch (Exception e) {
                e.printStackTrace();
                session.setAttribute("userUpload2","图片上传失败！");
                return "userData";
            }

        } else {
            session.setAttribute("userUpload3","不支持上传该类型！");
            return "userData";
        }

        User presentUser = (User) session.getAttribute("presentUser");
        log.info("当前用户为：{}",presentUser);
        //将头像名称存在用户的img中
        presentUser.setImg(newFileName);
        boolean flag = userService.updateUser(presentUser);
        if (!flag)
            log.info("图片进行数据库操作失败！");
        log.info("上传成功！");
        session.setAttribute("userUpload4","图片上传成功！");
        return "userData";
    }

    //用户退出
    @RequestMapping("/user/quit")
    public String userQuit(HttpSession session){
        log.info("执行用户退出功能");
        User presentUser = (User) session.getAttribute("presentUser");
        log.info("当前需要退出的用户为：{}",presentUser);
        session.removeAttribute("presentUser");
        return "register";
    }

    //用户注销
    @RequestMapping("/user/destruction")
    public String userDestruction(HttpSession session){
        log.info("用户注销功能...");
        User presentUser = (User) session.getAttribute("presentUser");
        log.info("需要注销的用户为：{}",presentUser);
        boolean flag = userService.destruction(presentUser);
        log.info("用户是否注销：{}",flag);

        return "register";
    }

    //用户取消关注
    @GetMapping("/user/cancelFollow")
    @ResponseBody
    public Result cancelFollow(@RequestParam("param1") int userId, HttpSession session){
        log.info("用户取消关注功能......");
        //用户取消关注功能也就是通过当前用户id和被取消的用户id，删除两者在user-user表中
        User presentUser = (User) session.getAttribute("presentUser");
        userService.deleteUser_User(presentUser.getId(), userId);
        return Result.success();
    }

    //用户关注
    @GetMapping("/user/addFollow")
    @ResponseBody
    public Result addFollow(@RequestParam("param1") int userId, HttpSession session){
        log.info("用户关注功能......");
        //用户关注功能也就是通过当前用户id和被关注的用户id，增加两者在user-user表中
        User presentUser = (User) session.getAttribute("presentUser");
        userService.addUser_User(presentUser.getId(),userId);
        return Result.success();
    }

    //用户正在进行添加评论操作
    @GetMapping("/user/addComment")
    @ResponseBody
    public Result addComment(@RequestParam("commentContent") String commentContent,
                             @RequestParam("presentPostId") int presentPostId,
                             HttpSession session){
        log.info("用户正在进行添加评论操作......");
        User presentUser = (User) session.getAttribute("presentUser");
        log.info("评论者id：{},文章id：{},评论内容为：{}",presentUser.getId(),presentPostId,commentContent);

        Comment comment = new Comment();
        comment.setCommenter_id(presentUser.getId());
        comment.setPost_id(presentPostId);
        comment.setComment_content(commentContent);

        userService.addComment(comment);

        return Result.success();

    }

}
