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
    <title>律师用户后台-我的咨询订单</title>  
    <meta name="viewport" content="width=device-width, initial-scale=1">
  </head>
  <script type="text/javascript" src="js/userorder.js"></script>
  <body>
<jsp:include page="Lcommon.jsp"></jsp:include>
<!--手风琴菜单  -->
<div id="right">
<table class="table">
	<caption>我的咨询订单</caption>
		<tr class="active">
			<td>用户姓名</td>
			<td>咨询类型</td>
			<td>咨询时间</td>
			<td>查询咨询记录</td>
			<td>投诉</td>
		</tr>
		<s:iterator var="l" value="#request.list">
		<tr class="success">
			<td>${l.self }</td>
			<td>${l.kinds }</td>
			<td>${l.time }</td>
			<td>
			<button type="button" class="btn btn-success" onclick="queryorder('${l.self}')">查询咨询记录</button>
			</td>
			<td>
           <button type="button" class="btn btn-warning" >
             <a href="usercomplaint.jsp?other=${l.self}">投诉</a></button>
           </td>
		</tr>
		</s:iterator>
</table>
</div>
  </body>
</html>

  </body>
</html>
