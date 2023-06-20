<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 24991
  Date: 2023/4/26
  Time: 8:49
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
    <link rel="stylesheet" href="/CSS/shoppingCart.css">
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div class="shoppingCart">
    <!-- 购物车头部 -->
    <div class="cart-header">
        <div class="cart-header-content">
            <p style="margin:0px">
                我的购物车
            </p>
            <span>温馨提示：产品是否购买成功，以最终下单为准哦，请尽快结算</span>
        </div>
    </div>
    <!-- 购物车头部END -->

    <!-- 购物车主要内容区 -->
    <c:if test="${carts!=null && carts.size()!=0}">
    <div class="content">
        <ul>
            <!-- 购物车表头 -->
            <li class="header">
                <div class="pro-check">
                    序号
                </div>
                <div class="pro-img"></div>
                <div class="pro-name">商品名称</div>
                <div class="pro-price">单价</div>
                <div class="pro-num">数量</div>
                <div class="pro-total">小计</div>
                <div class="pro-action">操作</div>
            </li>
            <!-- 购物车表头END -->

            <!-- 购物车列表 -->
            <%--                       item是controller里面的 model     varStatus状态  --%>
            <c:forEach items="${carts}" var="cart" varStatus="status">
                <li class="product-list">
                    <div class="pro-check">
                            <%--                            这次循环试着列表里面的第几个--%>
                            ${status.count}
                    </div>
                    <div class="pro-img">
                        <a>
                            <img src="${cart.product.productPicture}" alt="">
                        </a>
                    </div>
                    <div class="pro-name">
                        <a>${cart.product.productName}</a>
                    </div>
                    <div class="pro-price">${cart.product.productSellingPrice}</div>
                    <div class="pro-num">
                        <div class="number-box">
                            <a href="/shoppingcart/update?id=${cart.id}&num=-1" class="on-number">-</a>
                            <input type="text" value="${cart.num}">
                            <a href="/shoppingcart/update?id=${cart.id}&num=1" class="on-number">+</a>
                        </div>
                    </div>
                    <div class="pro-total pro-total-in">${cart.product.productSellingPrice*cart.num}</div>
                    <div class="pro-action">
                        <a href="/shoppingcart/deleteshopping/${cart.id}">删除</a>
                    </div>
                </li>

            </c:forEach>

`
            <!-- 购物车列表END -->
        </ul>
        <div style="height:20px;background-color: #f5f5f5"></div>
        <!-- 购物车底部导航条 -->
        <div class="cart-bar">
            <div class="cart-bar-left">
              <span>
                <a>继续购物</a>
              </span>
                <span class="sep">|</span>
                <span class="cart-total">
                共
                <span class="cart-total-num">${num}</span> 件商品
              </span>
            </div>
            <div class="cart-bar-right">
              <span>
                <span class="total-price-title">合计：</span>
                <span class="total-price">${sum} 元
                </span>
              </span>
                <a href="/order/addAll">
                    <div class="btn-primary">去结算
                    </div>
                </a>
            </div>
        </div>
        <!-- 购物车底部导航条END -->
    </div>
    <!-- 购物车主要内容区END -->

    </c:if>

    <c:if test="${carts==null || carts.size()==0}">
    <!-- 购物车为空的时候显示的内容 -->
    <div class="cart-empty">
        <div class="empty">

            <h2>您的购物车还是空的！</h2>
            <p>快去购物吧！</p>
        </div>
    </div>
    <!-- 购物车为空的时候显示的内容END -->
    </c:if>
</div>
</body>
</html>