<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 朱文强
  Date: 2024/5/17
  Time: 21:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>用户管理</title>
</head>
<style>
    @import url("//unpkg.com/element-ui@2.9.2/lib/theme-chalk/index.css");

    .el-header, .el-footer {
        background-color: #B3C0D1;
        color: #333;
        /*text-align: center;*/
        line-height: 60px;
        box-shadow: #B3C0D1;
    }

    .el-aside {
        background-color: white;
        color: #333;
        text-align: center;
        line-height: 200px;
    }

    .el-main {
        background-color: #E9EEF3;
        color: #333;
        text-align: center;
        line-height: 70px;
    }

    body > .el-container {
        margin-bottom: 40px;
    }

    .el-container:nth-child(5) .el-aside,
    .el-container:nth-child(6) .el-aside {
        line-height: 260px;
    }

    .el-container:nth-child(7) .el-aside {
        line-height: 320px;
    }

    .el-menu-vertical-demo:not(.el-menu--collapse) {
        width: 200px;
        min-height: 400px;
    }

    .main-user {
        /*border: 1px solid rgb(10, 10, 10);*/
        float: left;
        margin-top: 10px;
        margin-left: 300px;
        height: 600px;
        width: 950px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, .12), 0 0 6px rgba(0, 0, 0, .04);
        background: white;
        border-radius: 5px;
    }

    .main-user-header {
        /*border: 1px solid rgb(10, 10, 10);*/
        float: left;
        margin-top: 0;
        margin-left: 0;
        height: 60px;
        width: 950px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, .12), 0 0 6px rgba(0, 0, 0, .04);
    }

    .main-user-header-content {
        /*border: 1px solid rgb(10, 10, 10);*/
        float: left;
        margin-top: 3px;
        margin-left: 0;
        margin-bottom: 3px;
        height: 84px;
        width: 950px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, .12), 0 0 6px rgba(0, 0, 0, .04);
    }

    .main-user-header-content:hover {
        background: #f2f3f5;
    }

    .main-user-header-username-content {
        /*border: 1px solid rgb(10, 10, 10);*/
        float: left;
        margin-top: 0;
        margin-left: 0;
        height: 84px;
        width: 150px;
    }

    .main-user-header-email-content {
        /*border: 1px solid rgb(10, 10, 10);*/
        float: left;
        margin-top: 0;
        margin-left: 50px;
        height: 84px;
        width: 200px;
    }

    .main-user-header-status-content {
        /*border: 1px solid rgb(10, 10, 10);*/
        float: left;
        margin-top: 0;
        margin-left: 50px;
        height: 84px;
        width: 150px;
    }

    .main-user-header-operation-content {
        /*border: 1px solid rgb(10, 10, 10);*/
        float: left;
        margin-top: 0;
        margin-left: 50px;
        height: 84px;
        width: 280px;
    }

    .main-user-header-operation-content-button {
        /*border: 1px solid rgb(10, 10, 10);*/
        float: left;
        margin-top: 24px;
        margin-left: 10px;
        height: 40px;
        width: 80px;
    }

    .main-user-header-username {
        /*border: 1px solid rgb(10, 10, 10);*/
        float: left;
        margin-top: 0;
        margin-left: 0;
        height: 60px;
        width: 150px;
    }

    .main-user-header-email {
        /*border: 1px solid rgb(10, 10, 10);*/
        float: left;
        margin-top: 0;
        margin-left: 50px;
        height: 60px;
        width: 200px;
    }

    .main-user-header-status {
        /*border: 1px solid rgb(10, 10, 10);*/
        float: left;
        margin-top: 0;
        margin-left: 50px;
        height: 60px;
        width: 150px;
    }

    .main-user-header-operation {
        /*border: 1px solid rgb(10, 10, 10);*/
        float: left;
        margin-top: 0;
        margin-left: 50px;
        height: 60px;
        width: 250px;
    }
    .main-user-bottom {
        /*border: 1px solid rgb(10, 10, 10);*/
        float: left;
        /*position:absolute;*/
        margin-top: 20px;
        margin-left: 520px;
        height: 60px;
        width: 500px;
    }
    .main-condition{
        /*border: 1px solid rgb(10, 10, 10);*/
        float: left;
        /*position:absolute;*/

        margin-top: 20px;
        margin-left: 400px;
        height: 60px;
        width: 720px;
    }
    .main-condition-demo1{
        /*border: 1px solid rgb(10, 10, 10);*/
        float: left;
        margin-top: 0px;
        margin-left: 20px;
        height: 60px;
        width: 100px;
    }
    .main-condition-demo1-input{
        /*border: 1px solid rgb(10, 10, 10);*/
        float: left;
        margin-top: 20px;
        margin-left: 10px;
        height: 40px;
        width: 160px;
    }
    .main-condition-demo1-button{
        /*border: 1px solid rgb(10, 10, 10);*/
        float: left;
        margin-top: 20px;
        margin-left: 10px;
        height: 40px;
        width: 100px;
    }

