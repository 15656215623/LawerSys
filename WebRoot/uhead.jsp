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
<title>用户共同的头部</title>
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
				<a class="navbar-brand"  id="cue">还没登录，游客状态</a> <a
					class="navbar-brand"  id="uname"></a> <img
					style="width:50px;height:50px;border-radius:50%;" id="mylogo" />
			</div>
			<ul class="nav navbar-nav navbar-right">
			<!-- 实现推送 -->
				<li><a>
						<button type="button" onclick="uindex()"
							class="btn btn-success">首页</button>
				</a></li>
				<li><a href="usercenter.jsp">
						<button type="button"  class="btn btn-success">个人中心</button>
				</a></li>
				<li><a >
						<button type="button" class="btn btn-danger" onclick="exitu()">退出</button>
				</a></li>
			</ul>
		</div>
	</nav>
	
</body>
<script type="text/javascript">
function  uindex(){
	var user=localStorage.getItem("username");
	window.location.href="http://localhost:8080/LawerSys/upush.action?username="+user;	
}

</script>

</html>

			
			
