<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>个人资料</title>
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
    .user-main-middle-child{
        /*border: 1px solid rgb(10, 10, 10);*/
        float: left;
        margin-top: 20px;
        margin-left: 1px;
        height: 50px;
        width: 898px;
    }
    .user-main-middle-child-left{
        /*border: 1px solid rgb(10, 10, 10);*/
        float: left;
        margin-top: 4px;
        margin-left: 15px;
        height: 42px;
        width: 270px;
        line-height:42px;
    }
    .user-main-middle-child-right{
        /*border: 1px solid rgb(10, 10, 10);*/
        float: left;
        margin-top: 4px;
        margin-left: 520px;
        width: auto;
        height: 42px;
        text-align: center;
        line-height:42px;
    }
    .horizontal_line{
        border: 1px solid rgb(10, 10, 10);
        float: left;
        margin-left: 10px;
        margin-top: 10px;
        width: 880px;
        height: 5px;
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

        <div class="user-main-left">
            <el-row class="tac">
                <el-col :span="22">
                    <el-menu
                            default-active="2"
                            class="el-menu-vertical-demo"
                            @open="handleOpen"
                            >
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
                <h3>账号设置</h3>
                <el-divider></el-divider>
            </div>

            <div class="user-main-middle-child">
                <div class="user-main-middle-child-left">手机:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<c:if
                        test="${!empty sessionScope.presentUser.phone}">
                    ${sessionScope.presentUser.phone}
                </c:if>
                    <c:if test="${empty sessionScope.presentUser.phone}">暂未绑定</c:if>
                </div>

                <div class="user-main-middle-child-right">
                    <el-link type="primary" @click="phoneDialogFormVisible = true">修改号码</el-link>

                    <el-dialog title="修改手机号码" :visible.sync="phoneDialogFormVisible" :before-close="handleClose">
                        <el-form :model="phoneForm">
                            <el-form-item label="新的手机号码" :label-width="phoneFormLabelWidth">
                                <el-input v-model="phoneForm.phone" autocomplete="off"></el-input>
                            </el-form-item>
                        </el-form>
                        <div slot="footer" class="dialog-footer">
                            <el-button @click="phoneDialogFormVisible = false">取 消</el-button>
                            <el-button type="primary" @click="phoneDialogFormVisible = false; phoneSubmit()">确 定</el-button>
                        </div>
                    </el-dialog>

                </div>
            </div>




            <div class="user-main-middle-child">
                <div class="user-main-middle-child-left">Email:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${sessionScope.presentUser.email}</div>

                <div class="user-main-middle-child-right">
                    <el-link type="primary" disabled>请先注销</el-link>
                </div>
            </div>

            <div class="user-main-middle-child">
                <div class="user-main-middle-child-left">密码:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;******</div>

                <div class="user-main-middle-child-right">
                    <el-link type="primary" @click="passwordDialogFormVisible = true">修改密码</el-link>

                    <el-dialog title="修改密码" :visible.sync="passwordDialogFormVisible" :before-close="handleClose">
                        <el-form :model="passwordForm">
                            <el-form-item label="新的密码" :label-width="passwordFormLabelWidth">
                                <el-input v-model="passwordForm.password" autocomplete="off"></el-input>
                            </el-form-item>
                        </el-form>
                        <div slot="footer" class="dialog-footer">
                            <el-button @click="passwordDialogFormVisible = false">取 消</el-button>
                            <el-button type="primary" @click="passwordDialogFormVisible = false; passwordSubmit()">确 定</el-button>
                        </div>
                    </el-dialog>

                </div>
            </div>

            <div class="user-main-middle-child">
                <div class="user-main-middle-child-left">账号注销</div>

                <div class="user-main-middle-child-right">
                    <el-link type="primary" @click="destructionDialogVisible = true">账号注销</el-link>
                    <el-dialog
                            title="提示"
                            :visible.sync="destructionDialogVisible"
                            width="30%">
                        <span>确定注销该账号吗？</span>
                        <span slot="footer" class="dialog-footer">
                            <el-button @click="destructionDialogVisible = false">取 消</el-button>
                            <a href="${pageContext.request.contextPath}/user/destruction">
                                <el-button type="primary" @click="destructionDialogVisible = false">确 定</el-button>
                            </a>

                        </span>
                    </el-dialog>
                </div>
            </div>

            <div class="user-main-middle-child">
                <div class="user-main-middle-child-left">退出登录</div>

                <div class="user-main-middle-child-right">
                    <el-link type="primary" @click="quitDialogVisible = true">点击退出</el-link>

                    <el-dialog
                            title="提示"
                            :visible.sync="quitDialogVisible"
                            width="30%">
                        <span>确定退出该账号吗？</span>
                        <span slot="footer" class="dialog-footer">
                            <el-button @click="quitDialogVisible = false">取 消</el-button>
                            <a href="${pageContext.request.contextPath}/user/quit">
                                <el-button type="primary" @click="quitDialogVisible = false">确 定</el-button>
                            </a>
                        </span>
                    </el-dialog>
                </div>
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
                introduction:''
            },
            phoneDialogFormVisible: false,
            phoneForm: {
                phone: '',
            },
            phoneFormLabelWidth: '120px',
            passwordDialogFormVisible: false,
            passwordForm: {
                password: '',
            },
            passwordFormLabelWidth: '100px',
            destructionDialogVisible: false,
            quitDialogVisible:false,

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
            phoneSubmit(){
                axios({
                    method: 'post',
                    url: '${pageContext.request.contextPath}/user/update',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    data: {
                        phone:this.phoneForm.phone,
                    }
                }).then(function (succ) {
                    if (succ.data.code === 1){
                        alert("修改成功！");
                        window.history.go(0);
                    }else
                        alert(succ.data.msg);
                }).catch(function (err) {
                    alert(err)
                });
            },
            passwordSubmit(){
                axios({
                    method: 'post',
                    url: '${pageContext.request.contextPath}/user/update',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    data: {
                        password:this.passwordForm.password,
                    }
                }).then(function (suc) {
                    if (suc.data.code === 1){
                        alert("修改成功！")
                        window.location.href = '${pageContext.request.contextPath}/goRegister';
                    }else
                        alert(suc.data.msg);
                }).catch(function (err) {
                    alert(err)
                });
            },
            handleClose(done) {
                this.$confirm('确认关闭？')
                    .then(_ => {
                        done();
                    })
                    .catch(_ => {});
            },
        },
        mounted:{
            alert(data) {

            }
        }
    });
</script>


</html>
