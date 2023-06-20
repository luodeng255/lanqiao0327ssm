<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 24991
  Date: 2023/6/5
  Time: 10:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.jsdelivr.net/npm/echarts@5.4.2/dist/echarts.min.js"></script>
    <title>Document</title>
</head>

<body>
<!-- 2准备一个容器div -->
<div id="myDiv" style="width: 1600px;height: 1200px;"></div>
<script>
    //3拿到容器
    let myDiv = document.querySelector("#myDiv");
    //4创建echarts对象
    let myEcharts = echarts.init(myDiv);
    //5进行配置    将网站上的内容复制   在前面加一个let
    let option = {
        grid: {
            bottom: "40%"
        },
        legend: {
            show: true
        },
        xAxis: {
            type: 'category',
            data: [
                <c:forEach items="${Order}" var="prod">
                '${prod.get("date")}',

                </c:forEach>
            ],
            axisLabel: {
                formatter: function (value) {
                    return value.split('').join('\n')
                },
            },
        },
        yAxis: {
            type: 'value'
        },
        series: [
            {
                data: [
                    <c:forEach items="${Order}" var="prod">
                    ${prod.get("orderCount")},
                    </c:forEach>
                ],
                type: 'bar'
            }
        ]
    };
    //6将配置传给echarts
    myEcharts.setOption(option);
</script>
</body>
</html>
