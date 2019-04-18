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
    <title>律师管理员后台-审核通过的案例</title>  
    <meta name="viewport" content="width=device-width, initial-scale=1">
  </head>
  <body>
<jsp:include page="Lcommon.jsp"></jsp:include>
<!--手风琴菜单  -->
<div id="right">
<table class="table">
	<caption>诉讼案例</caption>
	<s:iterator value="#request.c" var="l">
		<tr class="active">
		    <td>${l.lanme}</td>
			<td> <s:if test="#l.ht!=0">合同纠纷共${l.ht}例;</s:if>
                 <s:if test="#l.ht!=0">借贷纠纷共${l.ht}例;</s:if>
               <s:if test="#l.ld!=0">劳动纠纷共${l.ld}例;</s:if>
                  <s:if test="#l.xs!=0">刑事辩护共${l.xs}例;</s:if>
               <s:if test="#l.jt!=0">交通事故共${l.jt}例;</s:if>
                <s:if test="#l.fc!=0">房产纠纷共${l.fc}例;</s:if>
	   <s:if test="#l.jz!=0">建筑工程共${l.jz}例;</s:if>
	   <s:if test="#l.lh!=0">  离婚纠纷共${l.lh}例;</s:if></td>			
		</tr>
		</s:iterator>
</table>
</div>
  </body>
</html>

  </body>
</html>
