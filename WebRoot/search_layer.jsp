<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML>
<html>
<head>
<base href="<%=basePath%>">
<title>查找律师页面</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<link rel="stylesheet" href="css/search.css" />
<body>
<jsp:include page="head.jsp"></jsp:include>
	<!-- 第二部分 -->
<jsp:include page="conditionPart.jsp"></jsp:include>
	<!-- 显示模块 -->
	<div class="container-fluid">
	<s:iterator value="#request.list" var="l">
	<div class="col-md-4" onclick="single_layer('${l.lanme}');">
	<table class="table tab_top" >
      <tr>
          <td rowspan="5"><img src="${l.logo}" class="logo"/></td>
         <td><span>${l.lanme}</span>律师</td>
      </tr>
       <tr>
				<td>
				<s:if test="#l.start==0">
				暂无星级
				</s:if>
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
			</tr>
      <tr>
         <td>${l.laddress}|${l.officename}</td>
      </tr>
      <tr>
				<td>擅长类型|${l.kinds}</td>
			</tr>
     
	 <tr>
         <td><s:if test="#l.ht!=0">合同纠纷共${l.ht}例;</s:if>
         <s:if test="#l.jd!=0">借贷纠纷共${l.jd}例;</s:if>
         <s:if test="#l.ld!=0">劳动纠纷共${l.ld}例;</s:if>
         <s:if test="#l.xs!=0">刑事辩护共${l.xs}例;</s:if>
         <s:if test="#l.jt!=0">交通事故共${l.jt}例;</s:if>
         <s:if test="#l.fc!=0">房产纠纷共${l.fc}例;</s:if>
         <s:if test="#l.jz!=0">建筑工程共${l.jz}例;</s:if>
         <s:if test="#l.lh!=0">离婚纠纷共${l.lh}例;</s:if>
         
         </td>
      </tr>
</table>
	</div>
	</s:iterator>
	</div>
	<!-- 显示模块 -->
	<script type="text/javascript">
	function single_layer(name){
	window.location.href="http://localhost:8080/LawerSys/single.action?lanme="+name;
	}
	</script>
</body>
</html>

			
			
