<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta http-equiv="X-UA-Compatible"content="IE=9; IE=8; IE=7; IE=EDGE" />
    <title>商品列表页面</title>
    <link href="all.css" rel="stylesheet" type="text/css" />
    <script src="/js/jquery-1.9.0.min.js"></script>




</head>
<body style="background: #e1e9eb;">




<form action="" id="mainForm" method="post">
    <input type="hidden" name="currentPage" id="currentPage" value="${page.currentPage}"/>

    <div class="right">
        <div class="current">当前位置：<a href="javascript:void(0)" style="color:#6E6E6E;" onclick="">商品管理</a> &gt; 商品列表</div>
        <div class="rightCont">
            <p class="g_title fix">商品列表 <a class="btn03" href="#">新 增</a></p>
            <table class="tab1">
                <tbody>
                <tr>
                    <td width="90" align="right">商品号:
                    </td>

                    <td>
                        <input name="gid" type="text" class="allInput"  value="id" />
                    </td>
                    <td width="90" align="right">商品名：</td>
                    <td>
                        <input name="gname" type="text" class="allInput" value="name" />
                    </td>
                    <td width="90" align="right">价格：</td>
                    <td>
                        <input name="minprice" type="text" class="allInput"  value=""/> &nbsp;~ &nbsp;
                    </td>
                    <td>
                        <input name="maxprice" type="text" class="allInput"  value=""/>
                    </td>

                    <td width="90" align="right">类别：</td>
                    <td>
                        <select name="cid">



                            <option value="0" selected>--请输入类别--</option>





                        </select>
                    </td>

                    <td width="100" align="right">

                        <input type="submit" class="tabSub" value="查 询" />


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
                        <th>商品号</th>
                        <th>商品名</th>
                        <th>原价</th>
                        <th>现价</th>
                        <th>图片</th>
                        <th>类别</th>
                        <th>操作</th>
                    </tr>

                    </tbody>
                </table>
                <div class='page fix'>
                    共 <b>12</b> 条 &nbsp;&nbsp;&nbsp;&nbsp;



                </div>
            </div>
        </div>
    </div>
</form>




</body>
</html>