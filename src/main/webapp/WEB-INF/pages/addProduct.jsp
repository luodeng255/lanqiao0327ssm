    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 24991
  Date: 2023/4/10
  Time: 14:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <!-- 引入 layui.css -->
    <link rel="stylesheet" href="//unpkg.com/layui@2.6.8/dist/css/layui.css"/>
    <!-- 引入 layui.js -->
    <script src="//unpkg.com/layui@2.6.8/dist/layui.js"></script>
</head>
<body>
<form class="layui-form" action="addProduct" method="post">
    <h1>添加数据</h1>
    <div class="layui-form-item">
        <label class="layui-form-label">名称</label>
        <div class="layui-input-block">
            <input type="text" name="productName" required lay-verify="required" placeholder="请输入名称" autocomplete="off"
                   class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">分类</label>
        <div class="layui-input-block">
            <select name="categoryId" lay-verify="required">
                <c:forEach items="${categorys}" var="category">
                    <option value="${category.categoryId}">${category.categoryName}</option>
                </c:forEach>
            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">标题</label>
        <div class="layui-input-block">
            <input type="text" name="productTitle" required lay-verify="required" placeholder="请输入标题" autocomplete="off"
                   class="layui-input">
        </div>
    </div>

    <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">介绍</label>
        <div class="layui-input-block">
            <textarea name="productIntro" placeholder="请输入内容" class="layui-textarea"></textarea>
        </div>
    </div>
    <img id="uploadimg" src="/imgs/protectingShell-Mix-3-1.jpg" width="300px" height="300px">
    <hr>
    <input id="imgIpt" type="hidden" name="productPicture" value="">
    <!-- 传图片 -->
    <button type="button" class="layui-btn" id="upimg">
        <i class="layui-icon">&#xe67c;</i>上传图片
    </button>


    <div class="layui-form-item">
        <label class="layui-form-label">销售价格</label>
        <div class="layui-input-block">
            <input type="number" name="productSellingPrice" required lay-verify="required" placeholder="请输入销售价格"
                   autocomplete="off" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">数量</label>
        <div class="layui-input-block">
            <input type="number" name="productNum" required lay-verify="required" placeholder="请输入数量" autocomplete="off"
                   class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">销量</label>
        <div class="layui-input-block">
            <input type="number" name="productSales" required lay-verify="required" placeholder="请输入销量"
                   autocomplete="off" class="layui-input">
        </div>
    </div>


    <button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
    </div>
    </div>
</form>
</body>
<style>
    body {
        height: 600px;
        width: 500px;
        margin: 0 auto;
    }
</style>
<script>
    layui.use('upload', function () {
        var upload = layui.upload;

        //执行实例
        var uploadInst = upload.render({
            elem: '#upimg' //绑定元素
            , url: '/uploadImg' //上传接口
            , done: function (res) { 
                //上传完毕回调
                document.querySelector("#uploadimg").src = res.imgUrl
                document.querySelector("#imgIpt").value = res.imgUrl

            }
            , error: function () {
                //请求异常回调
                console.log("上传失败")
            }
        });
    });
</script>
</html>