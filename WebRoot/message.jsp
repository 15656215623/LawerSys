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
    <title>律师管理员后台-用户未读资料</title>  
    <meta name="viewport" content="width=device-width, initial-scale=1">
  </head>
  <body>
<jsp:include page="Lcommon.jsp"></jsp:include>
<!--手风琴菜单  -->
<div id="right">
<table class="table">
	<caption>未读消息</caption>
	<s:iterator value="#request.user" var="u">
		<tr  class="danger">
			<td>用户${u}发来咨询信息</td>
			<td><button type="button" class="btn btn-info">
			<a onclick="getchart('${u}')">点击进入咨询室</a>
			</button></td>
		</tr>
		</s:iterator>
</table>
</div>
 </body>
 <script type="text/javascript">
  function getchart(self){
  //存储要咨询的用户信息
  var uname=localStorage.getItem("username");
    var logo=localStorage.getItem("userlogo");
  //根据未读消息，查询显示未读的消息
  window.location.href="http://localhost:8080/LawerSys/law_query.action?self="+self+"&&other="+uname+"&&lawerlogo="+logo;
  }
  </script>
</html>

