<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="/CSS/confrimOrder.css">
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div class="confirmOrder">
    <!-- 头部 -->
    <div class="confirmOrder-header">
        <div class="header-content">

            <p>确认订单</p>

        </div>
    </div>
    <!-- 头部END -->

    <!-- 主要内容容器 -->
    <div class="content">
        <!-- 选择地址 -->
        <div class="section-address">
            <p class="title">收货地址</p>
            <div class="address-body">
                <ul>
                    <li
                            class="in-section"
                    >
                        <h2>小谢</h2>
                        <p class="phone">123456789</p>
                        <p class="address">重庆市永川区科创职业学院</p>
                    </li>
                    <li

                    >
                        <h2>小谢2</h2>
                        <p class="phone">123456789</p>
                        <p class="address">重庆市永川区科创职业学院</p>
                    </li>
                    <li class="add-address">
                        <i class="el-icon-circle-plus-outline"></i>
                        <p>添加新地址</p>
                    </li>
                </ul>
            </div>
        </div>
        <!-- 选择地址END -->

        <!-- 商品及优惠券 -->
        <div class="section-goods">
            <p class="title">商品及优惠券</p>
            <div class="goods-list">
                <ul>
                    <li >
                        <img src="" />
                        <span class="pro-name">小米</span>
                        <span class="pro-price">123元 x 2</span>
                        <span class="pro-status"></span>
                        <span class="pro-total">456元</span>
                    </li>
                </ul>
            </div>
        </div>
        <!-- 商品及优惠券END -->

        <!-- 配送方式 -->
        <div class="section-shipment">
            <p class="title">配送方式</p>
            <p class="shipment">包邮</p>
        </div>
        <!-- 配送方式END -->

        <!-- 发票 -->
        <div class="section-invoice">
            <p class="title">发票</p>
            <p class="invoice">电子发票</p>
            <p class="invoice">个人</p>
            <p class="invoice">商品明细</p>
        </div>
        <!-- 发票END -->

        <!-- 结算列表 -->
        <div class="section-count">
            <div class="money-box">
                <ul>
                    <li>
                        <span class="title">商品件数：</span>
                        <span class="value">${num}件</span>
                    </li>
                    <li>
                        <span class="title">商品总价：</span>
                        <span class="value">${sum}</span>
                    </li>
                    <li>
                        <span class="title">活动优惠：</span>
                        <span class="value">-0元</span>
                    </li>
                    <li>
                        <span class="title">优惠券抵扣：</span>
                        <span class="value">-0元</span>
                    </li>
                    <li>
                        <span class="title">运费：</span>
                        <span class="value">0元</span>
                    </li>
                    <li class="total">
                        <span class="title">应付总额：</span>
                        <span class="value">
                    <span class="total-price">${sum}</span>元
                  </span>
                    </li>
                </ul>
            </div>
        </div>
        <!-- 结算列表END -->

        <!-- 结算导航 -->
        <div class="section-bar">
            <div class="btn">
                <a class="btn-base btn-return">返回购物车</a>
                <a href="javascript:void(0);" @click="addOrder" class="btn-base btn-primary">结算</a>
            </div>
        </div>
        <!-- 结算导航END -->
    </div>
    <!-- 主要内容容器END -->
</div>
</body>
</html>