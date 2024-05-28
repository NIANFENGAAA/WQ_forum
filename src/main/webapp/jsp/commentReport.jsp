<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>举报评论</title>
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
        /*border: 1px solid rgb(10, 10, 10);*/
        float: left;
        margin-top: 50px;
        margin-left: 180px;
        height: 800px;
        width: 250px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, .12), 0 0 6px rgba(0, 0, 0, .04)
    }
    .user-main-middle-report{
        /*border: 1px solid rgb(10, 10, 10);*/
        float: left;
        margin-top: 50px;
        margin-left: 400px;
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
    .report-main-child{
        /*border: 1px solid rgb(10, 10, 10);*/
        float: left;
        margin-top: 20px;
        height: 50px;
        width: 900px;
        line-height: 50px;
    }
    .report-main-text{
        /*border: 1px solid rgb(10, 10, 10);*/
        float: left;
        margin-top: 20px;
        height: 200px;
        width: 500px;
    }
    .report-main-footer{
        /*border: 1px solid rgb(10, 10, 10);*/
        float: left;
        margin-top: 20px;
        height: 40px;
        width: 900px;
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

        <div class="user-main-middle-report">
            <div class="user-main-middle-header">
                <h3>举报评论</h3>
                <el-divider></el-divider>
            </div>

            <div class="report-main-child">
                &nbsp;&nbsp;内容违规:&nbsp;&nbsp;&nbsp;&nbsp;
                <el-radio v-model="radio1" label="1">色情低俗</el-radio>
                <el-radio v-model="radio1" label="2">营销广告</el-radio>
                <el-radio v-model="radio1" label="3">信息诈骗</el-radio>
                <el-radio v-model="radio1" label="4">政治敏感</el-radio>
            </div>

            <div class="report-main-child">
                &nbsp;&nbsp;缺乏友善:&nbsp;&nbsp;&nbsp;&nbsp;
                <el-radio v-model="radio2" label="1">性别对立</el-radio>
                <el-radio v-model="radio2" label="2">恶意诋毁</el-radio>
                <el-radio v-model="radio2" label="3">引战冲突</el-radio>
                <el-radio v-model="radio2" label="4">人身攻击</el-radio>
            </div>

            <div class="report-main-child">
                &nbsp;&nbsp;侵犯权益:&nbsp;&nbsp;&nbsp;&nbsp;
                <el-radio v-model="radio3" label="1">侵犯名誉/隐私/著作/肖像权等</el-radio>
            </div>

            <div class="report-main-child">
                &nbsp;&nbsp;其他原因:&nbsp;&nbsp;&nbsp;&nbsp;
                <el-radio v-model="radio4" label="1">其他原因</el-radio>
            </div>

            <div class="report-main-text">
                &nbsp;&nbsp;补充说明：<br><br>
                <el-input
                        type="textarea"
                        placeholder="请输入举报相关的补充说明"
                        v-model="textarea"
                        maxlength="100"
                        show-word-limit
                >
                </el-input>
            </div>

            <div class="report-main-footer">
                <el-button style="margin-left: 200px" onclick="window.history.go(-1);">取消</el-button>
                <el-button type="primary" style="margin-left: 300px" @click="submitReportComment();">确认</el-button>
            </div>



        </div>


    </div>


</div>

</body>

<script>
    new Vue({
        el: '#app',
        data: {
            input:'',
            radio1: '0',
            radio2: '0',
            radio3: '0',
            radio4: '0',
            textarea: '',

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
                        alert("修改成功！");
                        window.history.go(0);
                    }else
                        alert(suc.data.msg)
                }).catch(function (err) {
                    alert(err)
                });
            },
            submitReportComment(){
                axios({
                    method: 'post',
                    url: '${pageContext.request.contextPath}/submitReportComment',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    data: {
                        content_violation:this.radio1,
                        lack_friendliness:this.radio2,
                        violate_equity:this.radio3,
                        other_reasons:this.radio4,
                        text:this.textarea,
                    }
                }).then(function (suc) {
                    if (suc.data.code === 1){
                        alert("提交成功，请待管理员审核！");
                        window.history.go(0);
                    }else
                        alert(suc.data.msg)
                }).catch(function (err) {
                    alert(err)
                });
            }
        }
    });
</script>


</html>
