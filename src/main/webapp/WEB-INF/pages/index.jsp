<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 24991
  Date: 2023/6/9
  Time: 11:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html>
<head>
    <!--更多资源：https://gitee.com/iGaoWei/big-data-view -->
    <meta charset="utf-8">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <%--    过了60秒重新跳转--%>
    <!-- <meta http-equiv="refresh" content="60;url='https://gitee.com/iGaoWei/big-data-view'"> -->
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <title>酷炫智能大屏数据中心</title>
    <!--大屏-->
    <link type="text/css" href="/CSS/public.css" rel="stylesheet">
    <link type="text/css" href="/CSS/icon.css" rel="stylesheet">
    <link type="text/css" href="/CSS/add.css" rel="stylesheet">
    <script type="text/javascript">
        document.documentElement.style.fontSize = document.documentElement.clientWidth /768*100 + 'px';
    </script>
    <script src="/js/echarts.min.js"></script>
</head>

<body>
<div class="bg">
    <div class="title">智能大屏数据中心</div>
    <div class="leftMain">
        <div class="leftMain_top">
            <div class="leftMain_topIn">
                <ul>
                    <li>
                        <div class="liIn">
                            <h3>用户数量</h3>
                            <p class="shu"><span class="shu1">
                                <c:forEach items="${allUser}" var="prod">
                                    ${prod.get("user_sum")}
                                </c:forEach>
                            </span><i></i></p>
                            <div class="zi"><span class="span1"></span><span></span></div>
                            <span class="border_bg_leftTop"></span>
                            <span class="border_bg_rightTop"></span>
                            <span class="border_bg_leftBottom"></span>
                            <span class="border_bg_rightBottom"></span>
                        </div>
                    </li>
                    <li>
                        <div class="liIn">
                            <h3>商品总数</h3>
                            <p class="shu"><span class="shu2">
                                <c:forEach items="${selectPro}" var="prod">
                                    ${prod.get("product")}
                                </c:forEach></span</p>
                            <div class="zi"><span class="span1"></span><span></span></div>
                            <span class="border_bg_leftTop"></span>
                            <span class="border_bg_rightTop"></span>
                            <span class="border_bg_leftBottom"></span>
                            <span class="border_bg_rightBottom"></span>
                        </div>
                    </li>
                    <li>
                        <div class="liIn">
                            <h3>订单总数</h3>
                            <p class="shu"><span class="shu3">
                                <c:forEach items="${selectOder}" var="prod">
                                    ${prod.get("sum_order")}
                                </c:forEach></span><i></i></p>
                            <div class="zi"><span class="span1"></span><span></span></div>
                            <span class="border_bg_leftTop"></span>
                            <span class="border_bg_rightTop"></span>
                            <span class="border_bg_leftBottom"></span>
                            <span class="border_bg_rightBottom"></span>
                        </div>
                    </li>
                    <li>
                        <div class="liIn">
                            <h3>所有订单额</h3>
                            <p class="shu"><span class="shu4">
                                <c:forEach items="${selectPrice}" var="prod">
                                    ${prod.get("total_sales")}
                                </c:forEach></span><i>元</i></p>
                            <div class="zi"><span class="span1"></span><span></span></div>
                            <span class="border_bg_leftTop"></span>
                            <span class="border_bg_rightTop"></span>
                            <span class="border_bg_leftBottom"></span>
                            <span class="border_bg_rightBottom"></span>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
        <div class="leftMain_middle">
            <div class="leftMain_middle_left">
                <div class="leftMain_middle_leftIn">
                    <h3>最近10天销售额</h3>
                    <!-- 为ECharts准备一个具备大小（宽高）的Dom -->
                    <div class="biaoge" style="width:100%; height:25vh" id="chartmain"></div>
                    <script type="text/javascript">
                        //window.onload = function () {
                        //指定图表的配置项和数据
                        var dataAxis = [
                            <c:forEach items="${AllTen}" var="prod">
                            '${prod.get("date")}',
                            </c:forEach>
                        ];
                        var data = [
                            <c:forEach items="${AllTen}" var="prod">
                            ${prod.get("sales_amount")},
                            </c:forEach>
                        ];
                        var yMax = 35000;
                        var dataShadow = [];

                        for (var i = 0; i < data.length; i++) {
                            dataShadow.push(yMax);
                        }

                        option = {
                            title: {
                                text: '',
                                subtext: ''
                            },

                            grid:{
                                x:40,
                                y:40,
                                x2:20,
                                y2:20,
                                left: '100',            // 固定左边刻度宽度
                                right: '4%',
                                bottom: '3%',
                                containLabel: true

                            },
                            xAxis: {
                                data: dataAxis,
                                axisLabel: {
                                    /*inside: true,*/
                                    interval:0,
                                    textStyle: {
                                        color: '#fff',
                                        fontSize: 12

                                    }
                                },
                                axisTick: {
                                    show: false,
                                },
                                axisLine: {
                                    show: true,
                                    symbol:['none', 'arrow'],
                                    symbolOffset: 12,
                                    lineStyle:{
                                        color: '#fff',
                                    }
                                },
                                z: 10
                            },
                            yAxis: {
                                type: 'value',
                                name: '单位：元',
                                axisLine: {
                                    show: true,
                                    symbol: ['none', 'arrow'],
                                    symbolOffset: 12,
                                    lineStyle:{
                                        color: '#fff',
                                    }
                                },
                                axisTick: {
                                    show: false
                                },
                                axisLabel: {
                                    textStyle: {
                                        color: '#fff',
                                        fontSize: 12
                                    }
                                }
                            },

                            dataZoom: [
                                {
                                    type: 'inside'
                                }
                            ],
                            series: [
                                { // For shadow
                                    type: 'bar',
                                    itemStyle: {
                                        color: 'rgba(0,0,0,0.05)'
                                    },
                                    barGap: '-100%',
                                    barCategoryGap: '40%',
                                    data: dataShadow,
                                    animation: false
                                },
                                {
                                    type: 'bar',
                                    itemStyle: {
                                        color: new echarts.graphic.LinearGradient(
                                            0, 0, 0, 1,
                                            [
                                                {offset: 0, color: '#0efdff'},
                                                {offset: 0.5, color: '#188df0'},
                                                {offset: 1, color: '#188df0'}
                                            ]
                                        )
                                    },
                                    emphasis: {
                                        itemStyle: {
                                            color: new echarts.graphic.LinearGradient(
                                                0, 0, 0, 1,
                                                [
                                                    {offset: 0, color: '#2378f7'},
                                                    {offset: 0.7, color: '#2378f7'},
                                                    {offset: 1, color: '#0efdff'}
                                                ]
                                            )
                                        }
                                    },
                                    data: data
                                }
                            ]
                        };

                        //获取dom容器
                        var myChart = echarts.init(document.getElementById('chartmain'));
                        // 使用刚指定的配置项和数据显示图表。
                        myChart.setOption(option);
                        //};
                    </script>
                    <span class="border_bg_leftTop"></span>
                    <span class="border_bg_rightTop"></span>
                    <span class="border_bg_leftBottom"></span>
                    <span class="border_bg_rightBottom"></span>
                </div>
            </div>
            <div class="leftMain_middle_right">
                <div class="leftMain_middle_rightIn">
                    <h3>商品销量排行榜</h3>
                    <div class="biaoge biaoge_pai" style="width:100%; height:25vh">
                        <div class="biaoge_paiIn">
                            <ul>
