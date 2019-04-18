<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE>
<html>
  <head>
    <base href="<%=basePath%>">   
    <title>普通用户-公共部分</title>  
    <meta name="viewport" content="width=device-width, initial-scale=1">
<script src="js/Admin.js"></script>
<script src="js/user.js"></script>
  </head>
  <body>
 <jsp:include page="head.jsp"></jsp:include>
<!--修改密码页面 -->
<!-- 模态框（Modal） -->
<div class="modal fade" id="repass" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true" id="close_lo">
					&times;
				</button>
				<h4 class="modal-title" id="myModalLabel">
				   修改密码页面
				</h4>
			</div>
			<div class="modal-body">
			<form class="form-horizontal" role="form">
	<div class="form-group">
		<div class="col-sm-10">
			<input type="password" class="form-control" id="pass"  placeholder="请输入新的密码">
		</div>
	</div>
	<div class="form-group">
		<div class="col-sm-10">
			<input type="password" class="form-control" id="apass"  placeholder="再次输入密码">
		</div>
	</div>
	<div class="form-group">
		<div class="col-sm-offset-2 col-sm-10">
			<button type="button" class="btn btn-default" onclick="resetpass()">重置密码</button>
		</div>
	</div>
	</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭
				</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>
<!-- 修改密码页面 -->
  </body>
</html>
