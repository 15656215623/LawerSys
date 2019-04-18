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
    <title>律师管理员后台-修改个人资料</title>  
    <meta name="viewport" content="width=device-width, initial-scale=1">
  </head>
  <body>
<jsp:include page="Lcommon.jsp"></jsp:include>
<!--手风琴菜单  -->
<div id="right">
<table class="table">
	<caption>修改个人用户信息</caption>
	<tr class="active">
			<td>修改密码</td>
			<td><input type="text" value="${layer.password}" id="pass"/></td>
		</tr>
		<tr class="success">
			<td>所处地点</td>
			<td><input type="text" value="${layer.laddress }" id="address"/></td>
		</tr>
		<tr  class="warning">
				<td>事务所名称</td>
			   <td><input type="text" value="${layer.officename}" id="oname"/></td>
		</tr>
		<tr class="active">
			<td>从业时间</td>
			<td><input type="text" value="${layer.ltime}" id="time"/></td>
		</tr>
		<tr  class="danger">
			<td>个人简介</td>
			<td><input type="text" value="${layer.instroduce}" id="instroduce" style="width:60%;height: 100%;"/></td>
		</tr>
		<tr class="success">
			<td colspan="2">
			<button type="button" class="btn btn-primary" onclick="save()">保存资料</button>
		</tr>
</table>
</div>
  </body>
</html>

  </body>
</html>
