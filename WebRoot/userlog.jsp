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
    <title>律师用户后台-咨询记录</title>  
    <meta name="viewport" content="width=device-width, initial-scale=1">
  </head>
  <style>
  .showtext{
  width: 100%;
  height: 100%;
  resize: none;
  }
  </style>
  <body>
<jsp:include page="ucommon.jsp"></jsp:include>
<!--手风琴菜单  -->
<div class="rgt">
<div class="panel panel-danger" >
    <div class="panel-heading">
        <h3 class="panel-title">咨询记录</h3>
    </div>
    <div class="panel-body">
      <textarea  style="overflow-y:scroll" class="showtext">
	  <s:iterator var="l" value="#request.list">
		${l.active }        ${l.time }
		${l.content }
		</s:iterator>
      </textarea>
    </div>
</div>	
</div>
  </body>
</html>

  </body>
</html>