<%--                                <li>--%>
<%--                                    <div class="liIn liIn1">--%>
<%--                                        <div class="liIn_left"><span class="bot"></span><span class="zi">--%>
<%--                                            <c:forEach items="${selectfirst}" var="prod">--%>
<%--                                            ${prod.get("total_num")}--%>
<%--                                        </c:forEach></span></div>--%>
<%--                                        <div class="liIn_line"><div class="line_lineIn" style="width:--%>
<%--                                        <c:forEach items="${selectfirst}" var="prod">--%>
<%--                                                ${prod.get("total_ratio")}--%>
<%--                                        </c:forEach>;"></div></div>--%>
<%--                                        <p class="num">--%>
<%--                                            <c:forEach items="${selectfirst}" var="prod">--%>
<%--                                            ${prod.get("total_ratio")}--%>
<%--                                        </c:forEach></p>--%>
<%--                                    </div>--%>
<%--                                </li>--%>

                                <c:forEach items="${selectfirst}" var="prod">
                                  <li>
                                    <div class="liIn liIn2">
                                        <div class="liIn_left"><span class="bot"></span><span class="zi"> ${prod.get("category_name")}</span></div>
                                        <div class="liIn_line"><div class="line_lineIn" style="width: ${prod.get("total_ratio")}%;"></div></div>
                                        <p class="num"> ${prod.get("product_count")}</p>
                                    </div>
                                </li>
                                </c:forEach>
