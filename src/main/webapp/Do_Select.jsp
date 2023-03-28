<%--
  Created by IntelliJ IDEA.
  User: 666
  Date: 2023/3/25
  Time: 20:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="static/jquery.js"></script>
</head>
<body>

<div align="center">

    <h1>陈厚德考试查询系统</h1>
    <form>
        机构名称：<select id="select">
        <option value="0">请选择</option>
        <option value="1">养老院A</option>
        <option value="2">养老院B</option>
        <option value="3">养老院C</option>
        <option value="4">养老院D</option>
    </select>
        <hr>

        期望到货日期：<input type="text" id="date">
        <hr>
        状态：<select id="statu">
        <option value="">请选择</option>
        <option value="0">代发货</option>
        <option value="1">待收货</option>
    </select><hr>

        <hr>
        <input type="submit" value="重置">
        <input type="button" onclick="search_name(1)" value="查询">
    </form>

    <table border="1px solid black">

        <thead>
        <tr>
            <td>序号</td>
            <td>创建时间</td>
            <td>申请人</td>
            <td>机构名称</td>
            <td>数量</td>
            <td>期望到货日期</td>
            <td>状态</td>
            <td>操作</td>
        </tr>
        </thead>
        <tbody id="div">
        </tbody>
    </table>
    <div class="fenye">
    </div>

</div>


<script>


    function search_name(pageIndex){
        var date = $("#date").val();
        var select = $("#select").val();
        var statu = $("#statu").val();
        $("#div").empty();
        $(".fenye").empty();
        $.post("search_name", "pageIndex="+pageIndex+"&select="+select+"&statu="+statu+"&date="+date, function(data) {
            $(data.list).each(function () {
                var str ="";
                var up="";
                if(this.statu===0){
                    str="代发货";
                    up="发货";
                }
                if(this.statu===1){
                    str="待收货";
                    up="";
                }
                if(this.statu===2){
                    str="已收货";
                    up="";
                }

                var  tr ="<tr>"+
                    "<td>"+this.id+"</td>"+
                    "<td>"+this.create_time+"</td>"+
                    "<td>"+this.create_user+"</td>"+
                    "<td>"+this.org_id.org_name+"</td>"+
                    "<td>"+this.pro_number+"</td>"+
                    "<td>"+this.predict_time+"</td>"+
                    "<td>"+str+"</td>"+
                    "<td><a onclick='bbb("+this.id+")'>"+up+"</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href='Select?id="+this.id+"' target='_blank'>查看详情</a></td>"+
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







    $(function (){
        select(1);
    });

    function select(pageIndex){
        $("#div").empty();
        $(".fenye").empty();
        $.post("Do_Select", "pageIndex="+pageIndex, function(data) {
            $(data.list).each(function () {
                var str ="";
                var up="";
                if(this.statu===0){
                    str="代发货";
                    up="发货";
                }
                if(this.statu===1){
                    str="待收货";
                    up="";
                }
                if(this.statu===2){
                    str="已收货";
                    up="";
                }
                var  tr ="<tr>"+
                    "<td>"+this.id+"</td>"+
                    "<td>"+this.create_time+"</td>"+
                    "<td>"+this.create_user+"</td>"+
                    "<td>"+this.org_id.org_name+"</td>"+
                    "<td>"+this.pro_number+"</td>"+
                    "<td>"+this.predict_time+"</td>"+
                    "<td>"+str+"</td>"+
                    "<td><a onclick='bbb("+this.id+")'>"+up+"</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href='Select?id="+this.id+"' target='_blank'>查看详情</a></td>"+
                    "</tr>";
                $("#div").append(tr);
            });
            var fenye="<a onclick='select("+1+")'>首页</a>";
            fenye+="<a onclick='select("+(data.prePage)+")'>上一页</a>";
            fenye+="<a onclick='select("+(data.nextPage)+")'>下一页</a>";
            fenye+="<a onclick='select("+(data.pages)+")'>末页</a>&nbsp;&nbsp;&nbsp;";
            $.each(data.navigatepageNums,function (i,nav) {
                fenye+="<button onclick='select("+nav+")'>"+nav+"</button>&nbsp;&nbsp;&nbsp;";
            })
            fenye+="跳至<input type='text'  id='chd'>页&nbsp;&nbsp;&nbsp;";
            fenye+="<button onclick='select("+2+")'>go</button>&nbsp;&nbsp;&nbsp;";
            fenye+="<a>第"+data.pageNum+"页</a><a>共"+data.pages+"页<a>";
            $(".fenye").append(fenye);
        },"JSON");

    }


</script>

</body>
</html>
