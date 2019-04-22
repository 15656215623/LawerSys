<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE>
<html>
  <head>
    <base href="<%=basePath%>">   
    <title>公共部分</title>  
    <meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/admin.css"/>
  </head>
  <body>
  <jsp:include page="head.jsp"></jsp:include>
<!-- 手风琴菜单 -->
<!--  手风琴菜单--> 
<div class="panel-group" id="accordion">
<!-- 第一个部分 -->
<div class="panel panel-default">
<div class="panel-heading">
<h4 class="panel-title">
<a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" class="collapsed">
用户管理
</a>
</h4>
</div>
<div id="collapseOne" class="panel-collapse collapse in">
<div class="part_panel panel-body">
<p><a href="/LawerSys/admin_u.action">律师用户</a></p>
<p><a href="/LawerSys/admin_c.action">普通用户</a></p>
</div>
</div>
</div>
<!-- 第二个部分 -->
<div class="panel panel-default">
<div class="panel-heading">
<h4 class="panel-title">
<a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">
待审核事项
</a>
</h4>
</div>
<div id="collapseTwo" class="panel-collapse collapse in">
<div class="part_panel panel-body">
<p><a href="/LawerSys/query_a.action">待审核用户</a></p>
<p><a href="/LawerSys/ademo.action">待审核上传案例</a></p>
</div>
</div>
</div>
<!-- 第三个部分 -->
<div class="panel panel-default">
<div class="panel-heading">
<h4 class="panel-title">
<a data-toggle="collapse" data-parent="#accordion" href="#collapseThree">
收到投诉
</a>
</h4>
</div>
<div id="collapseThree" class="panel-collapse collapse in">
<div class="part_panel panel-body">
<p><a href="/LawerSys/usercom.action">用户投诉</a></p>
<p><a href="/LawerSys/lawercom.action">律师投诉</a></p>
</div>
</div>
</div>
</div>
  </body>

</html>
