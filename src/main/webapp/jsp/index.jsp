<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>WQ论坛</title>
</head>

<style>
    @import url("//unpkg.com/element-ui@2.15.14/lib/theme-chalk/index.css");

    /*导航栏内容*/
    .header{
        width: 100%;
        height: 60px;
        box-shadow: 0 2px 6px 0 #ddd;
        position: fixed;
        background: white;
    }
    .logo-box{
        /*border: 1px solid rgb(10, 10, 10);*/
        float: left;
        margin-left: 45px;
        margin-bottom: 2px;
        height: 40px;
        width: 170px;
        text-align: center;
        align-items: center;
    }
    .logo-ziti{
        font-size: 20px;
    }
    .suosou{
        /*border: 1px solid rgb(10, 10, 10);*/
        float: left;
        margin-top: 5px;
        margin-left: 600px;
        height: 50px;
        width: 250px;
    }
    .sousuo-submit{
        /*border: 1px solid rgb(10, 10, 10);*/
        float: left;
        margin-top: 5px;
        margin-left: 5px;
        height: 55px;
        width: 100px;
    }
    .user-detail{
        /*border: 1px solid rgb(10, 10, 10);*/
        float: left;
        margin-top: 5px;
        margin-left: 5px;
        height: 55px;
        width: 160px;
    }
    .user-avatar{
        /*border: 1px solid rgb(10, 10, 10);*/
        float: left;
        margin-top: 5px;
        margin-left: 5px;
        height: 50px;
        width: 50px;
    }

    /*主体内容*/
    .main-box{
        margin-top: 62px;
        width: 100%;
        height: auto;
        background: #f2f3f5;
        float: left;
    }

    .main-left{
        /*border: 1px solid rgb(10, 10, 10);*/
        float: left;
        margin-top: 10px;
        margin-left: 200px;
        height: auto;
        width: 180px;
        position: fixed;
        box-shadow: 0 2px 4px rgba(0, 0, 0, .12), 0 0 6px rgba(0, 0, 0, .04)
    }
    .main-left-child{
        border: 1px solid rgb(10, 10, 10);
        float: left;
        width: 180px;
        height: 50px;
        background: #d3b7d8;
    }
    .child-ziti{
        font-size: 18px;
        color: cornflowerblue;
    }
    .main-middle{
        /*border: 1px solid rgb(10, 10, 10);*/
        float: left;
        margin-top: 10px;
        margin-left: 400px;
        height: auto;
        width: 720px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, .12), 0 0 6px rgba(0, 0, 0, .04)
    }
    .main-middle-child{
        /*border: 1px solid rgb(10, 10, 10);*/
        float: left;
        height: 100px;
        width: 716px;
        margin-top: 2px;
        margin-left: 2px;
        background: #ffffff;
        box-shadow: 0 2px 4px rgba(0, 0, 0, .12), 0 0 6px rgba(0, 0, 0, .04)
    }
    .main-middle-child:hover{
        background: #f2f3f5;
    }
    .main-middle-child-up{
        /*border: 1px solid rgb(10, 10, 10);*/
        white-space: nowrap; /* 确保内容在一行显示 */
        overflow: hidden; /* 超出部分隐藏 */
        text-overflow: ellipsis; /* 超出部分显示为省略号 */
        float: left;
        height: 30px;
        width: 700px;
        margin-top: 4px;
        margin-left: 15px;
    }
    .main-middle-child-middle{
        /*border: 1px solid rgb(10, 10, 10);*/
        white-space: nowrap; /* 确保内容在一行显示 */
        overflow: hidden; /* 超出部分隐藏 */
        text-overflow: ellipsis; /* 超出部分显示为省略号 */
        float: left;
        height: 25px;
        width: 700px;
        margin-top: 5px;
        margin-left: 15px;
    }
    .index-post-content{
        overflow: hidden;
        text-overflow:ellipsis;
        white-space: nowrap;
    }
    .main-middle-child-down{
        /*border: 1px solid rgb(10, 10, 10);*/
        float: left;
        height: 30px;
        width: 700px;
        margin-top: 5px;
        margin-left: 15px;
    }
    .set-icon{
        font-size: 12px;
    }
    .set-icon-gooded{
        font-size: 12px;
        color: red;
    }


    .main-right{
        /*border: 1px solid rgb(10, 10, 10);*/
        float: left;
        margin-top: 10px;
        margin-left: 20px;
        height: auto;
        background: white;
        width: 300px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, .12), 0 0 6px rgba(0, 0, 0, .04);
        border-radius: 10px;
    }
    .main-right-header{
        /*border: 1px solid rgb(10, 10, 10);*/
        float: left;
        margin-top: 10px;
        height: 80px;
        width: 300px;
        text-align: center;
    }
    .main-right-content{
        /*border: 1px solid rgb(10, 10, 10);*/
        float: left;
        margin-top: 0;
        margin-left: 10px;
        height: auto;
        width: 280px;
    }
    .main-index-right-foot{
        /*border: 1px solid rgb(10, 10, 10);*/
        float: left;
        margin-top: 30px;
        margin-left: 10px;
        height: 20px;
        width: 280px;
    }
    .el-dropdown {
        vertical-align: top;
    }
    .el-dropdown + .el-dropdown {
        margin-left: 15px;
    }
    .el-icon-arrow-down {
        font-size: 12px;
    }
