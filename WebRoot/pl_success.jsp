<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE>
<html>
  <head>
    <base href="<%=basePath%>">   
    <title>普通用户后台-评论成功</title>  
    <meta name="viewport" content="width=device-width, initial-scale=1">
  </head>
  <link  rel="stylesheet" href="css/pl.css"/>
  <body>
<jsp:include page="ucommon.jsp"></jsp:include>
<!-- 打星 -->
<div class="rgt">
<div class="panel panel-primary">
    <div class="panel-heading">
        <h3 class="panel-title">感谢您的评价</h3>
    </div>
    <div class="panel-body">
       <img src="icon/smile.png"/>
       <img src="icon/smile.png"/>
       <a href="usercenter.jsp">返回</a>
    </div>
</div>
</div>
  </body>
</html>
