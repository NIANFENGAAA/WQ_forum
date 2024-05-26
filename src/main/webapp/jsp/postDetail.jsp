<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>帖子标题</title>
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
    .post-main-box{
        margin-top: 62px;
        width: 100%;
        height: auto;
        background: #f2f3f5;
        float: left;
    }

    .post-main-left{
        /*border: 1px solid rgb(10, 10, 10);*/
        float: left;
        margin-top: 50px;
        margin-left: 170px;
        height: 500px;
        width: 80px;
        /*box-shadow: 0 2px 4px rgba(0, 0, 0, .12), 0 0 6px rgba(0, 0, 0, .04);*/

    }
    .post-main-left-child{
        /*border: 1px solid rgb(10, 10, 10);*/
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
    .post-main-middle{
        /*border: 1px solid rgb(10, 10, 10);*/
        float: left;
        margin-top: 10px;
        margin-left: 20px;
        height: auto;
        width: 750px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, .12), 0 0 6px rgba(0, 0, 0, .04);
        background: white;
        border-radius: 5px; /* 设置圆角的半径为10px */
    }
    .post-main-middle-up{
        /*border: 1px solid rgb(10, 10, 10);*/
        float: left;
        margin-top: 30px;
        margin-left: 30px;
        height: 100px;
        width: 690px;
        background: white;
    }
    .post-main-middle-message{
        /*border: 1px solid rgb(10, 10, 10);*/
        float: left;
        margin-top: 10px;
        margin-left: 30px;
        height: 25px;
        width: 690px;
        background: white;
    }
    .set-icon{
        font-size: 12px;
    }
    .post-main-middle-content{
        /*border: 1px solid rgb(10, 10, 10);*/
        float: left;
        margin-top: 10px;
        margin-left: 30px;
        height: auto;
        width: 690px;
        background: white;
    }

    .post-main-right{
        /*border: 1px solid rgb(10, 10, 10);*/
        float: left;
        margin-top: 10px;
        margin-left: 20px;
        height: 200px;
        width: 275px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, .12), 0 0 6px rgba(0, 0, 0, .04);
        background: white;
        border-radius: 5px; /* 设置圆角的半径为10px */
    }
    .post-main-right-up{
        /*border: 1px solid rgb(10, 10, 10);*/
        float: left;
        margin-top: 10px;
        margin-left: 10px;
        height: 60px;
        width: 255px;
    }
    .post-main-right-up-avatar{
        /*border: 1px solid rgb(10, 10, 10);*/
        float: left;
        margin-top: 3px;
        margin-left: 2px;
        height: 54px;
        width: 54px;
    }
    .post-main-right-up-name{
        /*border: 1px solid rgb(10, 10, 10);*/
        float: left;
        margin-top: 3px;
        margin-left: 2px;
        height: 35px;
        width: 160px;
    }
    .post-main-right-middle{
        /*border: 1px solid rgb(10, 10, 10);*/
        float: left;
        margin-top: 5px;
        margin-left: 10px;
        height: 60px;
        width: 255px;
    }
    .post-main-right-middle-demo1{
        /*border: 1px solid rgb(10, 10, 10);*/
        float: left;
        margin-top: 2px;
        margin-left: 30px;
        height: 56px;
        width: 80px;
    }
    .post-main-right-middle-demo2{
        /*border: 1px solid rgb(10, 10, 10);*/
        float: left;
        margin-top: 2px;
        margin-left: 30px;
        height: 56px;
        width: 80px;
    }
    .post-main-right-down{
        /*border: 1px solid rgb(10, 10, 10);*/
        float: left;
        margin-top: 5px;
        margin-left: 10px;
        height: 55px;
        width: 255px;
    }
    .post-main-right-down-demo1{
        /*border: 1px solid rgb(10, 10, 10);*/
        float: left;
        margin-top: 2px;
        margin-left: 10px;
        height: 41px;
        width: 100px;
    }
    .post-main-right-down-demo2{
        /*border: 1px solid rgb(10, 10, 10);*/
        float: left;
        margin-top: 2px;
        margin-left: 20px;
        height: 41px;
        width: 100px;
    }
    .user-button{
        height: 41px;
        width: 100px;
    }
    .img{
        width: 600px;
        height: auto;
    }

    .post-main-footer{
        /*border: 1px solid rgb(10, 10, 10);*/
        float: left;
        margin-top: 50px;
        margin-left: 272px;
        height: auto;
        width: 750px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, .12), 0 0 6px rgba(0, 0, 0, .04);
        background: white;
        border-radius: 5px; /* 设置圆角的半径为10px */
    }
    .post-main-footer-commentLine{
        /*border: 1px solid rgb(10, 10, 10);*/
        float: left;
        margin-top: 30px;
        margin-left: 30px;
        height: 30px;
        width: 690px;
    }
    .post-main-footer-comment-add{
        /*border: 1px solid rgb(10, 10, 10);*/
        float: left;
        margin-top: 40px;
        margin-left: 30px;
        height: 200px;
        width: 690px;
    }

    .post-main-footer-comment-add-avatar{
        /*border: 1px solid rgb(10, 10, 10);*/
        float: left;
        margin-top: 0;
        margin-left: 0;
        height: 50px;
        width: 50px;
    }
    .post-comment-avatar{
        width: 50px;
        height: 50px;
    }
    .post-main-footer-comment-add-content{
        /*border: 1px solid rgb(10, 10, 10);*/
        float: left;
        margin-top: 0;
        margin-left: 10px;
        height: 150px;
        width: 600px;
    }
    .post-main-footer-comment-add-content-button{
        /*border: 1px solid rgb(10, 10, 10);*/
        float: left;
        margin-top: 50px;
        margin-left: 500px;
        height: 30px;
        width: 65px;
    }
    .add-content-button-size{
        height: 30px;
        width: 65px;
    }
    .post-main-footer-othersUser-comment{
        /*border: 1px solid rgb(10, 10, 10);*/
        float: left;
        margin-top: 1px;
        margin-left: 30px;
        height: 100px;
        width: 690px;
    }
    .post-main-footer-othersUser-comment-avatar{
        /*border: 1px solid rgb(10, 10, 10);*/
        float: left;
        margin-top: 0;
        margin-left: 0;
        height: 50px;
        width: 50px;
    }
    .post-main-footer-othersUser-comment-avatar-size{
        height: 50px;
        width: 50px;
    }
    .post-main-footer-othersUser-comment-username{
        /*border: 1px solid rgb(10, 10, 10);*/
        float: left;
        margin-top: 0;
        margin-left: 5px;
        height: 25px;
        width: 300px;
    }
    .post-main-footer-othersUser-comment-content{
        /*border: 1px solid rgb(10, 10, 10);*/
        float: left;
        margin-top: 5px;
        margin-left: 5px;
        height: auto;
        width: 600px;
    }
    .post-main-footer-othersUser-comment-footer{
        /*border: 1px solid rgb(10, 10, 10);*/
        float: left;
        margin-top: 10px;
        margin-left: 5px;
        height: 25px;
        width: 600px;
        line-height:25px;
    }