</style>

<body>

<%--<script src="${pageContext.request.contextPath}/js/vue.js"></script>--%>
<%--<script src="${pageContext.request.contextPath}/element-ui/index.js"></script>--%>
<%--<link rel="stylesheet" href="path/to/element-ui/index.css" />--%>
<script src="//unpkg.com/vue@2/dist/vue.js"></script>
<script src="//unpkg.com/element-ui@2.15.14/lib/index.js"></script>
<script src="https://cdn.jsdelivr.net/npm/axios@0.21.1/dist/axios.min.js"></script>

<%--<script>
    function loadMethod() {
        var xhr = new XMLHttpRequest();
        xhr.open("GET", "${pageContext.request.contextPath}/getAllPostCategory", true);
        xhr.send();
    }
</script>--%>

<div id="app">

    <%--导航栏内容--%>


    <div class="header">
        <div class="logo-box">
            <p class="logo-ziti">WQ论坛</p>
        </div>

        <div class="suosou">
            <el-input v-model="input" placeholder="请输入内容"></el-input>
        </div>
        <div class="sousuo-submit">
            <el-button type="primary" icon="el-icon-search">搜索</el-button>
        </div>

        <div class="user-detail">
            <c:if test="${!empty sessionScope.presentUser}">
                <el-dropdown split-button type="primary" onclick = "window.location.href = '${pageContext.request.contextPath}/goUserData' ">
                    个人中心&nbsp;
                    <el-dropdown-menu slot="dropdown">
                        <el-dropdown-item onclick = "window.location.href = '${pageContext.request.contextPath}/goIndex' ">首页</el-dropdown-item>
                        <el-dropdown-item onclick = "window.location.href = '${pageContext.request.contextPath}/goUserHomepage?userId=${sessionScope.presentUser.id}' ">个人主页</el-dropdown-item>
                        <el-dropdown-item onclick = "window.location.href = '${pageContext.request.contextPath}/goWritePost' ">写文章</el-dropdown-item>
                        <el-dropdown-item onclick = "window.location.href = '${pageContext.request.contextPath}' ">私信</el-dropdown-item>
                    </el-dropdown-menu>
                </el-dropdown>
