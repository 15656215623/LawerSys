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
    <title>普通用户后台-我的咨询订单</title>  
    <meta name="viewport" content="width=device-width, initial-scale=1">
  </head>
  <script type="text/javascript" src="js/lookorder.js"></script>
  <body>
<jsp:include page="ucommon.jsp"></jsp:include>
<!--手风琴菜单  -->
<div class="rgt">
<table class="table">
	<caption>我的咨询订单</caption>
		<tr class="active">
			<td>律师姓名</td>
			<td>咨询类型</td>
			<td>咨询时间</td>
			<td>评价</td>
			<td>查询咨询记录</td>
			<td>删除记录</td>
			<td>投诉</td>
		</tr>
		<s:iterator var="l" value="#request.list">
		<tr class="success">
			<td>${l.other }</td>
			<td>${l.kinds }</td>
			<td>${l.time }</td>
			<td>
			<s:if test="#l.content==null">
			<button type="button" class="btn btn-info"><a href="discuss.jsp?oid=${oid}&&lanme=${l.other }">评价</a></button>
			</s:if>
			<s:else>
			已评价
			</s:else>
			</td>
			<td>
			<button type="button" class="btn btn-success" onclick="queryorder('${l.other}')">查询咨询记录</button>
			</td>
			<td>
			<button type="button" class="btn btn-danger" onclick="deleteorder('${l.other}')">删除咨询记录</button>
			</td>
			<td>
           <button type="button" class="btn btn-warning" >
             <a href="complaint.jsp?other=${l.other}">投诉</a></button>
           </td>
		</tr>
		</s:iterator>
</table>
</div>
  </body>
</html>

  </body>
</html>
