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
    <title>律师管理员后台-个人资料</title>  
    <meta name="viewport" content="width=device-width, initial-scale=1">
  </head>
  <body>
<jsp:include page="Lcommon.jsp"></jsp:include>
<!--手风琴菜单  -->
<div id="right">
<table class="table">
	<caption>用户信息</caption>
		<tr class="active">
			<td>用户名</td>
			<td>${layer.lanme }</td>
		</tr>
		<tr class="success">
			<td>所处地点</td>
			<td>${layer.laddress }</td>
		</tr>
		<tr  class="warning">
				<td>事务所名称</td>
			   <td>${layer.officename}</td>
		</tr>
		<tr  class="danger">
			<td>级别</td>
			<td>${layer.caste}</td>
		</tr>
	<tr class="active">
			<td>执业证号</td>
			<td>${layer.liseid}</td>
		</tr>
		<tr class="success">
			<td>从业时间</td>
			<td>${layer.ltime}</td>
		</tr>
		<tr  class="warning">
				<td>擅长类型</td>
			<td>${layer.kinds}</td>
		</tr>
		<tr  class="danger">
			<td>个人简介</td>
			<td>${layer.instroduce}</td>
		</tr>
</table>
</div>
  </body>
</html>

  </body>
</html>
