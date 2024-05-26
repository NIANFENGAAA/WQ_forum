<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Vue in JSP</title>
    <script src="https://cdn.jsdelivr.net/npm/vue@2.6.14/dist/vue.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>

</head>
<style>
    @import url("//unpkg.com/element-ui@2.15.14/lib/theme-chalk/index.css");
</style>
<body>

<script src="//unpkg.com/vue@2/dist/vue.js"></script>
<script src="//unpkg.com/element-ui@2.15.14/lib/index.js"></script>
<script src="../js/axios-0.18.0.js"></script>

<div id="app">

    <input type="button" value="发送get请求"  onclick ="submitPost()">






</div>

<script>

    const axios = require('axios')

    new Vue({
        el: '#app',
        data: {

        },
        methods:{
            submitPost(){
                axios.get('${pageContext.request.contextPath}/post/test').then(response => {
                    alert("666");
                    alert(response.data.data)
                }).catch(err => {
                    alert("000")
                })
            }
        }
    });
</script>

</body>
</html>