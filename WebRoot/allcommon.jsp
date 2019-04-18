<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
  <head>
    <base href="<%=basePath%>">   
    <title>超级管理员后台-查询普通用户信息</title>  
    <meta name="viewport" content="width=device-width, initial-scale=1">
  </head>
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
		<h3 class="panel-title">普通用户信息</h3>
	</div>
	<div class="panel-body">
		<table class="table table-striped">
	<thead>
	<tr>
			<th>当前普通用户的数量</th>
			<th>${count}</th>
		</tr>
		<tr>
			<th>姓名</th>
			<th>密码</th>
			<th>操作</th>
		</tr>
	</thead>
<tbody id="tab">
	<s:iterator value="#request.list" var="u">
		<tr>
			<td>${u.username} </td>
			<td>${u.password}</td>
			<td><a href="/LawerSys/admin_dc.action?uid=${u.uid}">删除</a></td>
		</tr>		
			</s:iterator>
			<tr>
			<td colspan="2"><a href="/LawerSys/admin_c.action?i=${i-1}">上一页</a></td>
			<td colspan="2"><a href="/LawerSys/admin_c.action?i=${i+1}">下一页</a></td>
			</tr>
	</tbody>
</table>
	</div>
</div>
</div>
   <script src="js/vue.js"></script>
     <script src="js/alluser.js"></script>
  </body>
</html>
