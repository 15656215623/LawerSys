<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE>
<html>
  <head>
    <base href="<%=basePath%>">   
    <title>普通用户-公共部分</title>  
    <meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/admin.css"/>
<script src="js/Admin.js"></script>
  </head>
  <body>
  <jsp:include page="ucommon.jsp"></jsp:include>
  </body>
</html>