</style>
<body>
<script src="//unpkg.com/vue@2/dist/vue.js"></script>
<script src="//unpkg.com/element-ui@2.9.2/lib/index.js"></script>
<script src="https://cdn.jsdelivr.net/npm/axios@0.21.1/dist/axios.min.js"></script>

<div id="app">
    <el-container>
        <el-header>
            WQ论坛后台管理系统
        </el-header>
        <el-container>
            <el-aside width="50px">

                <el-menu default-active="1-4-1" class="el-menu-vertical-demo" @open="handleOpen" @close="handleClose"
                         :collapse="isCollapse">
                    <el-submenu index="1">
                        <template slot="title">
                            <i class="el-icon-s-operation"></i>
                            <span slot="title">管理</span>
                        </template>
                        <el-menu-item-group>
                            <el-menu-item index="1-1">用户管理</el-menu-item>
                            <el-menu-item index="1-2" @click="goAdminPost()">文章管理</el-menu-item>
                            <el-menu-item index="1-2">日志管理</el-menu-item>
                        </el-menu-item-group>
                    </el-submenu>

                    <el-menu-item index="2" @click="dialogAnnounceVisible = true">
                        <i class="el-icon-view"></i>
                        <span slot="title">发布公告</span>
                    </el-menu-item>

                    <el-dialog title="发布网站公告" :visible.sync="dialogAnnounceVisible">
                        请输入公告内容:
                        <el-input
                                type="textarea"
                                :rows="2"
                                placeholder="请输入公告内容"
                                v-model="textarea">
                        </el-input>

                        <div slot="footer" class="dialog-footer">
                            <el-button @click="dialogAnnounceVisible = false">取 消</el-button>
                            <el-button type="primary" @click="dialogAnnounceVisible = false; updateAnnounce()">发 布</el-button>
                        </div>
                    </el-dialog>

                    <el-menu-item index="3" onclick="window.location.href= '${pageContext.request.contextPath}/admin/getAllComment?currentPage=1' ">
                        <i class="el-icon-warning"></i>
                        <span slot="title">举报处理</span>
                    </el-menu-item>

                    <el-menu-item index="4" @click="adminQuit()">
                        <i class="el-icon-setting"></i>
                        <span slot="title">退出登录</span>
                    </el-menu-item>
                </el-menu>

            </el-aside>

            <el-main>

                <form method="get" action="${pageContext.request.contextPath}/admin/getUserByUS'" id="click">
                    <div class="main-condition">
                        <div class="main-condition-demo1">
                            用户名称：
                        </div>
                        <div class="main-condition-demo1-input">
                            <el-input v-model="username" placeholder="请输入用户名" name="username"></el-input>
                        </div>
                        <div class="main-condition-demo1">
                            用户状态：
                        </div>
                        <div class="main-condition-demo1-input">
                            <template>
                                <el-select v-model="optionValue" placeholder="请选择" name="optionValue">

                                    <el-option
                                            label="启用"
                                            value="1">
                                    </el-option>
                                    <el-option
                                            label="禁用"
                                            value="0">
                                    </el-option>
                                    <el-option
                                            label="全部"
                                            value="-1">
                                    </el-option>
                                </el-select>
                            </template>
                        </div>

                        <div class="main-condition-demo1-button">
                                <el-button type="primary" icon="el-icon-search" @click="onSubmit()">查询</el-button>
                        </div>

                    </div>
                </form>


                <div class="main-user">
                    <div class="main-user-header">
                        <div class="main-user-header-username">
                            用户名称
                        </div>
                        <div class="main-user-header-email">
                            邮箱
                        </div>
                        <div class="main-user-header-status">
                            用户状态
                        </div>
                        <div class="main-user-header-operation">
                            操作
                        </div>
                    </div>

                    <%--每一页只能放六个--%>
                    <c:forEach items="${sessionScope.pageInfo.list}" var="user">

                    <div class="main-user-header-content">
                        <div class="main-user-header-username-content">
                            ${user.username}
                        </div>
                        <div class="main-user-header-email-content">
                                ${user.email}
                        </div>
                        <div class="main-user-header-status-content">
                            <c:if test="${user.status == 1}">启用</c:if>
                            <c:if test="${user.status == 0}">禁用</c:if>
                        </div>
                        <div class="main-user-header-operation-content">
                            <div class="main-user-header-operation-content-button">
                                <el-button type="primary" @click="userOpen(${user.id}); successButton()">启用</el-button>
                            </div>
                            <div class="main-user-header-operation-content-button">
                                <el-button type="warning" @click="userClose(${user.id}); successButton()">禁用</el-button>
                            </div>
                            <div class="main-user-header-operation-content-button">
                                <el-button type="danger" @click="userDelete(${user.id}); successButton()">删除</el-button>
                            </div>
                        </div>
                    </div>
                    </c:forEach>


                </div>

                <div class="main-user-bottom">
                    <c:forEach begin="1" end="${sessionScope.pageInfo.pages}" step="1" var="currentPage">
                        第<a href="">${currentPage}</a>页
                    </c:forEach>
                    当前页：${sessionScope.pageInfo.pageNum}
                    总记录数：${sessionScope.pageInfo.total}
                    总页数：${sessionScope.pageInfo.pages}
                </div>


            </el-main>
        </el-container>
    </el-container>