<%--                                <li>--%>
<%--                                    <div class="liIn liIn3">--%>
<%--                                        <div class="liIn_left"><span class="bot"></span><span class="zi">第三名</span></div>--%>
<%--                                        <div class="liIn_line"><div class="line_lineIn" style="width:18.5%;"></div></div>--%>
<%--                                        <p class="num">18.5%</p>--%>
<%--                                    </div>--%>
<%--                                </li>--%>
<%--                                <li>--%>
<%--                                    <div class="liIn liIn4">--%>
<%--                                        <div class="liIn_left"><span class="bot"></span><span class="zi">第四名</span></div>--%>
<%--                                        <div class="liIn_line"><div class="line_lineIn" style="width:10.5%;"></div></div>--%>
<%--                                        <p class="num">10.5%</p>--%>
<%--                                    </div>--%>
<%--                                </li>--%>
<%--                                <li>--%>
<%--                                    <div class="liIn liIn5">--%>
<%--                                        <div class="liIn_left"><span class="bot"></span><span class="zi">第五名</span></div>--%>
<%--                                        <div class="liIn_line"><div class="line_lineIn" style="width:22.5%;"></div></div>--%>
<%--                                        <p class="num">22.5%</p>--%>
<%--                                    </div>--%>
<%--                                </li>--%>
<%--                                <li>--%>
<%--                                    <div class="liIn liIn6">--%>
<%--                                        <div class="liIn_left"><span class="bot"></span><span class="zi">第六名</span></div>--%>
<%--                                        <div class="liIn_line"><div class="line_lineIn" style="width:10.5%;"></div></div>--%>
<%--                                        <p class="num">10.5%</p>--%>
<%--                                    </div>--%>
<%--                                </li>--%>
                            </ul>
                        </div>
                    </div>
                    <span class="border_bg_leftTop"></span>
                    <span class="border_bg_rightTop"></span>
                    <span class="border_bg_leftBottom"></span>
                    <span class="border_bg_rightBottom"></span>
                </div>
            </div>
        </div>
        <div class="leftMain_middle">
            <div class="leftMain_middle_left">
                <div class="leftMain_middle_leftIn">
                    <h3>每日订单量</h3>
                    <div class="biaoge" style="width:100%; height:25vh" id="chartmain_zhe"></div>
                    <script type="text/javascript">
                        //window.onload = function (){
                        //指定图表的配置项和数据

                        option = {
                            title: {
                                text: ''
                            },
                            tooltip: {
                                trigger: 'axis'
                            },
                            legend: {
                                textStyle: {
                                    color: '#fff',
                                    fontSize: 12,
                                },
                                right:'10%',
                                data: ['折线一']
                            },
                            grid:{
                                x:40,
                                y:40,
                                x2:20,
                                y2:20,
                            },
                            toolbox: {
                                feature: {
                                    //saveAsImage: {}
                                }
                            },
                            xAxis: {
                                type: 'category',
                                boundaryGap: false,
                                axisLabel: {
                                    /*inside: true,*/
                                    interval:0,
                                    textStyle: {
                                        color: '#fff',
                                        fontSize: 12

                                    }
                                },
                                axisTick: {
                                    show: false,
                                },
                                axisLine: {
                                    show: true,
                                    symbol:['none', 'arrow'],
                                    symbolOffset: 12,
                                    lineStyle:{
                                        color: '#fff',
                                    }
                                },
                                data:
                                    // ['00:00', '02:00', '04:00', '06:00', '08:00', '10:00', '12:00']

                                [ <c:forEach items="${selectEday}" var="prod">
                                '${prod.get("order_date")}',
                                </c:forEach>]
                            },
                            yAxis: {
                                type: 'value',

                                axisLine: {
                                    show: true,
                                    symbol: ['none', 'arrow'],
                                    symbolOffset: 12,
                                    lineStyle:{
                                        color: '#fff',
                                    }
                                },
                                axisTick: {
                                    show: false
                                },
                                axisLabel: {
                                    textStyle: {
                                        color: '#fff',
                                        fontSize: 12
                                    }
                                }
                            },
                            series: [
                                {
                                    name: '折线一',
                                    type: 'line',
                                    stack: '总量',
                                    data:
                                        // [280, 102, 191, 134, 390, 230, 210],
                                    //量
                                        [ <c:forEach items="${selectEday}" var="prod">
                                            ${prod.get("order_count")},
                                            </c:forEach>],
                                    itemStyle: {
                                        normal: {
                                            color: "#0efdff",//折线点的颜色
                                            lineStyle: {
                                                color: "#0efdff",//折线的颜色
                                                width:2,
                                            }
                                        },
                                    }
                                },
                                // {
                                //     name: '折线二',
                                //     type: 'line',
                                //     stack: '总量',
                                //     data: [100, 132, 131, 234, 290, 330, 110]
                                // },
                            ]
                        };
                        //获取dom容器
                        var myChart = echarts.init(document.getElementById('chartmain_zhe'));
                        // 使用刚指定的配置项和数据显示图表。
                        myChart.setOption(option);
                        //};
                    </script>
                    <span class="border_bg_leftTop"></span>
                    <span class="border_bg_rightTop"></span>
                    <span class="border_bg_leftBottom"></span>
                    <span class="border_bg_rightBottom"></span>
                </div>
            </div>
            <div class="leftMain_middle_right">
                <div class="leftMain_middle_rightIn">
                    <h3>站内订单数</h3>
                    <div class="biaoge biaoge_bi" style="width:100%; height:25vh">
                        <ul>
                            <li>
                                <div class="liIn">
                                    <p class="shu shu1">
                                        <c:forEach items="${DayNum}" var="prod">
                                            ${prod.get("dayNum")}
                                        </c:forEach>
                                    </p>
                                    <p class="zi">今日订单数</p>
                                </div>
                            </li>
                            <li>
                                <div class="liIn">
                                    <p class="shu shu2">
                                        <c:forEach items="${Week}" var="prod">
                                        ${prod.get("weekly_orders")}
                                    </c:forEach></p>
                                    <p class="zi">本周订单数</p>
                                </div>
                            </li>
                            <li>
                                <div class="liIn">
                                    <p class="shu shu3">
                                        <c:forEach items="${month}" var="prod">
                                            ${prod.get("monthly_orders")}
                                        </c:forEach>
                                    </p>
                                    <p class="zi">本月订单数</p>
                                </div>
                            </li>
                            <li>
                                <div class="liIn">
                                    <p class="shu shu4">
                                        <c:forEach items="${DayPrice}" var="prod">
                                       <c:if test="${prod.dailySales==null}">
                                               0
                                       </c:if>
                                            <c:if test="${prod.dailySales!=null}">
                                                ${prod.dailySales}
                                            </c:if>
                                           </c:forEach>

                                    </p>
                                    <p class="zi">今日销售量</p>
                                </div>
                            </li>
                            <li>
                                <div class="liIn">
                                    <p class="shu shu5">
                                        <c:forEach items="${toWeekPrice}" var="prod">
                                        ${prod.get("weekly_sales")}
                                    </c:forEach></p>
                                    <p class="zi">本周销售量</p>
                                </div>
                            </li>
                            <li>
                                <div class="liIn">
                                    <p class="shu shu6">
                                        <c:forEach items="${MothPrice}" var="prod">
                                            ${prod.get("monthly_sales")}
                                        </c:forEach>
                                    </p>
                                    <p class="zi">本月销售量</p>
                                </div>
                            </li>
                        </ul>

                    </div>
                    <span class="border_bg_leftTop"></span>
                    <span class="border_bg_rightTop"></span>
                    <span class="border_bg_leftBottom"></span>
                    <span class="border_bg_rightBottom"></span>
                </div>
            </div>
        </div>
    </div>


    <div class="rightMain">
        <div class="rightMain_top">
            <div class="rightMain_topIn">
                <h3>商品分类数据</h3>
                <div class="biaoge" style="width:100%; height:30vh" id="chartmain_bing"></div>
                <script type="text/javascript">
                    option = {
                        title: {
                            text: '数据情况统计',
                            subtext: '',
                            left: 'right',
                            textStyle: {
                                color: '#fff',
                                fontSize: 12
                            }
                        },
                        tooltip: {
                            trigger: 'item',
                            formatter: '{a} <br/>{b} : {c} ({d}%)'
                        },
                        legend: {
                            // orient: 'vertical',
                            // top: 'middle',
                            type: 'scroll',
                            orient: 'vertical',
                            right: 10,
                            top: 40,
                            bottom: 20,
                            left: 'right',
                            data: [
                                <c:forEach items="${allCate}" var="prod">
                                '${prod.get("category_name")}',
                                </c:forEach>
                            ],
                            textStyle: {
                                color: '#fff',
                                fontSize: 12
                            }

                        },
                        grid:{
                            x:'-10%',
                            y:40,
                            x2:20,
                            y2:20,
                        },
                        color : [ '#09d0fb', '#f88cfb', '#95f8fe', '#f9f390',  '#ecfeb7','#f2ed4b','#44dff0','#13abe5' ],
                        series: [
                            {
                                type: 'pie',
                                radius: '65%',
                                center: ['50%', '50%'],
                                selectedMode: 'single',
                                data: [
                                    <c:forEach items="${allCate}" var="prod">
                                    { value: ${prod.get("product_count")}, name:'${prod.get("category_name")}' ,},
                                    </c:forEach>
                                ],
                                emphasis: {
                                    itemStyle: {
                                        shadowBlur: 10,
                                        shadowOffsetX: 0,
                                        shadowColor: 'rgba(0, 0, 0, 0.5)'
                                    }
                                }
                            }
                        ]
                    };
                    //获取dom容器
                    var myChart = echarts.init(document.getElementById('chartmain_bing'));
                    // 使用刚指定的配置项和数据显示图表。
                    myChart.setOption(option);
                </script>
                <span class="border_bg_leftTop"></span>
                <span class="border_bg_rightTop"></span>
                <span class="border_bg_leftBottom"></span>
                <span class="border_bg_rightBottom"></span>
            </div>
        </div>
        <div class="rightMain_bottom">
            <div class="rightMain_bottomIn">
                <h3>商品详情</h3>
                <div class="biaoge biaoge_list" style="width:100%; height:36vh">
                    <div class="biaoge_listIn">
                        <ul class="ul_title">
                            <li>用户id</li>
                            <li>商品名</li>
                            <li>价格</li>
                            <li>数量</li>
                        </ul>
                        <div class="ul_list">
                            <div class="ul_listIn">

                                <c:forEach items="${TenSelect}" var="prod">


                                <ul class="ul_con">
                                    <li> ${prod.get("product_id")}</li>
                                    <li> ${prod.get("name")}</li>
                                    <li> ${prod.get("price")}</li>
                                    <li> ${prod.get("num")}</li>
                                </ul>
                                </c:forEach>

                            </div>
                        </div>
                    </div>

                </div>
                <span class="border_bg_leftTop"></span>
                <span class="border_bg_rightTop"></span>
                <span class="border_bg_leftBottom"></span>
                <span class="border_bg_rightBottom"></span>
            </div>
        </div>
    </div>
    <div style="clear:both;"></div>
</div>
<!--大屏-->
<!--数字增长累加动画-->
<script src="/js/jquery-1.11.0.min.js" type="text/javascript"></script>
<script src="/js/jquery.numscroll.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
    $(".shu1").numScroll();
    $(".shu2").numScroll();
    $(".shu3").numScroll();
    $(".shu4").numScroll();
    $(".shu5").numScroll();
    $(".shu6").numScroll();

    /*$(".num2").numScroll({
        time:5000
    });*/
</script>
<!--大屏-->
</body>
</html>
