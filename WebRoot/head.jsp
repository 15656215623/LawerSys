<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
<title>共同的头部</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.min.css" />
<link rel="stylesheet" href="css/index.css" />
<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/head.js"></script>
<script src="js/skiller.js"></script>
<style>
#start li,#start{
list-style: none;
float: left;
}
</style>
</head>
<body onload="load_data()">
<nav class="navbar navbar-default" role="navigation">
		<div class="container-fluid">
			<div class="navbar-left">
				<a class="navbar-brand" id="cue">还没登录，游客状态</a> <a
					class="navbar-brand"  id="uname"></a> <img
					style="width:50px;height:50px;border-radius:50%;" id="mylogo" />
			</div>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="http://localhost:8080/LawerSys/apush.action">
						<button type="button" data-toggle="modal" data-target="#layre"
							class="btn btn-success">首页</button>
				</a></li>
				<li><a  id="mycenter">
						<button type="button" class="btn btn-success">个人中心</button>
				</a></li>
				<li><a >
						<button type="button" data-toggle="modal" data-target="#superuser"
							class="btn btn-success">管理员登录</button>
				</a></li>
				<li><a >
						<button type="button" data-toggle="modal" data-target="#layre"
							class="btn btn-success">注册</button>
				</a></li>
				<li><a >
						<button type="button" data-toggle="modal" data-target="#laylo"
							class="btn btn-info">登录</button>
				</a></li>
				<li><a >
						<button type="button" class="btn btn-danger" onclick="exitu()">退出</button>
				</a></li>
			</ul>
		</div>
	</nav>

