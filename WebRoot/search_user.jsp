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
    <title>普通用户后台-我咨询的类型</title>  
    <meta name="viewport" content="width=device-width, initial-scale=1">
  </head>
  <body>
<jsp:include page="ucommon.jsp"></jsp:include>
<!--手风琴菜单  -->
<div class="rgt" >
<div class="panel panel-primary">
    <div class="panel-heading">
        <h3 class="panel-title">我的咨询类型</h3>
    </div>
    <div class="panel-body">
       <s:iterator value="#request.user" var="l">
       <s:if test="#l.ht!=0">合同纠纷共咨询${l.ht}次;</s:if>
         <s:if test="#l.jd!=0">借贷纠纷共咨询${l.jd}次;</s:if>
         <s:if test="#l.ld!=0">劳动纠纷共咨询${l.ld}次;</s:if>
         <s:if test="#l.xs!=0">刑事辩护共咨询${l.xs}次;</s:if>
         <s:if test="#l.jt!=0">交通事故共咨询${l.jt}次;</s:if>
         <s:if test="#l.fc!=0">房产纠纷共咨询${l.fc}次;</s:if>
         <s:if test="#l.jz!=0">建筑工程共咨询${l.jz}次;</s:if>
         <s:if test="#l.lh!=0">离婚纠纷共咨询${l.lh}次;</s:if>
       </s:iterator>
    </div>
</div>
</div>
 </body>
</html>

