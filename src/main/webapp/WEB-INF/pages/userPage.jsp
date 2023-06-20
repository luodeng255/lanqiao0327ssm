<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="/CSS/userPage.css">
    <!-- 引入 layui.css -->
    <link rel="stylesheet" href="//unpkg.com/layui@2.6.8/dist/css/layui.css">

    <!-- 引入 layui.js -->
    <script src="//unpkg.com/layui@2.6.8/dist/layui.js"></script>
    <link rel="stylesheet" href="3.css">
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div class="goods">
    <form action="/userPages"  method="post">
    <div class="myBread">
        <div class="breadcrumb">
            <span class="layui-breadcrumb">
                <a href="">首页</a>
                <a href="">商品</a>

            </span>
        </div>


            <div>

                <input type="text" required lay-verify="required" placeholder="搜索" autocomplete="off"
                       class="layui-input" name="productName">

            </div>
            <input type="submit" class="layui-btn  layui-btn-primary" value="查 询"/>


    </div>
    </form>

    <div class="kind">
        <div style="color:#b0b0b0">分类：</div>
        <c:forEach items="${categorys}" var="category">
            <div>

                <a
                        <c:if test="${SearchBean.categoryId==category.categoryId}">
                            style="color: orange"
                        </c:if>
                        href="/userPages?categoryId=${category.categoryId}"
                        value="${category.categoryId}">${category.categoryName}</a>
            </div>
        </c:forEach>
    </div>

    <div id="myList" class="myList">
        <c:forEach items="${userproduct}" var="product">
            <div>
                <a href="/detailsProduct/${product.productId}">
                    <img src="${product.productPicture}" alt/>
                    <h2>${product.productName}</h2>
                    <h3>${product.productTitle}</h3>
                    <p>
                        <span>${product.productSellingPrice}</span>
                        <span
                                class="del"
                        >${product.productPrice}</span>
                    </p>
                </a>
            </div>
        </c:forEach>
    </div>

    <div id="myPage" class='page fix'>
    </div>

    <form action="/userPages" id="mainForm">
        <input type="hidden" name="page" id="pageIpt">
        <input type="hidden" name="categoryId" value="${SearchBean.categoryId}">
        <input type="hidden" name="productName" value="${SearchBean.productName}">
    </form>
</div>


<script>
    layui.use('laypage', function () {
        var laypage = layui.laypage;

        //执行一个laypage实例
        laypage.render({
            elem: 'myPage' //注意，这里的 test1 是 ID，不用加 # 号
            , count: ${num} //数据总数，从服务端得到
            , curr: ${page}
            , jump: function (obj, first) {
                //obj包含了当前分页的所有参数，比如：
                console.log(obj.curr); //得到当前页，以便向服务端请求对应页的数据。
                console.log(obj.limit); //得到每页显示的条数

                //首次不执行
                if (!first) {
                    document.querySelector("#pageIpt").value=obj.curr
                    document.querySelector("#mainForm").submit()
                }
            }
        });
    });
</script>
</body>
</html>
