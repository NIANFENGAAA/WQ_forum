<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="v-model" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="content-type" content="text/html; charset=utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
    <title>登录注册界面</title>
    <style>
        @import url("//unpkg.com/element-ui@2.15.14/lib/theme-chalk/index.css");
        *{
            /* 初始化 */
            margin: 0;
            padding: 0;
        }
        body{
            /* 100%窗口高度 */
            height: 100vh;
            /* 弹性布局 水平+垂直居中 */
            display: flex;
            justify-content: center;
            align-items: center;
            /* 渐变背景 */
            background: linear-gradient(200deg,#f3e7e9,#e3eeff);
        }
        .container{
            background-color: #fff;
            width: 650px;
            height: 415px;
            border-radius: 5px;
            /* 阴影 */
            box-shadow: 5px 5px 5px rgba(0,0,0,0.1);
            /* 相对定位 */
            position: relative;
        }
        .form-box{
            /* 绝对定位 */
            position: absolute;
            top: -10%;
            left: 5%;
            background-color: #d3b7d8;
            width: 320px;
            height: 500px;
            border-radius: 5px;
            box-shadow: 2px 0 10px rgba(0,0,0,0.1);
            display: flex;
            justify-content: center;
            align-items: center;
            z-index: 2;
            /* 动画过渡 加速后减速 */
            transition: 0.5s ease-in-out;
        }
        .register-box,.login-box{
            /* 弹性布局 垂直排列 */
            display: flex;
            flex-direction: column;
            align-items: center;
            width: 100%;
        }
        .hidden{
            display: none;
            transition: 0.5s;
        }
        h1{
            text-align: center;
            margin-bottom: 25px;
            /* 大写 */
            text-transform: uppercase;
            color: #fff;
            /* 字间距 */
            letter-spacing: 5px;
        }
        input{
            background-color: transparent;
            width: 70%;
            color: #fff;
            border: none;
            /* 下边框样式 */
            border-bottom: 1px solid rgba(255,255,255,0.4);
            padding: 10px 0;
            text-indent: 10px;
            margin: 8px 0;
            font-size: 14px;
            letter-spacing: 2px;
        }
        input::placeholder{
            color: #fff;
        }
        input:focus{
            color: #a262ad;
            outline: none;
            border-bottom: 1px solid #a262ad80;
            transition: 0.5s;
        }
        input:focus::placeholder{
            opacity: 0;
        }
        .form-box button{
            width: 70%;
            margin-top: 35px;
            background-color: #f6f6f6;
            outline: none;
            border-radius: 8px;
            padding: 13px;
            color: #a262ad;
            letter-spacing: 2px;
            border: none;
            cursor: pointer;
        }
        .form-box button:hover{
            background-color: #a262ad;
            color: #f6f6f6;
            transition: background-color 0.5s ease;
        }
        .con-box{
            width: 50%;
            /* 弹性布局 垂直排列 居中 */
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            /* 绝对定位 居中 */
            position: absolute;
            top: 50%;
            transform: translateY(-50%);
        }
        .con-box.left{
            left: -2%;
        }
        .con-box.right{
            right: -2%;
        }
        .con-box h2{
            color: #8e9aaf;
            font-size: 25px;
            font-weight: bold;
            letter-spacing: 3px;
            text-align: center;
            margin-bottom: 4px;
        }
        .con-box p{
            font-size: 12px;
            letter-spacing: 2px;
            color: #8e9aaf;
            text-align: center;
        }
        .con-box span{
            color: #d3b7d8;
        }
        .con-box img{
            width: 150px;
            height: 150px;
            opacity: 0.9;
            margin: 40px 0;
        }
        .con-box button{
            margin-top: 3%;
            background-color: #fff;
            color: #a262ad;
            border: 1px solid #d3b7d8;
            padding: 6px 10px;
            border-radius: 5px;
            letter-spacing: 1px;
            outline: none;
            cursor: pointer;
        }
        .con-box button:hover{
            background-color: #d3b7d8;
            color: #fff;
        }
    </style>
</head>

<c:if test="${!empty sessionScope.registerMsg1}">
    <script>alert("两次密码不一致！")</script>
    <%
        session.removeAttribute("registerMsg1");
    %>
</c:if>

<c:if test="${!empty sessionScope.registerMsg2}">
    <script>alert("用户名太受欢迎了，请换一个吧！")</script>
    <%
        session.removeAttribute("registerMsg2");
    %>
</c:if>

<c:if test="${!empty sessionScope.registerMsg3}">
    <script>alert("该用户已注册，去登录吧！")</script>
    <%
        session.removeAttribute("registerMsg3");
    %>
</c:if>


<c:if test="${!empty sessionScope.msgLogin}">
    <script>alert("用户名或密码错误！")</script>
    <%
        session.removeAttribute("msgLogin");
    %>
</c:if>

<c:if test="${!empty sessionScope.loginSuccess}">
    <script>
        alert("登录成功！");
        window.location.href = "${pageContext.request.contextPath}/goIndex";
    </script>
    <%
        session.removeAttribute("loginSuccess");
    %>
</c:if>

<c:if test="${!empty sessionScope.UserLoginMsg}">
    <script>
        alert("当前用户已被冻结！");
    </script>
    <%
        session.removeAttribute("UserLoginMsg");
    %>
</c:if>


<body>

<script src="//unpkg.com/vue@2/dist/vue.js"></script>
<script src="//unpkg.com/element-ui@2.15.14/lib/index.js"></script>
<script src="../js/axios-0.18.0.js"></script>


<div class="container">
    <div class="form-box">
        <!-- 注册 -->
        <div class="register-box hidden">
            <h1>注册</h1>
            <div>
                <form action="${pageContext.request.contextPath}/user/register" method="post">
                    <input type="email" placeholder="邮箱" name="email">
                    <input type="text" placeholder="用户名" name="username">
                    <input type="password" placeholder="密码" name="password1">
                    <input type="password" placeholder="确认密码" name="password2">
                    &ensp;
                    <button type="submit">注册</button>
                </form>
            </div>

        </div>
        <!-- 登录 -->
        <div class="login-box">
            <h1>登录</h1>
            <form method="post" action="${pageContext.request.contextPath}/user/login">
                <input type="text" placeholder="邮箱" name="email">
                <input type="password" placeholder="密码" name="password">
                &ensp;
                <button type="submit">登录</button>
            </form>

        </div>
    </div>
    <div class="con-box left">
        <h2>欢迎来到<span>WQ论坛</span></h2>
        <p>快来写下你的<span>帖子</span>吧</p>
        <img src="${pageContext.request.contextPath}/imgs/img1.jpeg" alt="">
        <p>已有账号</p>
        <button id="login">去登录</button>
    </div>
    <div class="con-box right">
        <h2>欢迎来到<span>WQ论坛</span></h2>
        <p>快来写下你的<span>帖子</span>吧</p>
        <img src="${pageContext.request.contextPath}/imgs/img1.jpeg" alt="">
        <p><a href="${pageContext.request.contextPath}/goAdminLogin" style="text-decoration: none;">我是管理员？</a></p>
        <p>没有账号？</p>
        <button id="register">去注册</button>
    </div>
</div>
<script>



    // 要操作到的元素
    let login=document.getElementById('login');
    let register=document.getElementById('register');
    let form_box=document.getElementsByClassName('form-box')[0];
    let register_box=document.getElementsByClassName('register-box')[0];
    let login_box=document.getElementsByClassName('login-box')[0];
    // 去注册按钮点击事件
    register.addEventListener('click',()=>{
        form_box.style.transform='translateX(80%)';
        login_box.classList.add('hidden');
        register_box.classList.remove('hidden');
    })
    // 去登录按钮点击事件
    login.addEventListener('click',()=>{
        form_box.style.transform='translateX(0%)';
        register_box.classList.add('hidden');
        login_box.classList.remove('hidden');
    })

</script>
</body>
</html>