</style>

<body>

<script src="//unpkg.com/vue@2/dist/vue.js"></script>
<script src="//unpkg.com/element-ui@2.15.14/lib/index.js"></script>
<script src="https://cdn.jsdelivr.net/npm/axios@0.21.1/dist/axios.min.js"></script>


<div id="app">


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
                <el-dropdown split-button type="primary" onclick = "window.location.href = '${pageContext.request.contextPath}/goUserData?userId=${sessionScope.presentUser.id}' ">
                    个人中心&nbsp;
                    <el-dropdown-menu slot="dropdown">
                        <el-dropdown-item onclick = "window.location.href = '${pageContext.request.contextPath}/goIndex' ">首页</el-dropdown-item>
                        <el-dropdown-item onclick = "window.location.href = '${pageContext.request.contextPath}/goUserHomepage?userId=${sessionScope.presentUser.id}' ">个人主页</el-dropdown-item>
                        <el-dropdown-item onclick = "window.location.href = '${pageContext.request.contextPath}/goWritePost' ">写文章</el-dropdown-item>
                        <el-dropdown-item onclick = "window.location.href = '${pageContext.request.contextPath}' ">私信</el-dropdown-item>
                    </el-dropdown-menu>
                </el-dropdown>
                <%--<el-button type="primary">个人中心</el-button>--%>
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

    <div class="post-main-box">

        <div class="post-main-left">
            <div class="post-main-left-child">
                <el-button type="primary" icon="el-icon-top" circle
                           @click="buttonSuccess(); updateGood(${sessionScope.presentPost.post_id},${sessionScope.presentPost.good_status})"></el-button>
            </div>
            <div class="post-main-left-child">
                <el-button type="success" icon="el-icon-chat-round" circle></el-button>
            </div>
            <div class="post-main-left-child">
                <el-button type="warning" icon="el-icon-star-off" circle
                           @click="buttonSuccess(); updateStar(${sessionScope.presentPost.post_id},${sessionScope.presentPost.star_status})"></el-button>
            </div>
