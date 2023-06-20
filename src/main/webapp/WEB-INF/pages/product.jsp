<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=EDGE"/>
    <title>商品列表页面</title>
    <link href="/CSS/all.css" rel="stylesheet" type="text/css"/>
    <script src="/js/jquery-1.9.0.min.js"></script>
    <link rel="stylesheet" href="//unpkg.com/layui@2.6.8/dist/css/layui.css">
    <script src="//unpkg.com/layui@2.6.8/dist/layui.js"></script>

</head>
<body style="background: #e1e9eb;">

<form  action="product" id="mainForm" method="post">
    <input id="pageIpt" type="hidden" name="page" value="">
    <div class="right">
        <div class="current">当前位置：<a href="javascript:void(0)" style="color:#6E6E6E;" onclick="">商品管理</a> &gt; 商品列表
        </div>
        <div class="rightCont">
            <p class="g_title fix">商品列表 <a class="btn03" href="/toAddProduct">新 增</a></p>
            <table class="tab1">
                <tbody>
                <tr>
                    <td width="90" align="right">商品号:
                    </td>

                    <td>
                        <input name="productId" type="text" class="allInput" value="${searchBean.productId}"/>
                    </td>
                    <td width="90" align="right">商品名：</td>
                    <td>
                        <input name="productName" type="text" class="allInput" value="${searchBean.productName}"/>
                    </td>
                    <td width="90" align="right">价格：</td>
                    <td>
                        <input name="minPrice" type="text" class="allInput" value="${searchBean.minPrice}"/> &nbsp;~ &nbsp;
                    </td>
                    <td>
                        <input name="maxPrice" type="text" class="allInput" value="${searchBean.maxPrice}" />
                    </td>


                    <td width="90" align="right">类别：</td>
                    <td>

                        <select name="categoryId" lay-verify="required">
                            <option value="0" selected>--请输入类别--</option>
                            <c:forEach items="${categorys}" var="category">
                                <option value="${category.categoryId}">${category.categoryName}</option>
                            </c:forEach>
                        </select>

                    <td width="100" align="right">

                        <input type="submit" class="tabSub" value="查 询"/>


                        <a href="javascript:void(0)" onclick="adelete()">删除</a>
                    </td>
                </tr>
                </tbody>
            </table>
            <div class="zixun fix">
                <table class="tab2" width="100%">
                    <tbody>
                    <tr>
                        <th><input type="checkbox" id="all"/></th>
                        <th>id</th>
                        <th>商品名字</th>
                        <th>类型id</th>
                        <th>简介</th>
                        <%--                        <th> 详情</th>--%>
                        <th> 图片</th>
                        <th> 价格</th>
                        <th> 打折价格</th>
                        <th> 商品数量</th>
                        <th>销售数量</th>
                        <th>操作</th>
                    </tr>
                    <c:forEach items="${products}" var="product">
                        <tr>
                            <td></td>
                            <td>${product.productId}</td>
                            <td>
                                <a href="/detailsProduct/${product.productId}">${product.productName}</a>
                            </td>
                            <td>${product.category.categoryName}</td>
                            <td>${product.productTitle}</td>
                                <%--                             <td>${product.productIntro}</td>--%>
                            <td><img src="${product.productPicture}" alt=""></td>
                            <td>${product.productPrice}</td>
                            <td>${product.productSellingPrice}</td>
                            <td>${product.productNum}</td>
                            <td>${product.productSales}</td>
                            <td>
                                <a href="/toupdateProduct/${product.productId}">修改</a>
                                <a href="/deleteProduct/${product.productId}">删除</a></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <div id="myPage" class='page fix'>

                </div>
            </div>
        </div>
    </div>
</form>
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
<style>
    img {
        width: 100PX;
        height: 100PX;
    }

</style>
</html>