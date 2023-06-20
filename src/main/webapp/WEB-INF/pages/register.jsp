<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    <link rel="stylesheet" href="https://cdn.staticfile.org/font-awesome/4.7.0/css/font-awesome.css">
    <link rel="stylesheet" href="/CSS/171.css">
</head>
<body>
<form action="/register" method="post">
    <div class="container">
        <h1>注册</h1>
        <div class="ipt-box">
            <input type="text" placeholder="账号" autocomplete="off" name="username" id="nameIpt">
        </div>
        <span id="info"></span>
        <div class="ipt-box">
            <input type="password" id="password" placeholder="密码" autocomplete="off" name="password">
            <i class="eye fa fa-eye-slash"></i>
            <div class="beam"></div>
        </div>
        <input id="subBtn" type="submit" disabled="true" class="btn-login" value="注册"/>
    </div>
</form>

<%--用户名输入完毕后   直接提示用户   用户名是否可以使用
       ajax   第三方库jquery  axios--%>
<script>

    let nameIpt = document.querySelector("#nameIpt")
    // onblur 失去焦点     onfocus  获得焦点
    nameIpt.onblur = function () {
        let username = nameIpt.value
        // console.log(username)
        axios.get("/checkUsername?username=" + username).then(res => {
           if (res.data==true){//用户存在
               document.querySelector("#info").innerHTML="用户名重复"
               document.querySelector("#subBtn").disabled = true
           }else {
               document.querySelector("#info").innerHTML="用户名可以使用"
               document.querySelector("#subBtn").disabled = false
           }
        })
    }

</script>

</body>
</html>
<script src="/js/171.js"></script>