<%--            <div class="post-main-left-child">--%>
<%--                <el-button type="danger" icon="el-icon-warning" circle></el-button>--%>
<%--            </div>--%>
        </div>

        <div class="post-main-middle">
            <%--标题--%>
            <div class="post-main-middle-up">
                <h1 style="margin-top: 0">${sessionScope.presentPost.post_title}</h1>
            </div>
                <%--帖子相关信息--%>
            <div class="post-main-middle-message">
                <span style="font-size: smaller">${sessionScope.presentPost.user.username}</span>
                <el-divider direction="vertical"></el-divider>
                <span style="font-size: smaller">${sessionScope.presentPost.post_create_time}</span>
                <el-divider direction="vertical"></el-divider>
                <i class="el-icon-view set-icon"></i>
                <span style="font-size: smaller">${sessionScope.presentPost.view_volume}</span>
            </div>

            <%--帖子内容--%>
            <div class="post-main-middle-content">
                <c:out value="${sessionScope.presentPost.post_content}" escapeXml="false"/>
            </div>
        </div>

        <div class="post-main-right">
            <div class="post-main-right-up">
                <div class="post-main-right-up-avatar" onclick="window.location.href = '${pageContext.request.contextPath}/goUserHomepage?userId=${sessionScope.presentPost.user.id}' ">
                    <el-avatar :size="50" src="${pageContext.request.contextPath}/avatar/${sessionScope.presentPost.user.img}"></el-avatar>
                </div>
                <div class="post-main-right-up-name">
                    <h4 style="margin: 0">${sessionScope.presentPost.user.username}</h4>
                </div>
            </div>

            <div class="post-main-right-middle">
                <div class="post-main-right-middle-demo1">
                    &nbsp;${sessionScope.presentPost.post_quantity}<br>
                    <el-link :underline="false">文章</el-link>
                </div>
                <div class="post-main-right-middle-demo2">
                    &nbsp;${sessionScope.presentPost.fans_quantity}<br>
                    <el-link :underline="false">粉丝</el-link>
                </div>
            </div>

            <div class="post-main-right-down">
                <div class="post-main-right-down-demo1">
                    <c:if test="${sessionScope.presentPost.fans_status == false}">
                        <el-button type="primary" size="medium" class="user-button" @click="addFollow(${sessionScope.presentPost.user.id}); open2()">关注</el-button>
                    </c:if>
                    <c:if test="${sessionScope.presentPost.fans_status == true}">
                        <el-button type="primary" plain size="medium" class="user-button" @click="cancelFollow(${sessionScope.presentPost.user.id}); open1()">已关注</el-button>
                    </c:if>
                </div>
                <div class="post-main-right-down-demo2">
                    <el-button type="info" plain class="user-button">私信</el-button>
                </div>
            </div>
        </div>

        <div class="post-main-footer">
            <div class="post-main-footer-commentLine">
                <h3 style="margin: 0;" >评论</h3>
            </div>

            <div class="post-main-footer-comment-add">
                <div class="post-main-footer-comment-add-avatar">
                    <c:if test="${!empty sessionScope.presentUser}">
                        <el-avatar src="${pageContext.request.contextPath}/avatar/${sessionScope.presentUser.img}" class="post-comment-avatar" ></el-avatar>
                    </c:if>
                    <c:if test="${empty sessionScope.presentUser}">
                        <el-avatar src="https://cube.elemecdn.com/0/88/03b0d39583f48206768a7534e55bcpng.png" class="post-comment-avatar"></el-avatar>
                    </c:if>
                </div>

                <div class="post-main-footer-comment-add-content">
                    <el-input v-model="commentContent"
                              placeholder="平等表达，友善交流"
                              maxlength="100"
                              type="textarea"
                              show-word-limit
                    >
                    </el-input>

                    <div class="post-main-footer-comment-add-content-button">
                        <el-button type="primary" class="add-content-button-size" @click="sendComment(); buttonSuccess()">发送</el-button>
                    </div>
                </div>
            </div>

            <c:forEach items="${sessionScope.presentPost.commentList}" var="comment">
                <div class="post-main-footer-othersUser-comment">
                    <div class="post-main-footer-othersUser-comment-avatar">
                        <el-avatar src="${pageContext.request.contextPath}/avatar/${comment.user.img}"
                                   class="post-main-footer-othersUser-comment-avatar-size"
                                   onclick="window.location.href = '${pageContext.request.contextPath}/goUserHomepage?userId=${comment.user.id}' "></el-avatar>
                    </div>
                    <div class="post-main-footer-othersUser-comment-username">
                        <p style="margin: 0;">
                                ${comment.user.username}
                        </p>
                    </div>
                    <div class="post-main-footer-othersUser-comment-content">
                        <p style="margin: 0; font-size: 10px;">
                                ${comment.comment.comment_content}
                        </p>
                    </div>
                    <div class="post-main-footer-othersUser-comment-footer">
                        <span style="margin: 0; font-size: 10px;"><el-link>${comment.comment.comment_time}</el-link></span>
                        <el-divider direction="vertical"></el-divider>
                        <%--点赞--%>
                        <c:if test="${comment.goodStatus == true}">
                            <%--已点赞--%>
                            <span style="margin: 0; font-size: 10px;"><el-link @click="buttonSuccess(); deleteGoodComment(${comment.comment.comment_id});"><i class="el-icon-thumb" style="color: red"></i>${comment.comment.comment_good}</el-link></span>
                        </c:if>
                        <c:if test="${comment.goodStatus == false}">
                            <%--已点赞--%>
                            <span style="margin: 0; font-size: 10px;"><el-link @click="buttonSuccess(); addGoodComment(${comment.comment.comment_id});"><i class="el-icon-thumb"></i>${comment.comment.comment_good}</el-link></span>
                        </c:if>

                        <el-divider direction="vertical"></el-divider>
                        <span style="margin: 0; font-size: 10px;"><el-link @click="reportFormVisible = true">举报</el-link></span>

                        <el-dialog title="举报" :visible.sync="reportFormVisible">
                            <el-form :model="form">
                                <h3>请选择投诉原因：</h3>
                                <br>
                                <div>
                                    <h3>内容违规</h3>

                                    <el-radio-group v-model="radio1" style="margin-left: 50px">
                                        <el-radio :label="1">色情低俗</el-radio>
                                        <el-radio :label="2">营销广告</el-radio>
                                        <el-radio :label="3">信息诈骗</el-radio>
                                        <el-radio :label="4">政治敏感</el-radio>
                                    </el-radio-group>

                                    <h3>缺乏友善</h3>

                                    <el-radio-group v-model="radio2" style="margin-left: 50px">
                                        <el-radio :label="1">性别对立</el-radio>
                                        <el-radio :label="2">恶意诋毁</el-radio>
                                        <el-radio :label="3">引战、制造冲突</el-radio>
                                        <el-radio :label="4">人身攻击</el-radio>
                                    </el-radio-group>

                                    <h3>侵犯权益</h3>
                                    <el-radio-group v-model="radio3" style="margin-left: 50px">
                                        <el-radio :label="1">侵犯名誉/隐私/著作/肖像权等</el-radio>
                                    </el-radio-group>

                                    <h3>其他原因</h3>
                                    <el-radio-group v-model="radio4" style="margin-left: 50px">
                                        <el-radio :label="1">其他原因</el-radio>
                                        <el-radio :label="2">恶意诋毁</el-radio>
                                        <el-radio :label="3">引战、制造冲突</el-radio>
                                        <el-radio :label="4">人身攻击</el-radio>
                                    </el-radio-group>

                                </div>
                            </el-form>
                            <div slot="footer" class="dialog-footer">
                                <el-button @click="reportFormVisible = false">取 消</el-button>
                                <el-button type="primary" @click="reportFormVisible = false; TestAlert()">确 定</el-button>
                            </div>
                        </el-dialog>
                    </div>
                </div>
            </c:forEach>


        </div>

    </div>


