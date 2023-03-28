<%--
  Created by IntelliJ IDEA.
  User: 666
  Date: 2023/3/25
  Time: 20:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"  isELIgnored="false" %>
<html>
<head>
    <title>Title</title>
    <script src="static/jquery.js"></script>
</head>
<body>
<div align="center">

    <h1>详情页面</h1>

    <input type="hidden"  id="user" value="${sessionScope.user_id}">
    <span>创建时间: ${sessionScope.aaa.get(0).create_time}</span><br>
    <span>申请人:  ${sessionScope.aaa.get(0).contact_person}</span><br>
    <span>品种:  ${sessionScope.aaa.get(0).wholesale_price}</span><br>
    <span>实际采购成本:  ${sessionScope.aaa.get(0).retail_price}</span>
    <table border="1px solid black">
        <thead>
        <tr>
            <td>序号</td>
            <td>物料名称</td>
            <td>单位</td>
            <td>供应商</td>
            <td>批发价</td>
            <td>零售价</td>
            <td>采购价</td>
            <td>采购数量</td>
        </tr>
        </thead>
        <tbody id="div">
        </tbody>
    </table>
    <div class="fenye">
    </div>
    <button onclick="aaa()">返回</button>

</div>

<script>

    $(function (){
        select(1);
    })


    function select(pageIndex){
        var user=$("#user").val();
        $("#div").empty();
        $(".fenye").empty();
        $.post("Select_ByID", "pageIndex="+pageIndex+"&user="+user, function(data) {
            $(data.list).each(function () {

                var  tr ="<tr>"+
                    "<td>"+this.id+"</td>"+
                    "<td>"+this.pro_name+"</td>"+
                    "<td>"+this.pro_unit+"</td>"+
                    "<td>"+this.provider_id.provider_name+"</td>"+
                    "<td>"+this.wholesale_price+"</td>"+
                    "<td>"+this.retail_price+"</td>"+
                    "<td>"+this.sale_price+"</td>"+
                    "<td>"+this.sale_number+"</td>"+
                    "</tr>";
                $("#div").append(tr);
            });

            var fenye="<a onclick='select("+1+")'>首页</a>"+
                "<a onclick='select("+(data.prePage)+")'>上一页</a>"+
                "<a onclick='select("+(data.nextPage)+")'>下一页</a>"+
                "<a onclick='select("+(data.pages)+")'>末页</a>"+
                "<a>第"+data.pageNum+"页</a><a>共"+data.pages+"页<a>";
            $(".fenye").append(fenye);
        },"JSON");

    }




</script>



</body>
</html>
