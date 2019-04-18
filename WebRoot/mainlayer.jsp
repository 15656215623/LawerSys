<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML>
<html>
<head>
<base href="<%=basePath%>">
<title>某个律师的主页面</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<link rel="stylesheet" href="css/search.css" />
<body>
<jsp:include page="head.jsp"></jsp:include>
<!-- 第二部分 -->
	<div style="width:100%;height:330px;">
		<img src="image/lay.jpg" style="width:100%;height:100%;" />
	</div>
	<!-- 第二部分 -->
	<!-- 显示模块 -->
	<div class="container-fluid">
	<div class="row" >
	<div class="col-md-8" >
	<table class="table tab_top" >
      <tr>
          <td rowspan="3"><img src="logo/mr.png" class="logo"/></td>
         <td>庞国芳律师</td>
      </tr>
      <tr>
         <td>铜陵市|安徽景旺律师事务所</td>
      </tr>
      <tr>
         <td>执业证号：12785222005244</td>
      </tr>
      <tr>
        <td>律师简介</td> <td>中闻律师事务所合伙人，擅长合同法，婚姻家庭事务，刑事辩护业务</td>
      </tr>
      <tr>
        <td colspan="2">开始咨询</td>
      </tr>
</table>
	</div>
	<div class="col-md-4" >
	<table class="table tab_top" >
      <tr><td>诉讼案例</td> <td>擅长类型 借贷纠纷、 刑事辩护、合同纠纷</td></tr>
	</table>
		</div>
		</div>
	</div>
	<!-- 显示模块 -->
</body>
</html>

			
			
