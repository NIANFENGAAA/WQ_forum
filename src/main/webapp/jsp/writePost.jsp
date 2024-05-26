<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>写文章</title>
    <style>
        @import url("//unpkg.com/element-ui@2.15.14/lib/theme-chalk/index.css");
        .post-title{
            border: 1px solid rgb(10, 10, 10);
            float: left;
            height: 70px;
            width: 100%;
            box-shadow: 0 2px 4px rgba(0, 0, 0, .12), 0 0 6px rgba(0, 0, 0, .04);
        }
        .post-title-detail{
            /*border: 1px solid rgb(10, 10, 10);*/
            float: left;
            margin-top: 10px;
            margin-left: 10px;
            height: 50px;
            width: 600px;
        }
        .post-title-detail-input{
            height: 45px;
            width: 550px;
        }
        .form-img{
            border: 1px solid rgb(10, 10, 10);
            float: left;
            margin-top: 0;
            margin-left: 70px;
            height: 100px;
            width: 170px;
        }
    </style>
</head>
<body>
<script src="//unpkg.com/vue@2/dist/vue.js"></script>
<script src="//unpkg.com/element-ui@2.15.14/lib/index.js"></script>
<script src="https://cdn.jsdelivr.net/npm/axios@0.21.1/dist/axios.min.js"></script>
<link href="${pageContext.request.contextPath}/editormd/css/editormd.min.css" rel="stylesheet" type="text/css" />
<script src="https://cdn.bootcss.com/jquery/3.2.0/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/editormd/editormd.js"></script>
<script src="${pageContext.request.contextPath}/editormd/editormd.amd.js"></script>
<div id="app">



<div class="post-title">
    <div class="post-title-detail">
        <input id="title" name="title" class="post-title-detail-input" placeholder="请输入标题..." style="border: 0">
    </div>
</div>

<!-- editormd start -->
<div class="editormd form-control" style="margin: 0px;" id="test-editormd">

        <textarea class="editormd-markdown-textarea" name="test-editormd-markdown-doc" id="editormd"></textarea>
        <!-- 第二个隐藏文本域，用来构造生成的HTML代码，方便表单POST提交，这里的name可以任意取，后台接受时以这个name键为准 -->
        <!-- html textarea 需要开启配置项 saveHTMLToTextarea == true -->
        <textarea class="editormd-html-textarea" name="editorhtml" id="editorhtml"></textarea>
</div>
        <!-- editormd end -->
    <el-button type="primary" onclick = "window.location.href = '${pageContext.request.contextPath}/goIndex' ">首页</el-button>
    <el-button type="primary" @click="dialogFormVisible = true">发布</el-button>

    <el-dialog title="发布文章" :visible.sync="dialogFormVisible" style="margin: 0">
        <el-divider></el-divider>
        <el-form :model="form">
            分类：
            <template>
                <el-radio v-model="form.radio" label="1">综合</el-radio>
                <el-radio v-model="form.radio" label="2">后端</el-radio>
                <el-radio v-model="form.radio" label="3">前端</el-radio>
                <el-radio v-model="form.radio" label="4">Android</el-radio>
                <el-radio v-model="form.radio" label="5">iOS</el-radio>
                <el-radio v-model="form.radio" label="6">人工智能</el-radio>

            </template>
            <br>
            <br>
        </el-form>
        <div slot="footer" class="dialog-footer">
            <el-button @click="dialogFormVisible = false">取 消</el-button>
            <el-button type="primary" @click="dialogFormVisible = false;formSubmit();">确认发布</el-button>
        </div>

    </el-dialog>



</div>
<script>
    var testEditor;
    testEditor=$(function() {
        editormd("test-editormd", {
            width   : "100%",
            height  : 340,
            codeFold : true,
            syncScrolling : "single",
            //你的lib目录的路径
            path    : "${pageContext.request.contextPath}/editormd/lib/",
            imageUpload: false,//关闭图片上传功能
            emoji: false,
            taskList: true,
            tocm: true,         // Using [TOCM]
            tex: true,                   // 开启科学公式TeX语言支持，默认关闭
            flowChart: true,             // 开启流程图支持，默认关闭
            sequenceDiagram: true,       // 开启时序/序列图支持，默认关闭,
            saveHTMLToTextarea : true
        });
    });
</script>
</body>

<script>
    new Vue({
        el: '#app',
        data: {
            dialogFormVisible: false,
            form: {
                radio: '1',
            },
            formLabelWidth: '120px',
        },
        methods:{
            formSubmit(){
                axios({
                    method: 'post',
                    url: '${pageContext.request.contextPath}/addPost',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    data: {
                        post_category_id:this.form.radio,
                        post_title:document.getElementById("title").value,
                        post_content:document.getElementById("editorhtml").value,
                    }
                }).then(function (suc) {
                    if (suc.data.code === 1){
                        alert("文章添加成功，请等待管理员审核！")
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


</html>