</div>

</body>
<script>
    new Vue({
        el:"#app",
        data:{
            input: '',
            commentContent: '',
            reportFormVisible: false,
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
            formLabelWidth: '120px',
            radio1:'',
            radio2:'',
            radio3:'',
            radio4:'',
        },
        methods: {
            cancelFollow(userId){
                axios.get('${pageContext.request.contextPath}/user/cancelFollow',{
                    params:{
                        param1:userId,
                    }
                }).then(function (suc) {
                    if (suc.data.code === 1){
                        window.history.go(0);
                    }
                }).catch(function (err) {
                    alert(err)
                })
            },
            addFollow(userId){
                axios.get('${pageContext.request.contextPath}/user/addFollow',{
                    params:{
                        param1:userId,
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
            buttonSuccess() {
                this.$message({
                    message: '操作成功！',
                    type: 'success'
                });
            },
            open1() {
                this.$message({
                    message: '大胆，还敢取消！',
                    type: 'success'
                });
            },
            TestAlert(){
                alert(this.radio1);
            },
            sendComment(){
                axios.get('${pageContext.request.contextPath}/user/addComment',{
                    params:{
                        commentContent:this.commentContent,
                        presentPostId:${sessionScope.presentPost.post_id},
                    }
                }).then(function (suc) {
                    if (suc.data.code === 1){
                        window.history.go(0);
                    }
                })
            },
            addGoodComment(commentId){
                axios.get('${pageContext.request.contextPath}/user/addGoodComment',{
                    params:{
                        commentId:commentId,
                    }
                }).then(function (suc) {
                    if (suc.data.code === 1){
                        window.history.go(0);
                    }
                })
            },
            deleteGoodComment(commentId){
                axios.get('${pageContext.request.contextPath}/user/deleteGoodComment',{
                    params:{
                        commentId:commentId,
                    }
                }).then(function (suc) {
                    if (suc.data.code === 1){
                        window.history.go(0);
                    }
                })
            },
            updateGood(postId,good){
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
            updateStar(postId,star){
                axios.get('${pageContext.request.contextPath}/post/updateStar',{
                    params:{
                        postId:postId,
                        star:star,
                    }
                }).then(function (suc) {
                    if (suc.data.code === 1){
                        window.history.go(0);
                    }
                }).catch(function (err) {
                    alert(err)
                })
            }

        },

    })


</script>

</html>
