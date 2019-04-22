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
    <title>超级管理员后台-审核上传的案例</title>  
    <meta name="viewport" content="width=device-width, initial-scale=1">
  </head>
    <script src="js/demo.js"></script>
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
		<h3 class="panel-title">待审核的律师上传的案例</h3>
	</div>
	<div class="panel-body">
		<table class="table table-striped">
	<thead>
		<tr>
			<th>律师姓名</th>
			<th>案例</th>
			<th>案例类型</th>
			<th>下载案例</th>
			<th>审核</th>
		</tr>
	</thead>
	<tbody id="tab">
	<s:iterator value="#request.list" var="audemo">
		<tr>
			<td>${audemo.lanme} </td>
			<td>${audemo.demo}</td>
			<td>${audemo.kinds}</td>
			<td><a onclick="downfile(${audemo.did})">下载</a></td>
			<td><button id="${audemo.did}" style="background-color:#8ac007;color:white" onclick="getpass('${audemo.did}','${audemo.lanme}','${audemo.demo}','${audemo.kinds}')">通过</button></td>		
		</tr>
			</s:iterator>
	</tbody>
</table>
	</div>
</div>
</div>
  </body>
</html>
