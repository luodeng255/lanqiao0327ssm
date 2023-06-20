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
</head>
<body>


<form action="/register" method="post">
    <%--    <input type="text" name="id">--%>
    用户：<input id="nameIpt" type="text" name="username"><br>

    <span id="info"></span>


    <br>
    密码：<input type="password" name="password"><br>
    <input type="submit" value="注册"/>
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
            }else {
                document.querySelector("#info").innerHTML="用户名可以使用"

            }
        })
    }

</script>

</body>
</html>
