<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>个人资料</title>
</head>

<style>
    @import url("//unpkg.com/element-ui@2.15.14/lib/theme-chalk/index.css");

    .avatar-uploader .el-upload {
        border: 1px dashed #d9d9d9;
        border-radius: 6px;
        cursor: pointer;
        position: relative;
        overflow: hidden;
    }
    .avatar-uploader .el-upload:hover {
        border-color: #409EFF;
    }
    .avatar-uploader-icon {
        font-size: 28px;
        color: #8c939d;
        width: 178px;
        height: 178px;
        line-height: 178px;
        text-align: center;
    }
    .avatar {
        width: 178px;
        height: 178px;
        display: block;
    }

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
        /*border: 1px solid rgb(10, 10, 10);*/
        float: left;
        margin-top: 50px;
        margin-left: 180px;
        height: 800px;
        width: 250px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, .12), 0 0 6px rgba(0, 0, 0, .04)
    }
    .user-main-middle{
        /*border: 1px solid rgb(10, 10, 10);*/
        float: left;
        margin-top: 50px;
        margin-left: 20px;
        height: 800px;
        width: 900px;
        background: white;
        box-shadow: 0 2px 4px rgba(0, 0, 0, .12), 0 0 6px rgba(0, 0, 0, .04)
    }
    .user-main-middle-header{
        /*border: 1px solid rgb(10, 10, 10);*/
        float: left;
        height: 50px;
        width: 900px;
    }
    .user-main-middle-left{
        /*border: 1px solid rgb(10, 10, 10);*/
        float: left;
        margin-top: 50px;
        margin-left: 10px;
        height: 400px;
        width: 400px;
    }
    .user-main-middle-right{
        /*border: 1px solid rgb(10, 10, 10);*/
        float: left;
        margin-top: 50px;
        margin-left: 20px;
        height: 400px;
        width: 400px;
        text-align: center;
        line-height: 400px;
    }

</style>

<body>

<script src="//unpkg.com/vue@2/dist/vue.js"></script>
<script src="//unpkg.com/element-ui@2.15.14/lib/index.js"></script>
<script src="https://cdn.jsdelivr.net/npm/axios@0.21.1/dist/axios.min.js"></script>


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
<%--
                <el-button type="primary">个人中心</el-button>
--%>
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

        <c:if test="${!empty sessionScope.userUpload}">
            <el-alert
                    title="文件太大，无法上传！"
                    type="error"
                    center
                    show-icon>
            </el-alert>
            <%
                session.removeAttribute("userUpload");
            %>
        </c:if>

        <c:if test="${!empty sessionScope.userUpload2}">
            <el-alert
                    title="图片上传失败！"
                    type="error"
                    center
                    show-icon>
            </el-alert>
            <%
                session.removeAttribute("userUpload2");
            %>
        </c:if>

        <c:if test="${!empty sessionScope.userUpload3}">
            <el-alert
                    title="不支持上传该类型！"
                    type="error"
                    center
                    show-icon>
            </el-alert>
            <%
                session.removeAttribute("userUpload3");
            %>
        </c:if>

        <c:if test="${!empty sessionScope.userUpload4}">
            <el-alert
                    title="图片上传成功！"
                    type="success"
                    center
                    show-icon>
            </el-alert>
            <%
                session.removeAttribute("userUpload4");
            %>
        </c:if>

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
                        <el-menu-item index="3" onclick = "window.location.href = '${pageContext.request.contextPath}/goUserData' ">
                            <i class="el-icon-setting"></i>
                            <span slot="title">个人资料</span>
                        </el-menu-item>

                        <el-menu-item index="4" onclick = "window.location.href = '${pageContext.request.contextPath}/goUserUpdateAccount' ">
                            <i class="el-icon-setting"></i>
                            <span slot="title">账号设置</span>
                        </el-menu-item>
                    </el-menu>
                </el-col>
            </el-row>
        </div>

        <div class="user-main-middle">
            <div class="user-main-middle-header">
                <h3>个人资料</h3>
                <el-divider></el-divider>
            </div>


            <div class="user-main-middle-left">
                <el-form ref="form" :model="userData" label-width="80px">
                    <el-form-item label="用户名" >
                        <el-input v-model="userData.username"></el-input>
                    </el-form-item>

                    <el-form-item label="公司名称" >
                        <el-input v-model="userData.company"></el-input>
                    </el-form-item>

                    <el-form-item label="个人介绍">
                        <el-input type="textarea" v-model="userData.introduction"></el-input>
                    </el-form-item>

                    <el-form-item>
                        <el-button type="primary" @click="userSubmit">修改</el-button>
                        <el-button>取消</el-button>
                    </el-form-item>
            </el-form>

            </div>


            <div class="user-main-middle-right">
                <template>
                    <div class="demo-fit">
                        <div class="block">
                            <c:if test="${!empty sessionScope.presentUser.img}">
                                <el-avatar shape="circle" :size="100" :fit="fill" src="${pageContext.request.contextPath}/avatar/${sessionScope.presentUser.img}"></el-avatar>
                            </c:if>
                            <c:if test="${empty sessionScope.presentUser.img}">
                                <el-avatar shape="circle" :size="100" :fit="fill" :src="url"></el-avatar>
                            </c:if>

                        </div>
                    </div>
                </template>

                <form action="${pageContext.request.contextPath}/user/upload" method="post" id="click" enctype="multipart/form-data">
                    <input type="file" name="file" id="file">
                    <a href="#" onclick="document.getElementById('click').submit();return false;">
                        <el-button type="primary">上传<i class="el-icon-upload el-icon--right"></i></el-button>
                    </a>
                </form>

            </div>


        </div>


    </div>


</div>

</body>

<script>
    new Vue({
        el: '#app',
        data: {
            message: '',
            userData:{
                username:'',
                company:'',
                introduction:'',
            },
            url: 'https://fuss10.elemecdn.com/e/5d/4a731a90594a4af544c0c25941171jpeg.jpeg',
            file:document.getElementById('file')
        },
        methods:{
            userSubmit() {
                axios({
                    method: 'post',
                    url: '${pageContext.request.contextPath}/user/update',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    data: {
                        username:this.userData.username,
                        company:this.userData.company,
                        introduction:this.userData.introduction,
                    }
                }).then(function (suc) {
                    if (suc.data.code === 1){
                        alert("修改成功！")
                    }else
                        alert(suc.data.msg)
                }).catch(function (err) {
                    alert(err)
                });
            },
        },
        mounted:{
            alert(data) {

            }
        }
    });
</script>

<%--<script type="module">
    export default {
        data() {
            return {
                input: '',
                form: {
                    name: '',
                    region: '',
                    date1: '',
                    date2: '',
                    delivery: false,
                    type: [],
                    resource: '',
                    desc: ''
                },
            };
        },
        methods: {
            handleOpen(key, keyPath) {
                console.log(key, keyPath);
            },
            handleClose(key, keyPath) {
                console.log(key, keyPath);
            },
            onSubmit() {
                console.log('submit!');
            }
        }
    };

</script>


<script>
    new Vue().$mount('#app')
</script>--%>

</html>