<%--                <el-button type="primary" onclick = "window.location.href = '${pageContext.request.contextPath}/goUserData' ">个人中心</el-button>--%>
            </c:if>

            <c:if test="${empty sessionScope.presentUser}">
                <el-button plain onclick = "window.location.href = '${pageContext.request.contextPath}/goRegister' ">登录</el-button>
                <el-button plain onclick = "window.location.href = '${pageContext.request.contextPath}/goRegister' ">注册</el-button>
            </c:if>
        </div>
        <div class="user-avatar">
            <c:if test="${!empty sessionScope.presentUser}">
                <el-avatar src="${pageContext.request.contextPath}/avatar/${sessionScope.presentUser.img}" :size="40"></el-avatar>
            </c:if>
            <c:if test="${empty sessionScope.presentUser}">
                <el-avatar src="https://cube.elemecdn.com/0/88/03b0d39583f48206768a7534e55bcpng.png" :size="40"></el-avatar>
            </c:if>
        </div>
    </div>



    <%--主体内容--%>

    <div class="main-box">

        <div class="main-left"  onload="loadMethod()">


                <el-col :span="24">
                    <%--<h5>默认颜色</h5>--%>
                    <el-menu
                            default-active="2"
                            class="el-menu-vertical-demo"
                            @open="handleOpen"
                            >
                        <c:forEach items="${sessionScope.allPostCategory}" var="postCategory">
                            <el-menu-item index="1">
                                <i class="el-icon-discover"></i>
                                <span slot="title">${postCategory.post_category}</span>
                            </el-menu-item>
                        </c:forEach>

                    </el-menu>
                </el-col>

        </div>

        <div class="main-middle">
            <c:forEach items="${sessionScope.indexPostList}" var="post" >
            <div class="main-middle-child">

                <div class="main-middle-child-up">
                    <p style="font-weight: bold;padding: 0;margin-top: 0;margin-bottom: 0" onclick="window.location.href = '${pageContext.request.contextPath}/goPostDetail?postId=${post.post_id}'">${post.post_title}</p>
                </div>
                <div class="main-middle-child-middle">
                    <p style="margin: 0; font-family: '13px Small',serif; font-size: smaller" class="index-post-content" onclick="window.location.href = '${pageContext.request.contextPath}/goPostDetail?postId=${post.post_id}'">${post.post_content}</p>
                </div>
                <div class="main-middle-child-down">
                        <span style="font-size: smaller">${post.userName}</span>
                        <el-divider direction="vertical"></el-divider>
                        <i class="el-icon-view set-icon"></i>
                        <span style="font-size: smaller">${post.view}</span>
                        <el-divider direction="vertical"></el-divider>
                        <c:if test="${post.good == true}">
                            <el-button type="text" @click="addGood(${post.post_id}, ${post.good}); open1()"><i class="el-icon-thumb set-icon-gooded"></i></el-button>
                        </c:if>
                        <c:if test="${post.good == false}">
                            <el-button type="text" @click="addGood(${post.post_id}, ${post.good}); open2()"><i class="el-icon-thumb set-icon"></i></el-button>
                        </c:if>
                        <span style="font-size: smaller">${post.goodQuantity}</span>
<%--                        <input v-model="postId" value="${post.post_id}" type="hidden" >--%>
                </div>
            </div>
            </c:forEach>

        </div>

        <div class="main-right">
            <div class="main-right-header">
                <h2 style="margin-top: 20px;">公告</h2>
            </div>
            <div class="main-right-content">
                <p style="margin: 0; font-size: large">
                    ${sessionScope.presentAnnounce.content}
                </p>
            </div>
            <div class="main-index-right-foot">

            </div>
        </div>

    </div>


</div>

</body>
<script>
    new Vue({
        el:"#app",
        data:{
            input: '',
        },
        methods: {
            addGood(postId,good){
                axios.get('${pageContext.request.contextPath}/post/updateGood',{
                    params:{
                        param1:postId,
                        param2:good,
                    }
                }).then(function (suc) {
                    if (suc.data.code === 1){
                        window.history.go(0);
                    }
                }).catch(function (err) {
                    alert(err)
                })
            },
            open2() {
                this.$message({
                    message: '多谢侠士欣赏！',
                    type: 'success'
                });
            },
            open1() {
                this.$message({
                    message: '大胆，还敢取消！',
                    type: 'success'
                });
            },
        },

    })


</script>



</html>