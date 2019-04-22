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
    <title>超级管理员后台-审核律师用户</title>  
    <meta name="viewport" content="width=device-width, initial-scale=1">
  </head>
  <script src="js/query_audit.js"></script>
  <style>
  html{
  background-color: #1f3350;
  }
  
  </style>
  <body>
<jsp:include page="Common.jsp"></jsp:include>
<!--手风琴菜单  -->
<div style="position: relative;margin-left: 22%;margin-top: 6%;width: 74%;height: 53%;">
<div class="panel panel-success">
	<div class="panel-heading">
		<h3 class="panel-title">待审核的律师用户信息</h3>
	</div>
	<div class="panel-body">
		<table class="table table-striped">
	<thead>
		<tr>
			<th>姓名</th>
			<th>职称</th>
			<th>地区</th>
			<th>事务所名称</th>
			<th>执业证号</th>
			<th>持证时间</th>
			<th>处理纠纷类型</th>
			<th colspan="2">操作</th>
		</tr>
	</thead>
	<tbody id="tab">
	<s:iterator value="#request.list" var="audit">
		<tr>
			<td>${audit.lanme} </td>
			<td>${audit.caste}</td>
			<td>${audit.laddress}</td>
			<td>${audit.officename}</td>
			<td>${audit.liseid}</td>
			<td>${audit.ltime}年</td>
			<td>${audit.kinds}</td>
			<td><button id="${audit.lid}"  onclick="getpass('${audit.lid}')" style="background-color:#8ac007;color:white">通过</button></td>		
		</tr>
			</s:iterator>
	</tbody>
</table>
	</div>
</div>
</div>
  </body>
</html>
