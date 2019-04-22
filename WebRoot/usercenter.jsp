<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE>
<html>
  <head>
    <base href="<%=basePath%>">   
    <title>普通用户后台</title>  
    <meta name="viewport" content="width=device-width, initial-scale=1">
  </head>

  <body>
<!--手风琴菜单  -->
 <jsp:include page="user.jsp"></jsp:include>
 <div class="rgt">
 <img src="image/banner1.png" style="width:100%;height:100%;"/>
 </div>
  </body>
</html>
