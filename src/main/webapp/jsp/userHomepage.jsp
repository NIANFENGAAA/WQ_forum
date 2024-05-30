<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>个人主页</title>
</head>

<style>
    @import url("//unpkg.com/element-ui@2.15.14/lib/theme-chalk/index.css");

    /*导航栏内容*/
    .header {
        width: 100%;
        height: 60px;
        box-shadow: 0 2px 6px 0 #ddd;
        position: fixed;
        background: white;
    }

    .logo-box {
        /*border: 1px solid rgb(10, 10, 10);*/
        float: left;
        margin-left: 45px;
        margin-bottom: 2px;
        height: 40px;
        width: 170px;
        text-align: center;
        align-items: center;
    }

    .logo-ziti {
        font-size: 20px;
    }

    .suosou {
        /*border: 1px solid rgb(10, 10, 10);*/
        float: left;
        margin-top: 5px;
        margin-left: 600px;
        height: 50px;
        width: 250px;
    }

    .sousuo-submit {
        /*border: 1px solid rgb(10, 10, 10);*/
        float: left;
        margin-top: 5px;
        margin-left: 5px;
        height: 55px;
        width: 100px;
    }

    .user-detail {
        /*border: 1px solid rgb(10, 10, 10);*/
        float: left;
        margin-top: 5px;
        margin-left: 5px;
        height: 55px;
        width: 160px;
    }

    .user-avatar {
        /*border: 1px solid rgb(10, 10, 10);*/
        float: left;
        margin-top: 5px;
        margin-left: 5px;
        height: 50px;
        width: 50px;
    }

    /*主体内容*/
    .homePage-main-box {
        margin-top: 62px;
        width: 100%;
        height: auto;
        background: white;
        float: left;
    }

    .main-middle-homePage {
        /*border: 1px solid rgb(10, 10, 10);*/
        float: left;
        margin-top: 30px;
        margin-left: 300px;
        height: 200px;
        width: 720px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, .12), 0 0 6px rgba(0, 0, 0, .04);
        border-radius: 5px;
        background: white;
    }

    .main-middle-homePage-avatar {
        /*border: 1px solid rgb(10, 10, 10);*/
        float: left;
        margin-top: 30px;
        margin-left: 30px;
        height: 120px;
        width: 120px;
    }

    .main-middle-homePage-avatar-name {
        /*border: 1px solid rgb(10, 10, 10);*/
        float: left;
        margin-top: 30px;
        margin-left: 20px;
        height: 30px;
        width: 300px;
    }

    .main-middle-homePage-content {
        /*border: 1px solid rgb(10, 10, 10);*/
        float: left;
        margin-top: 10px;
        margin-left: 20px;
        height: 80px;
        width: 300px;
    }

    .main-middle-homePage-setting {
        /*
        border: 1px solid rgb(10, 10, 10);
        */
        float: left;
        margin-top: 53px;
        margin-left: 20px;
        height: 35px;
        width: 200px;
    }

    .homePage-setting-button {
        height: 35px;
        width: 80px;
    }
    .homePage-setting-button-1 {
        height: 35px;
        width: 120px;
    }


    .homePage-main {
        /*border: 1px solid rgb(10, 10, 10);*/
        float: left;
        margin-top: 60px;
        height: auto;
        width: 720px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, .12), 0 0 6px rgba(0, 0, 0, .04);
        border-radius: 2px;
        background: white;
    }

    .homePage-main-child {
        /*border: 1px solid rgb(10, 10, 10);*/
        float: left;
        margin-top: 2px;
        margin-left: 2px;
        height: 100px;
        width: 716px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, .12), 0 0 6px rgba(0, 0, 0, .04);
        background: #ffffff;
    }

    .homePage-main-child:hover {
        background: #f2f3f5;
    }

    .attention-avatar {
        /*border: 1px solid rgb(10, 10, 10);*/
        float: left;
        margin-top: 25px;
        margin-left: 30px;
        height: 50px;
        width: 50px;
    }

    .attention-avatar-name {
        /*border: 1px solid rgb(10, 10, 10);*/
        float: left;
        margin-top: 25px;
        margin-left: 5px;
        height: 30px;
        width: 200px;
    }

    .attention-avatar-button {
        /*border: 1px solid rgb(10, 10, 10);*/
        float: left;
        margin-top: 30px;
        margin-left: 220px;
        height: 35px;
        width: 120px;
    }

    .attention-avatar-buttonStyle {
        height: 35px;
        width: 120px;
    }

    .homePage-main-middle-child-up {
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

    .homePage-main-middle-child-middle {
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

    .homePage-main-middle-child-down {
        /*border: 1px solid rgb(10, 10, 10);*/
        float: left;
        height: 30px;
        width: 700px;
        margin-top: 5px;
        margin-left: 15px;
    }

    .homePage-set-icon {
        font-size: 12px;
    }


    .main-right-homePage {
        border: 1px solid rgb(10, 10, 10);
        float: left;
        margin-top: 30px;
        margin-left: 20px;
        height: 200px;
        width: 275px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, .12), 0 0 6px rgba(0, 0, 0, .04);
        border-radius: 5px;
        background: white;
    }


</style>

<body>

<script src="//unpkg.com/vue@2/dist/vue.js"></script>
<script src="//unpkg.com/element-ui@2.15.14/lib/index.js"></script>
<script src="../js/axios-0.18.0.js"></script>


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
                <el-dropdown split-button type="primary"
                             onclick="window.location.href = '${pageContext.request.contextPath}/goUserData' ">
                    个人中心&nbsp;
                    <el-dropdown-menu slot="dropdown">
                        <el-dropdown-item
                                onclick="window.location.href = '${pageContext.request.contextPath}/goIndex' ">首页
                        </el-dropdown-item>
                        <el-dropdown-item
                                onclick="window.location.href = '${pageContext.request.contextPath}/goUserHomepage?userId=${sessionScope.presentUser.id}' ">
                            个人主页
                        </el-dropdown-item>
                        <el-dropdown-item
                                onclick="window.location.href = '${pageContext.request.contextPath}/goWritePost' ">写文章
                        </el-dropdown-item>
                        <el-dropdown-item onclick="window.location.href = '${pageContext.request.contextPath}' ">私信
                        </el-dropdown-item>
                    </el-dropdown-menu>
                </el-dropdown>
                <%--                <el-button type="primary" onclick = "window.location.href = '${pageContext.request.contextPath}/goUserData' ">个人中心</el-button>--%>
            </c:if>

            <c:if test="${empty sessionScope.presentUser}">
                <el-button plain onclick="window.location.href = '${pageContext.request.contextPath}/goRegister' ">
                    登录
                </el-button>
                <el-button plain onclick="window.location.href = '${pageContext.request.contextPath}/goRegister' ">
                    注册
                </el-button>
            </c:if>
        </div>
        <div class="user-avatar">
            <c:if test="${!empty sessionScope.presentUser}">
                <el-avatar src="${pageContext.request.contextPath}/avatar/${sessionScope.presentUser.img}"
                           :size="40"></el-avatar>
            </c:if>
            <c:if test="${empty sessionScope.presentUser}">
                <el-avatar src="https://cube.elemecdn.com/0/88/03b0d39583f48206768a7534e55bcpng.png"
                           :size="40"></el-avatar>
            </c:if>
        </div>
    </div>


    <%--主体内容--%>

    <div class="homePage-main-box">

        <div class="main-middle-homePage">
            <div class="main-middle-homePage-avatar">
                <c:if test="${!empty sessionScope.HomePage.user}">
                    <el-avatar src="${pageContext.request.contextPath}/avatar/${sessionScope.HomePage.user.img}"
                               :size="120"></el-avatar>
                </c:if>
                <c:if test="${empty sessionScope.HomePage.user}">
                    <el-avatar src="https://cube.elemecdn.com/0/88/03b0d39583f48206768a7534e55bcpng.png"
                               :size="120"></el-avatar>
                </c:if>

            </div>
            <div class="main-middle-homePage-avatar-name">
                <h3 style="margin: 0">${sessionScope.HomePage.user.username}</h3>
            </div>
            <div class="main-middle-homePage-content">
                <p style="margin: 0; font-family: '13px Small',serif; font-size: smaller">
                    ${sessionScope.HomePage.user.introduction}
                </p>
            </div>
            <div class="main-middle-homePage-setting">
                <c:if test="${sessionScope.HomePage.user.id == sessionScope.presentUser.id}">
                    <el-button type="primary" plain class="homePage-setting-button-1"
                               onclick="window.location.href = '${pageContext.request.contextPath}/goUserData' ">设置
                    </el-button>
                </c:if>
                <c:if test="${sessionScope.HomePage.user.id != sessionScope.presentUser.id}">
                    <el-button type="primary" plain class="homePage-setting-button-1"
                               onclick="window.location.href = '${pageContext.request.contextPath}/' ">私聊
                    </el-button>
                </c:if>

            </div>
            <div class="homePage-main">
                <el-tabs v-model="activeName" @tab-click="handleClick">
                    <el-tab-pane label="文章" name="first">

                        <c:if test="${empty sessionScope.HomePage.postList}">
                            <el-empty image="${pageContext.request.contextPath}/avatar/waiting.jpg"></el-empty>
                        </c:if>

                        <c:if test="${!empty sessionScope.HomePage.postList}">
                            <c:forEach items="${sessionScope.HomePage.postList}" var="post">
                                <div class="homePage-main-child">
                                    <div class="homePage-main-middle-child-up" onclick="window.location.href = '${pageContext.request.contextPath}/goPostDetail?postId=${post.post_id}'">
                                        <p style="font-weight: bold;padding: 0;margin-top: 0;margin-bottom: 0">${post.post_title}</p>
                                    </div>
                                    <div class="homePage-main-middle-child-middle" onclick="window.location.href = '${pageContext.request.contextPath}/goPostDetail?postId=${post.post_id}'">
                                        <p style="margin: 0; font-family: '13px Small',serif; font-size: smaller">${post.post_content}</p>
                                    </div>
                                    <div class="homePage-main-middle-child-down">
                                        <span style="font-size: smaller">${post.userName}</span>
                                        <el-divider direction="vertical"></el-divider>
                                        <i class="el-icon-view homePage-set-icon"></i>
                                        <span style="font-size: smaller">${post.view}</span>
                                        <el-divider direction="vertical"></el-divider>
                                        <i class="el-icon-thumb homePage-set-icon"></i>
                                        <span style="font-size: smaller">${post.goodQuantity}</span>
                                    </div>
                                </div>
                            </c:forEach>
                        </c:if>

                    </el-tab-pane>
                    <el-tab-pane label="关注" name="second">
                        <c:if test="${empty sessionScope.HomePage.userList}">
                            <el-empty image="${pageContext.request.contextPath}/avatar/waiting.jpg"></el-empty>
                        </c:if>

                        <c:if test="${!empty sessionScope.HomePage.userList}">
                            <c:forEach items="${sessionScope.HomePage.userList}" var="user">
                                <div class="homePage-main-child">
                                    <div class="attention-avatar" onclick="window.location.href = '${pageContext.request.contextPath}/goUserHomepage?userId=${user.id}' ">
                                        <el-avatar src="${pageContext.request.contextPath}/avatar/${user.img}"
                                                   :size="50"></el-avatar>
                                    </div>
                                    <div class="attention-avatar-name">
                                        <h3 style="margin: 0">${user.username}</h3>
                                    </div>
                                    <div class="attention-avatar-button">
                                        <el-button type="success" class="attention-avatar-buttonStyle">已关注
                                        </el-button>
                                    </div>
                                </div>
                            </c:forEach>
                        </c:if>

                    </el-tab-pane>
                    <el-tab-pane label="点赞" name="third">

                        <c:if test="${empty sessionScope.HomePage.goodPostList}">
                            <el-empty image="${pageContext.request.contextPath}/avatar/waiting.jpg"></el-empty>
                        </c:if>

                        <c:if test="${!empty sessionScope.HomePage.goodPostList}">
                            <c:forEach items="${sessionScope.HomePage.goodPostList}" var="post">
                                <div class="homePage-main-child" onclick="window.location.href = '${pageContext.request.contextPath}/goPostDetail?postId=${post.post_id}'">
                                    <div class="homePage-main-middle-child-up">
                                        <p style="font-weight: bold;padding: 0;margin-top: 0;margin-bottom: 0">${post.post_title}</p>
                                    </div>
                                    <div class="homePage-main-middle-child-middle">
                                        <p style="margin: 0; font-family: '13px Small',serif; font-size: smaller">${post.post_content}</p>
                                    </div>
                                    <div class="homePage-main-middle-child-down">
                                        <span style="font-size: smaller">${post.userName}</span>
                                        <el-divider direction="vertical"></el-divider>
                                        <i class="el-icon-view homePage-set-icon"></i>
                                        <span style="font-size: smaller">${post.view}</span>
                                        <el-divider direction="vertical"></el-divider>
                                        <i class="el-icon-thumb homePage-set-icon"></i>
                                        <span style="font-size: smaller">${post.goodQuantity}</span>
                                    </div>
                                </div>
                            </c:forEach>
                        </c:if>

                    </el-tab-pane>
                    <el-tab-pane label="粉丝" name="fourth">
                        <c:if test="${empty sessionScope.HomePage.fansList}">
                            <el-empty image="${pageContext.request.contextPath}/avatar/waiting.jpg"></el-empty>
                        </c:if>

                        <c:if test="${!empty sessionScope.HomePage.fansList}">
                            <c:forEach items="${sessionScope.HomePage.fansList}" var="fans">
                                <div class="homePage-main-child">
                                    <div class="attention-avatar" onclick="window.location.href = '${pageContext.request.contextPath}/goUserHomepage?userId=${fans.id}' ">
                                        <el-avatar src="${pageContext.request.contextPath}/avatar/${fans.img}"
                                                   :size="50"></el-avatar>
                                    </div>
                                    <div class="attention-avatar-name">
                                        <h3 style="margin: 0">${fans.username}</h3>
                                    </div>
                                    <div class="attention-avatar-button">
                                        <el-button type="success" class="attention-avatar-buttonStyle">关注</el-button>
                                    </div>
                                </div>
                            </c:forEach>
                        </c:if>
                    </el-tab-pane>




                    <el-tab-pane label="我的收藏" name="five">
                        <c:if test="${empty sessionScope.HomePage.starPostList}">
                            <el-empty image="${pageContext.request.contextPath}/avatar/waiting.jpg"></el-empty>
                        </c:if>

                        <c:if test="${!empty sessionScope.HomePage.starPostList}">
                        <c:forEach items="${sessionScope.HomePage.starPostList}" var="post">
                        <div class="homePage-main-child">
                            <div class="homePage-main-middle-child-up" onclick="window.location.href = '${pageContext.request.contextPath}/goPostDetail?postId=${post.post_id}'">
                                <p style="font-weight: bold;padding: 0;margin-top: 0;margin-bottom: 0">${post.post_title}</p>
                            </div>
                            <div class="homePage-main-middle-child-middle" onclick="window.location.href = '${pageContext.request.contextPath}/goPostDetail?postId=${post.post_id}'">
                                <p style="margin: 0; font-family: '13px Small',serif; font-size: smaller">${post.post_content}</p>
                            </div>
                            <div class="homePage-main-middle-child-down">
                                <span style="font-size: smaller">${post.userName}</span>
                                <el-divider direction="vertical"></el-divider>
                                <i class="el-icon-view homePage-set-icon"></i>
                                <span style="font-size: smaller">${post.view}</span>
                                <el-divider direction="vertical"></el-divider>
                                <i class="el-icon-thumb homePage-set-icon"></i>
                                <span style="font-size: smaller">${post.goodQuantity}</span>
                            </div>
                        </div>
                        </c:forEach>
                        </c:if>
                    </el-tab-pane>


                </el-tabs>
            </div>
        </div>

        <div class="main-right-homePage">

        </div>

    </div>


</div>

</body>
<script>
    export default {
        data() {
            return {
                activeName: 'second',
            };
        },
        methods: {
            handleClick(tab, event) {
                console.log(tab, event);
            },
        },
    };

</script>


<script>
    new Vue().$mount('#app')
</script>

</html>