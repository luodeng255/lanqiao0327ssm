<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="/CSS/details.css">
    <!-- 引入 layui.css -->
    <link rel="stylesheet" href="//unpkg.com/layui@2.6.8/dist/css/layui.css">

    <!-- 引入 layui.js -->
    <script src="//unpkg.com/layui@2.6.8/dist/layui.js"></script>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<form>
    <div id="details">
        <!-- 头部 -->
        <div class="page-header">
            <div class="title">
                <p name="categoryId" lay-verify="required">
                    <c:forEach items="${categorys}" var="category">
                    <c:if test="${products.categoryId==category.categoryId}">
                <p value="${category.categoryId}" selected>${category.categoryName}</p>
                </c:if>
                </c:forEach>
                </p>
                <div class="list">
                    <ul>
                        <li>
                            <router-link to>概述</router-link>
                        </li>
                        <li>
                            <router-link to>参数</router-link>
                        </li>
                        <li>
                            <router-link to>用户评价</router-link>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <!-- 头部END -->

        <!-- 主要内容 -->
        <div class="main">
            <!-- 左侧商品轮播图 -->
            <div class="block">

                <img style="height:560px;" src="${products.productPicture}" :/>


            </div>
            <!-- 左侧商品轮播图END -->

            <!-- 右侧内容区 -->
            <div class="content">
                <h1 class="name">${products.productName}</h1>
                <p class="intro">${products.productIntro}</p>
                <p class="store">小米自营</p>
                <div class="price">
                    <span>${products.productSellingPrice}元</span>
                    <span

                            class="del"
                    >${products.productPrice}元</span>
                </div>
                <div class="pro-list">
                    <span class="pro-name">${products.productName}</span>
                    <span class="pro-price">
                <span>${products.productSellingPrice}元</span>
                <span
                        class="pro-del"
                >${products.productPrice}元</span>
              </span>
                    <p class="price-sum">总计 : ${products.productSellingPrice}元</p>
                </div>
                <!-- 内容区底部按钮 -->
                <div class="button">

                    <a type="button" class="layui-btn shop-cart" href="/order/addOrder?productId=${products.productId}">购买</a>
                    <a href="/shoppingcart/add?productId=${products.productId}" class="layui-btn like">加入购物车</a>


                </div>
                <!-- 内容区底部按钮END -->
                <div class="pro-policy">
                    <ul>
                        <li>
                            <i class="el-icon-circle-check"></i> 小米自营
                        </li>
                        <li>
                            <i class="el-icon-circle-check"></i> 小米发货
                        </li>
                        <li>
                            <i class="el-icon-circle-check"></i> 7天无理由退货
                        </li>
                        <li>
                            <i class="el-icon-circle-check"></i> 7天价格保护
                        </li>
                    </ul>
                </div>
            </div>
            <!-- 右侧内容区END -->
        </div>
        <!-- 主要内容END -->
    </div>
</form>
</body>
</html>

<c:if test="${addCartSuccess}">
    <script>
        layer.open({
            type: 1,
            content: '添加成功' //这里content是一个普通的String

        });
        setTimeout(()=>{
            layer.closeAll(); //疯狂模式，关闭所有层
        },1000)
    </script>
</c:if>