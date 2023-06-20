<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/font-awesome/4.7.0/css/font-awesome.css">
    <link rel="stylesheet" href="/CSS/171.css">
</head>
<body>


<%--<form action="/login" method="post">--%>
<%--    &lt;%&ndash;    <input type="text" name="id">&ndash;%&gt;--%>
<%--    用户：<input type="text" name="username"><br>--%>
<%--    密码：<input type="password" name="password"><br>--%>
<%--    <input type="submit" value="登录"/>--%>
<%--</form >--%>
<form action="/login" method="post">
<div class="container">
    <h1>登录</h1>
    <div class="ipt-box">
        <input type="text" placeholder="账号" autocomplete="off" name="username">
    </div>
    <div class="ipt-box">
        <input type="password" id="password" placeholder="密码" autocomplete="off" name="password">
        <i class="eye fa fa-eye-slash"></i>
        <div class="beam"></div>
    </div>
    <button class="btn-login" type="submit" >登录</button>
<%--    <a>没有账号</a>--%>
</div>
</form>
</body>
</html>
<script src="/js/171.js"></script>

<c:if test="${loginfail}">
<script>
    alert("用户名或密码错误")
</script>
</c:if>

<c:if test="${loginInfo}">
    <script>
        alert("还未登录")
    </script>
</c:if>
