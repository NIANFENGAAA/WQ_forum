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
        /*border: 1px solid rgb(192, 6, 6);*/
        float: left;
        margin-top: 10px;
        margin-left: 150px;
        height: 600px;
        width: 1200px;
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
        width: 1200px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, .12), 0 0 6px rgba(0, 0, 0, .04);
    }

    .main-user-header-content {
        /*border: 1px solid rgb(10, 10, 10);*/
        float: left;
        margin-top: 3px;
        margin-left: 0;
        margin-bottom: 3px;
        height: 84px;
        width: 1200px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, .12), 0 0 6px rgba(0, 0, 0, .04);
    }

    .main-user-header-content:hover {
        background: #f2f3f5;
    }


    .main-user-header-username {
        /*border: 1px solid rgb(10, 10, 10);*/
        float: left;
        margin-top: 0;
        margin-left: 0;
        height: 60px;
        width: 200px;
    }
    .main-user-header-username-child {
        /*border: 1px solid rgb(10, 10, 10);*/
        float: left;
        margin-top: 0;
        margin-left: 0;
        height: 84px;
        width: 200px;
    }

    .main-user-header-email {
        /*border: 1px solid rgb(10, 10, 10);*/
        float: left;
        margin-top: 0;
        margin-left: 30px;
        height: 60px;
        width: 140px;
    }
    .main-user-header-email-child {
        /*border: 1px solid rgb(10, 10, 10);*/
        float: left;
        margin-top: 0;
        margin-left: 30px;
        height: 84px;
        width: 140px;
    }

    .main-user-header-status {
        /*border: 1px solid rgb(10, 10, 10);*/
        float: left;
        margin-top: 0;
        margin-left: 30px;
        height: 60px;
        width: 140px;
    }
    .main-user-header-status-child {
        /*border: 1px solid rgb(10, 10, 10);*/
        float: left;
        margin-top: 0;
        margin-left: 30px;
        height: 84px;
        width: 140px;
    }

    .main-user-header-operation {
        /*border: 1px solid rgb(10, 10, 10);*/
        float: left;
        margin-top: 0;
        margin-left: 30px;
        height: 60px;
        width: 170px;
    }
    .main-user-header-operation-child {
        /*border: 1px solid rgb(10, 10, 10);*/
        float: left;
        margin-top: 0;
        margin-left: 30px;
        height: 84px;
        width: 170px;
    }
    .main-user-header-operation-new{
        /*border: 1px solid rgb(10, 10, 10);*/
        float: left;
        margin-top: 0;
        margin-left: 20px;
        height: 60px;
        width: 220px;
    }
    .main-user-header-operation-new-child{
        /*border: 1px solid rgb(10, 10, 10);*/
        float: left;
        margin-top: 0;
        margin-left: 20px;
        height: 84px;
        width: 220px;
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
                            <el-menu-item index="1-1" @click="goAdminIndex()">用户管理</el-menu-item>
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

                    <el-menu-item index="3">
                        <i class="el-icon-warning"></i>
                        <span slot="title" onclick="window.location.href= '${pageContext.request.contextPath}/admin/getAllComment?currentPage=1';">举报处理</span>
                    </el-menu-item>

                    <el-menu-item index="4" @click="adminQuit()">
                        <i class="el-icon-setting"></i>
                        <span slot="title">退出登录</span>
                    </el-menu-item>
                </el-menu>

            </el-aside>

            <el-main>


                <div class="main-user">
                    <div class="main-user-header">
                        <div class="main-user-header-username">
                            被举报评论
                        </div>
                        <div class="main-user-header-email">
                            内容违规
                        </div>
                        <div class="main-user-header-status">
                            缺乏友善
                        </div>
                        <div class="main-user-header-operation">
                            侵犯权益
                        </div>
                        <div class="main-user-header-operation">
                            其他原因
                        </div>
                        <div class="main-user-header-operation-new">
                            操作
                        </div>
                    </div>

                    <%--每一页只能放六个--%>
                    <c:forEach items="${sessionScope.reportVoList}" var="reportVo">
                    <div class="main-user-header-content">
                        <div class="main-user-header-username-child">
                            <p style="margin: 0; font-size: 10px; line-height: 12px">
                                ${reportVo.comment.comment_content}
                            </p>
                        </div>
                        <div class="main-user-header-email-child">
                            <c:if test="${reportVo.report.content_violation == 0}">
                                暂无
                            </c:if>
                            <c:if test="${reportVo.report.content_violation == 1}">
                                色情低俗
                            </c:if>
                            <c:if test="${reportVo.report.content_violation == 2}">
                                营销广告
                            </c:if>
                            <c:if test="${reportVo.report.content_violation == 3}">
                                信息诈骗
                            </c:if>
                            <c:if test="${reportVo.report.content_violation == 4}">
                                政治敏感
                            </c:if>
                        </div>
                        <div class="main-user-header-status-child">
                            <c:if test="${reportVo.report.lack_friendliness == 0}">
                                暂无
                            </c:if>
                            <c:if test="${reportVo.report.lack_friendliness == 1}">
                                性别对立
                            </c:if>
                            <c:if test="${reportVo.report.lack_friendliness == 2}">
                                恶意诋毁
                            </c:if>
                            <c:if test="${reportVo.report.lack_friendliness == 3}">
                                引战冲突
                            </c:if>
                            <c:if test="${reportVo.report.lack_friendliness == 4}">
                                人身攻击
                            </c:if>
                        </div>
                        <div class="main-user-header-operation-child">
                            <c:if test="${reportVo.report.violate_equity == 0}">
                                暂无
                            </c:if>
                            <c:if test="${reportVo.report.violate_equity == 1}">
                                侵犯名誉/隐私/著作/肖像权等
                            </c:if>
                        </div>
                        <div class="main-user-header-operation-child">
                            <c:if test="${reportVo.report.other_reasons == 0}">
                                暂无
                            </c:if>
                            <c:if test="${reportVo.report.other_reasons == 1}">
                                <p style="margin: 0; font-size: 10px; line-height: 12px">
                                        ${reportVo.report.text}
                                </p>
                            </c:if>

                        </div>
                        <div class="main-user-header-operation-new-child">
                            <el-button type="primary" @click="successReport(${reportVo.report.comment_id}); successButton()">通过</el-button>
                            <el-button type="warning" @click="refuseReport(${reportVo.report.report_id}); successButton();">驳回</el-button>
                        </div>
                    </div>
                    </c:forEach>


                </div>

                <div class="main-user-bottom">第
                    <c:forEach begin="1" end="${sessionScope.reportVoPageInfo.pages}" step="1" var="currentPage">
                        <a href="${pageContext.request.contextPath}/admin/getAllComment?currentPage=${currentPage}">${currentPage}</a>
                    </c:forEach>页
                    当前页：${sessionScope.reportVoPageInfo.pageNum}
                    总记录数：${sessionScope.reportVoPageInfo.total}
                    总页数：${sessionScope.reportVoPageInfo.pages}
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
            goAdminIndex(){
                axios.get('${pageContext.request.contextPath}/admin/getUserByUS',{
                    params:{
                        input:'',
                        optionValue:-1,
                    }
                }).then(function (suc) {
                    window.location.href="${pageContext.request.contextPath}/goAdminIndex";
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
            refuseReport(reportId){
                axios.get('${pageContext.request.contextPath}/admin/deleteReport',{
                    params:{
                        reportId:reportId,
                    }
                }).then(function (suc) {

                })
            },
            successReport(commentId){
                axios.get('${pageContext.request.contextPath}/admin/successReport',{
                    params:{
                        commentId:commentId,
                    }
                })
            }
        },


    })


</script>

</html>
