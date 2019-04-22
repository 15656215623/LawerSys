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
<title>律师共同的头部</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.min.css" />
<link rel="stylesheet" href="css/index.css" />
<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/head.js"></script>
<script src="js/skiller.js"></script>
</head>
<body onload="load_data()">
<nav class="navbar navbar-default" role="navigation">
		<div class="container-fluid">
			<div class="navbar-left">
				<a class="navbar-brand" href="#" id="cue">还没登录，游客状态</a> <a
					class="navbar-brand" href="#" id="uname"></a> <img
					style="width:50px;height:50px;border-radius:50%;" id="mylogo" />
			</div>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="index.jsp">
						<button type="button" data-toggle="modal" data-target="#layre"
							class="btn btn-success">首页</button>
				</a></li>
				<li><a href="lawer.jsp">
				<button type="button" class="btn btn-success">律师中心</button></a></li>
				<li><a href="#">
						<button type="button" class="btn btn-danger" onclick="exitu()">退出</button>
				</a></li>
			</ul>
		</div>
	</nav>
	</div>
	
</body>
</html>

			
			
