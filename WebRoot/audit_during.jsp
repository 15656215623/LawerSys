<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE>
<html>
  <head>
    <base href="<%=basePath%>">
    <title>似锦网-律师注册待审核</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
  </head>
  <body>
  <jsp:include page="head.jsp"></jsp:include>
<div class="container" style="margin-top: 6%;margin-left: 20%;">
<img src="image/shenhe.PNG" />
</div>
  </body>
</html>
