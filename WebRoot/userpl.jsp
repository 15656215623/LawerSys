<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE>
<html>
<head>
<base href="<%=basePath%>">
<title>律师用户后台-关于我的评价</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<script type="text/javascript" src="js/lookorder.js"></script>
<style>
#start li,#start{
list-style: none;
float: left;
}
</style>
<body>
	<jsp:include page="Lcommon.jsp"></jsp:include>
	<!--手风琴菜单  -->
	<div id="right" style="width: 900px">
		<table class="table">
			<caption>关于我的评价</caption>
			<tr class="active">
				<td>用户姓名</td>
				<td>咨询类型</td>
				<td>综合星级</td>
				<td>评价</td>
				<td>咨询时间</td>
			</tr>
			<s:iterator var="l" value="#request.list">
				<tr class="success">
					<td>${l.self }</td>
					<td>${l.kinds }</td>
					
					<td>	
					<ul id="start">
					<s:if test="#l.start==1">
						<li><img src="icon/start.png" /></li>	
						</s:if> <s:if test="#l.start==2">
								<li><img src="icon/start.png" /></li>
								<li><img src="icon/start.png" /></li>
						</s:if> <s:if test="#l.start==3">	
								<li><img src="icon/start.png" /></li>
								<li><img src="icon/start.png" /></li>
								<li><img src="icon/start.png" /></li>
						</s:if> <s:if test="#l.start==4">
								<li><img src="icon/start.png" /></li>
								<li><img src="icon/start.png" /></li>
								<li><img src="icon/start.png" /></li>
								<li><img src="icon/start.png" /></li>
						</s:if> <s:if test="#l.start==5">
								<li><img src="icon/start.png" /></li>
								<li><img src="icon/start.png" /></li>
								<li><img src="icon/start.png" /></li>
								<li><img src="icon/start.png" /></li>
								<li><img src="icon/start.png" /></li>
						</s:if>
						</ul>
						</td>
					<td><s:if test="#l.content!=null">
			${l.content }
			</s:if></td>
			<td>${l.time }</td>
				</tr>
			</s:iterator>
		</table>
	</div>
</body>
</html>

</body>
</html>