</div>

</body>

<script>
    new Vue({
        el: "#app",
        data: {
            isCollapse: true,
            optionValue:'-1',
            username:'',
            textarea: '',
            dialogAnnounceVisible:false,
        },
        methods: {
            handleOpen(key, keyPath) {
                console.log(key, keyPath);
            },
            handleClose(key, keyPath) {
                console.log(key, keyPath);
            },
            handleEdit(index, row) {
                console.log(index, row);
            },
            handleDelete(index, row) {
                console.log(index, row);
            },
            goAdminPost(){
                axios.get('${pageContext.request.contextPath}/admin/getPostByPage',{
                    params:{
                        postname:'',
                        postOption:-1,
                    }
                }).then(function (suc) {
                    window.location.href="${pageContext.request.contextPath}/admin/goAdminPost";
                })
            },
            goAdminReport(currentPage){
                axios.get('${pageContext.request.contextPath}admin/getAllComment',{
                    params:{
                        currentPage:currentPage,
                    }
                }).then(function (suc) {
                    window.location.href="${pageContext.request.contextPath}/admin/goAdminReport";
                })
            },
            onSubmit(){
                axios.get('${pageContext.request.contextPath}/admin/getUserByUS',{
                    params:{
                        username:this.username,
                        optionValue:this.optionValue,
                    }
                }).then(function (suc) {
                    alert("查询成功！")
                    window.location.href="${pageContext.request.contextPath}/goAdminIndex"
                })
            },
            userOpen(userId){
                axios.get('${pageContext.request.contextPath}/admin/userOpen',{
                    params:{
                        userId:userId,
                    }
                }).then(function (suc) {
                })
            },
            userClose(userId){
                axios.get('${pageContext.request.contextPath}/admin/userClose',{
                    params:{
                        userId:userId,
                    }
                }).then(function (suc) {
                })
            },
            userDelete(userId){
                axios.get('${pageContext.request.contextPath}/admin/userDelete',{
                    params:{
                        userId:userId,
                    }
                }).then(function (suc) {
                })
            },
            adminQuit(){
              window.location.href="${pageContext.request.contextPath}/goRegister"
            },
            updateAnnounce(){
                axios.get('${pageContext.request.contextPath}/admin/updateAnnounce',{
                    params:{
                        textContent:this.textarea,
                    }
                })
            },
            successButton() {
                this.$message({
                    message: '操作成功！',
                    type: 'success'
                });
            },
        },


    })


</script>

</html>
