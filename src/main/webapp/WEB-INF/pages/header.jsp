    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="/CSS/header.css">
</head>
<body>

<div class="topbar">
    <div class="nav">
        <ul>

          <c:if test="${user.username=='deng'}">
            <li>
              <span>
                  <a href="/echarts/selectDayNum">商品管理</a>
              </span>
            </li>
          </c:if>

           <c:if test="${user==null}">
            <li>
                <a href="/login">登录</a>
                <span class="sep">|</span>
                <a type="text" href="/register">注册</a>
            </li>
           </c:if>
            <c:if test="${user!=null}">
            <li>
                欢迎
                ${user.username}
                <span class="sep">|</span>
               <a  href="/logOut">退出</a>
            </li>
            </li>
            </c:if>


            <c:if test="${logoutuser}">
                <script>
                    alert("退出成功")
                </script>
            </c:if>
            <li>
                <a href="/order/list1">我的订单</a>
            </li>

            <c:if test="${user==null}">
                <li class="shopCart">
                    <a href="/shoppingcart/list">
                        <i cla  ss="el-icon-shopping-cart-full"></i> 购物车
                        <span class="num">(0)</span>
                    </a>
                </li>
            </c:if>

            <c:if test="${user!=null}">
                <li class="shopCart">
                    <a href="/shoppingcart/list">
                        <i class="el-icon-shopping-cart-full"></i> 购物车
                        <span class="num">(${cartNum})</span>
                    </a>
                </li>
            </c:if>
        </ul>
    </div>
</div>

<div class="header">
    <nav>
        <div class="logo">
            <img src="/imgs/xiaomilogo.jpg" alt="Logo">
        </div>
        <ul>
            <li><a href="/userPages" class="active">首页</a></li>
            <li><a href="#" class="active">产品</a></li>
            <li><a href="#">联系我们</a></li>
            <li><a href="#">关于我们</a></li>
        </ul>
    </nav>
</div>

</body>
</html>