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
    <title>律师用户后台-我的投诉</title>  
    <meta name="viewport" content="width=device-width, initial-scale=1">
  </head>
  <body>
<jsp:include page="Lcommon.jsp"></jsp:include>
<!--手风琴菜单  -->
<div id="right" >
<table class="table">
<caption>我提交的投诉</caption>
<tr><td>投诉用户</td><td>投诉原因</td><td>投诉时间</td></tr>	
	<s:iterator value="#request.list" var="l">
		<tr class="active">
			<td>${l.lawer}</td>
			<td>${l.content}</td>
			<td>${l.time}</td>
		</tr>
		</s:iterator>
</table>
</div>
 </body>
</html>

