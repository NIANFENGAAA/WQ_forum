<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>个人中心</title>
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
        width: 200px;
    }

    /*主体内容*/
    .user-main-box{
        margin-top: 62px;
        width: 100%;
        height: auto;
        background: #f2f3f5;
        float: left;
    }

    .user-main-left{
        border: 1px solid rgb(10, 10, 10);
        float: left;
        margin-top: 50px;
        margin-left: 170px;
        height: 800px;
        width: 250px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, .12), 0 0 6px rgba(0, 0, 0, .04)
    }
    .user-main-left-child{
        border: 1px solid rgb(10, 10, 10);
        float: left;
        margin-left: 5px;
        margin-top: 5px;
        width:  70px;
        height: 50px;
    }
    .child-ziti{
        font-size: 18px;
        color: cornflowerblue;
    }
    .user-main-middle{
        border: 1px solid rgb(10, 10, 10);
        float: left;
        margin-top: 10px;
        margin-left: 20px;
        height: 2000px;
        width: 900px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, .12), 0 0 6px rgba(0, 0, 0, .04)

    }

    .user-main-right{
        border: 1px solid rgb(10, 10, 10);
        float: left;
        margin-top: 10px;
        margin-left: 20px;
        height: 200px;
        width: 275px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, .12), 0 0 6px rgba(0, 0, 0, .04)
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
                <el-dropdown split-button type="primary" onclick = "window.location.href = '${pageContext.request.contextPath}/goUserData' ">
                    个人中心&nbsp;
                    <el-dropdown-menu slot="dropdown">
                        <el-dropdown-item onclick = "window.location.href = '${pageContext.request.contextPath}/goIndex' ">首页</el-dropdown-item>
                        <el-dropdown-item onclick = "window.location.href = '${pageContext.request.contextPath}/goUserHomepage?userId=${sessionScope.presentUser.id}' ">个人主页</el-dropdown-item>
                        <el-dropdown-item onclick = "window.location.href = '${pageContext.request.contextPath}/goWritePost' ">写文章</el-dropdown-item>
                        <el-dropdown-item onclick = "window.location.href = '${pageContext.request.contextPath}' ">私信</el-dropdown-item>
                    </el-dropdown-menu>
                </el-dropdown>
<%--                <el-button type="primary">个人中心</el-button>--%>
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

    <div class="user-main-box">

        <div class="user-main-left">
            <el-row class="tac">
                <el-col :span="22">
                    <el-menu
                            default-active="2"
                            class="el-menu-vertical-demo"
                            @open="handleOpen"
                            @close="handleClose">
                        <el-menu-item index="1" onclick = "window.location.href = '${pageContext.request.contextPath}/goIndex' ">
                            <i class="el-icon-setting"></i>
                            <span slot="title">首页</span>
                        </el-menu-item>
                        <el-submenu index="2">
                            <template slot="title">
                                <i class="el-icon-location"></i>
                                <span>文章管理</span>
                            </template>
                            <el-menu-item-group>
                                <template slot="title">文章</template>
                                <el-menu-item index="1-1">我的文章</el-menu-item>
                                <el-menu-item index="1-2">写文章</el-menu-item>
                            </el-menu-item-group>
                        </el-submenu>
                        <el-menu-item index="3">
                            <i class="el-icon-setting"></i>
                            <span slot="title">个人资料</span>
                        </el-menu-item>

                        <el-menu-item index="4">
                            <i class="el-icon-setting"></i>
                            <span slot="title">账号设置</span>
                        </el-menu-item>
                    </el-menu>
                </el-col>
            </el-row>
        </div>

        <div class="user-main-middle">

        </div>


    </div>


</div>

</body>
<script>
    export default {
        data() {
            return {
                input: '',

            };
        },
        methods: {
            handleOpen(key, keyPath) {
                console.log(key, keyPath);
            },
            handleClose(key, keyPath) {
                console.log(key, keyPath);
            }
        },
    };

</script>


<script>
    new Vue().$mount('#app')
</script>

</html>
