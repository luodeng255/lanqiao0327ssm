<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <link rel="stylesheet" href="/CSS/oeder.css">
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div class="order">
  <!-- 我的订单头部 -->
  <div class="order-header">
    <div class="order-header-content">
      <p>
        我的订单
      </p>
    </div>
  </div>
  <!-- 我的订单头部END -->

  <c:forEach items="${lists}" var="order" varStatus="status">
  <!-- 我的订单主要内容 -->
  <div class="order-content">
    <div class="content">
      <ul>
        <!-- 我的订单表头 -->
        <li class="order-info">
          <div class="order-id">订单编号: ${{order.orderId}}</div>
          <div class="order-time">订单时间: ${{order.orderTimeStr}}</div>
        </li>
        <li class="header">
          <div class="pro-img"></div>
          <div class="pro-name">商品名称</div>
          <div class="pro-price">单价</div>
          <div class="pro-num">数量</div>
          <div class="pro-total">小计</div>
        </li>
        <!-- 我的订单表头END -->

        <!-- 订单列表 -->
        <li class="product-list" >
          <div class="pro-img">
            <a>
              <img src="${order.product.productPicture}" />
            </a>
          </div>
          <div class="pro-name">
            <a>${order.product.productName}</a>
          </div>
          <div class="pro-price">${order.price}元</div>
          <div class="pro-num">${order.num}</div>
          <div class="pro-total pro-total-in">${order.price*order.num}元</div>
        </li>
      </ul>


      <div class="order-bar">
        <div class="order-bar-left">
                <span class="order-total">
                  共
                  <span class="order-total-num">${num}</span> 件商品
                </span>
        </div>
        <div class="order-bar-right">
                <span>
                  <span class="total-price-title">合计：</span>
                  <span class="total-price">${sum}元</span>
                </span>
        </div>
        <!-- 订单列表END -->
      </div>
    </div>
    <div style="margin-top:-40px;"></div>
  </div>
  </c:forEach>
  <!-- 我的订单主要内容END -->
  <c:if test="${orders==null || orders.size()==0}">
  <!-- 订单为空的时候显示的内容 -->
  <div class="order-empty">
    <div class="empty">
      <h2>您的订单还是空的！</h2>
      <p>快去购物吧！</p>
    </div>
  </div>
  </c:if>
  <!-- 订单为空的时候显示的内容END -->

</div>
</body>
</html>