<!-- 模态框 -->
	<div class="modal fade" id="layre" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true" id="close_re">&times;</button>
					<h4 class="modal-title" id="myModalLabel" onchange="">
						<span onclick="layr()" id="layers">律师用户注册</span><span
							style="margin-left:30%;color:#337ab7" onclick="commr()"
							id="cuser">普通用户注册</span>
					</h4>
				</div>
				<!-- 模态框  律师注册 -->
				<div class="modal-body" id="lay_reg">
					<form class="form-horizontal" role="form" method="post"
						action="/LawerSys/audit_r.action">
						<div class="form-group">
							<div class="col-sm-10">
								<button id="fat-btn" class="btn btn-primary" type="button"
									onclick="show();">请选择律师类型</button>
								<input type="text" class="width:50%;" name="caste"
									placeholder="律师类型" id="tresult">
							</div>
							<div class="col-sm-10" id="kinds">
								<ul style="list-style:none;float:left" id="uli"
									onclick="getkinds()">
									<li>执业律师</li>
									<li>实习律师</li>
									<li>合伙人律师</li>
									<li>主任律师</li>
								</ul>
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-10">
								<input type="text" class="form-control" name="lanme"
									placeholder="请输入真实姓名">
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-10">
								<input type="password" class="form-control" name="password"
									placeholder="请输入密码">
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-10">
								<input type="text" class="form-control" name="laddress"
									placeholder="工作地点">
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-10">
								<input type="text" class="form-control" name="officename"
									placeholder="事务所名称">
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-10">
								<input type="text" class="form-control" name="liseid"
									placeholder="执业证号">
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-10">
								<input type="text" class="form-control" name="ltime"
									placeholder="执业时间">
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-10">
								请选择1-3个您擅长的类型<br> <input type="text" class="form-control"
									id="youkinds" name="kinds" placeholder="擅长类型">
								<ul id="allli" onclick="choose_kinds()">
									<li><button type="button" class="btn btn-default"
											style="background-color: white">合同纠纷</button></li>
									<li><button type="button" class="btn btn-default"
											style="background-color: white">借贷纠纷</button></li>
									<li><button type="button" class="btn btn-default"
											style="background-color: white">劳动纠纷</button></li>
									<li><button type="button" class="btn btn-default"
											style="background-color: white">刑事辩护</button></li>
									<li><button type="button" class="btn btn-default"
											style="background-color: white">交通事故</button></li>
									<li><button type="button" class="btn btn-default"
											style="background-color: white">房产纠纷</button></li>
									<li><button type="button" class="btn btn-default"
											style="background-color: white">建筑工程</button></li>
									<li><button type="button" class="btn btn-default"
											style="background-color: white">离婚纠纷</button></li>
								</ul>
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-10">
								<button type="submit" class="btn btn-default">注册</button>
							</div>
						</div>
					</form>
				</div>
				<!-- 模态框  律师注册 -->

				<!-- 模态框 普通用户注册 -->
				<div class="modal-body" id="user_reg">
					<form class="form-horizontal" role="form">
						<div class="form-group">
							<div class="col-sm-10">
								<input type="text" class="form-control" id="username"
									placeholder="请输入用户名">
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-10">
								<input type="password" class="form-control" id="password"
									placeholder="输入密码">
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-10">
								<input type="password" class="form-control" id="rpassword"
									placeholder="再次确定密码">
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-10">
								<button type="button" class="btn btn-default"
									onclick="userregedit()">注册</button>
							</div>
						</div>
					</form>
				</div>
				<!-- 模态框 普通用户注册 -->
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭
					</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>
	<!--律师登录  -->
	<!-- 模态框（Modal） -->
	<div class="modal fade" id="laylo" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true" id="close_lo">&times;</button>
					<h4 class="modal-title" id="myModalLabel">
						<span onclick="laylogin()" id="lsl">律师用户登录</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
							onclick="userlogin()" id="ptl" sty>普通用户登录</span>
					</h4>
				</div>
				<!-- 律师用户登录 -->
				<div class="modal-body" id="lawerlo">
					<form class="form-horizontal" role="form">
						<div class="form-group">
							<div class="col-sm-10">
								<input type="text" class="form-control" id="lanme"
									placeholder="请输入律师登录用户名">
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-10">
								<input type="password" class="form-control" id="lpass"
									placeholder="请输入律师登录密码">
							</div>
						</div>
						<div class="form-group">
							<div class="col-md-10">
								<button type="button" class="btn btn-default"
									onclick="layerlogin()">登录</button>
							</div>
							<div class="col-md-2">
								<span><a>忘记密码</a></span>
							</div>
							
						</div>
					</form>
				</div>
				<!-- 律师用户登录 -->
				<!-- 普通用户登录 -->
				<div class="modal-body" id="commlo">
					<form class="form-horizontal" role="form">
						<div class="form-group">
							<div class="col-sm-10">
								<input type="text" class="form-control" id="uusername"
									placeholder="请输入用户名">
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-10">
								<input type="password" class="form-control" id="upassword"
									placeholder="密码">
							</div>
							
						</div>
						<div class="form-group">
							<div class="col-sm-10">
								<button type="button" class="btn btn-default" onclick="ulogin()">登录</button>
							</div>
								<div class="col-md-2">
								<span>忘记密码</span>
							</div>
						</div>
					</form>
				</div>
				<!--普通用户登录  -->
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭
					</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>
	<!--律师登录  -->
	<!-- 超级管理员登录-->
	<!--律师登录  -->
	<!-- 模态框（Modal） -->
	<div class="modal fade" id="superuser" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true" id="close_sp">&times;</button>
					<h4 class="modal-title" id="myModalLabel">超级管理员用户登录</h4>
				</div>
				<div class="modal-body" id="commlo">
					<form class="form-horizontal" role="form">
						<div class="form-group">
							<div class="col-sm-10">
								<input type="text" class="form-control" id="susername"
									placeholder="请输入用户名">
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-10">
								<input type="password" class="form-control" id="spassword"
									placeholder="密码">
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-10">
								<button type="button" class="btn btn-default" onclick="slogin()">登录</button>
							</div>
						</div>
					</form>
				</div>
				<!--普通用户登录  -->
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭
					</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>
	<!--律师登录  -->
	<!-- 超级管理员登录 -->

	
</body>
</html>

			
			
