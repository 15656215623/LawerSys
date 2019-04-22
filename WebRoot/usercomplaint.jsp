<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE>
<html>
  <head>
    <base href="<%=basePath%>">   
    <title>律师用户后台-投诉界面</title>  
    <meta name="viewport" content="width=device-width, initial-scale=1">
  </head>
  <link  rel="stylesheet" href="css/pl.css"/>
  <body>
<jsp:include page="Lcommon.jsp"></jsp:include>
<!-- 打星 -->
<div id="right">
<div class="panel panel-primary">
    <div class="panel-heading">
        <h3 class="panel-title">律师投诉页面</h3>
    </div>
    <div class="panel-body">
        <table class="table">
      <tr>
         <td>投诉用户</td>
         <td>
         <%String other=request.getParameter("other");  
         other = new String (other.getBytes("ISO-8859-1"),"UTF-8");
          %>
        <span id="username"><%=other%></span>
        </td>
      </tr>
      <tr>
         <td>投诉原因</td>
         <td>
            <input type="text" class="form-control" id="content" placeholder="请输入投诉的理由">
         </td>
      </tr>	 
       <tr>
         <td colspan="2">
         <button type="button" class="btn btn-primary" onclick="mycomplaint()">提交</button>
         </td>
      </tr>
</table>
    </div>
</div>
</div>
<script type="text/javascript">
function mycomplaint(){
//律师名   投诉人   理由
var username=$("#username").html();
var content=$("#content").val();
var lawer=localStorage.getItem("username");
	$.ajax({
	    type : "post",
		url : "http://localhost:8080/LawerSys/ucomplaint.action",
		dataType :"text",
		data : {
			lawer : username,
			user : lawer,
			content:content
		},
		success : function() {
			window.location.href="http://localhost:8080/LawerSys/ucomplaint_success.jsp";
		},
	})
	//开始ajax
}

</script>
  </body>
</html>
