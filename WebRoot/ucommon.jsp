<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
<title>用户公共部分</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/admin.css" />
<script src="js/user.js"></script>
</head>
<style>
.rgt{
position: absolute;
    width: 801px;
    height: 500px;
    top: 0%;
    left: 137%;

}
</style>
<body>	
<jsp:include page="uhead.jsp"></jsp:include>
	<!-- 手风琴菜单 -->
	<!--  手风琴菜单-->
	<div class="panel-group" id="accordion">
		<!-- 第一个部分 -->
		<div class="panel panel-default">
			<div class="panel-heading">
				<h4 class="panel-title">
					<a data-toggle="collapse" data-parent="#accordion"
						href="#collapseOne" class="collapsed"> 个人中心 </a>
				</h4>
			</div>
			<div id="collapseOne" class="panel-collapse collapse in">
				<div class="part_panel panel-body">
					<p>
						<button type="button" data-toggle="modal" data-target="#repass"
							class="btn btn-success">修改密码</button>
					</p>
				</div>
			</div>
		</div>
		<!-- 第二个部分 -->
		<div class="panel panel-default">
			<div class="panel-heading">
				<h4 class="panel-title">
					<a data-toggle="collapse" data-parent="#accordion"
						href="#collapseTwo">咨询中心</a>
				</h4>
			</div>
			<div id="collapseTwo" class="panel-collapse collapse in">
				<div class="part_panel panel-body">
					<p onclick="findorder()">
					我的咨询记录
					</p>
					<p onclick="myaccess()">
					我的评价
					</p>
					<p onclick="complaint()">
					我的投诉
					</p>
					<p onclick="mykinds()">
					我的咨询类型
					</p>
				</div>
			</div>
		</div>	
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
