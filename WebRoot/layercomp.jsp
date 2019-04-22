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
    <title>超级管理员后台-律师投诉</title>  
    <meta name="viewport" content="width=device-width, initial-scale=1">
  </head>
  <body>
<jsp:include page="Lcommon.jsp"></jsp:include>
<!--手风琴菜单  -->
<div id="right">
<table class="table">
<tr><td>被投诉用户</td><td>投诉原因</td><td>投诉律师</td><td>投诉时间</td><td>撤销操作</td></tr>
	<caption>律师提交的投诉</caption>
	<s:iterator value="#request.list" var="l">
		<tr class="active">
			<td>${l.lawer}</td>
			<td>${l.content}</td>
			<td>${l.user}</td>
			<td>${l.time}</td>
			<td onclick="deleteme('${l.cid}')">撤销</td>
		</tr>
		</s:iterator>
</table>
</div>
 </body>
 <script type="text/javascript">
 function deleteme(id){
 window.location.href="http://localhost:8080/LawerSys/layerde.action?cid="+id;
 }
 </script>
</html>

