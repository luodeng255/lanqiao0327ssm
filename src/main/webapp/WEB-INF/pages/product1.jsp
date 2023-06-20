<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<table>
    <tr>
        <th>id</th>
        <th>商品名字</th>
        <th>类型id</th>
        <th>简介</th>
        <th> 详情</th>
        <th> 图片</th>
        <th> 价格</th>
        <th> 打折价格</th>
        <th> 商品数量</th>
        <th>销售数量</th>

    </tr>
    <c:forEach items="${products}" var="product">
        <tr>
            <td>${product.productId}</td>
            <td>${product.productName}</td>
            <td>${product.categoryId}</td>
            <td>${product.productTitle}</td>
            <td>${product.productIntro}</td>
            <td><img src="${product.productPicture}" alt=""></td>
            <td>${product.productPrice}</td>
            <td>${product.productSellingPrice}</td>
            <td>${product.productNum}</td>
            <td>${product.productSales}</td>
        </tr>
    </c:forEach>

</table>

</body>
</html>
