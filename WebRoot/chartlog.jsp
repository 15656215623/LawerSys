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
    <title>普通用户后台-咨询记录</title>  
    <meta name="viewport" content="width=device-width, initial-scale=1">
  </head>
  <script type="text/javascript" src="js/lookorder.js"></script>
  <style>
  .showtext{
  width: 100%;
  height: 100%;
  resize: none;
  }
  </style>
  <body>
<jsp:include page="Lcommon.jsp"></jsp:include>
<!--手风琴菜单  -->
<div id="right">
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
