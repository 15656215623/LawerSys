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
<title>基于web的法律线上咨询平台管理系统</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<script src="js/index.js"></script>
<body>
<jsp:include page="head.jsp"></jsp:include>	
	<!-- logo部分 -->
	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<img src="image/logo.PNG" style="height: 150px;" />
			</div>
			<div class="col-md-2">
				<br> <br>
				<button type="button" class="btn btn-primary btn-lg"
					onclick="window.location.href='index.jsp'">首页</button>
			</div>
			<div class="col-md-2 h4">
				<br> <br> 我要咨询
			</div>
			<div class="col-md-2 h4">
				<br> <br> 我的订单
			</div>
		</div>
	</div>
	<!-- 第二部分 -->
	<div class="row">
		<img src="image/011.jpg" style="width:100%;height: 100%;" />
	</div>
	<!-- 第二部分 -->
	<!-- 第三部分  功能展示 -->
	<br>
	<div class="container">
		<div class="row">
			<div class="col-md-8 h4">
				<img src="icon/dz.png" />&nbsp;&nbsp;&nbsp;按专长找律师
			</div>
			<div class="col-md-4 h4" style="color: #3899fe"><a href="skiller.jsp">MORE >></a></div>
		</div>
		<br>
		<div class="row">
			<div class="col-md-2">
				<div class="row" onclick="getkinds('合同纠纷')">
					<img src="icon/ht.png" />
				</div>
				<div class="row h5" onclick="getkinds('合同纠纷')">合同纠纷</div>
			</div>
			<div class="col-md-2">
				<div class="row" onclick="getkinds('借贷纠纷')">
					<img src="icon/jdjf.png" />
				</div>
				<div class="row h5"  onclick="getkinds('借贷纠纷')">借贷纠纷</div>
			</div>
			<div class="col-md-2">
				<div class="row" onclick="getkinds('劳动纠纷')">
					<img src="icon/ldjf.png" />
				</div>
				<div class="row h5"  onclick="getkinds('劳动纠纷')">劳动纠纷</div>
			</div>
			<div class="col-md-2">
				<div class="row" onclick="getkinds('刑事辩护')">
					<img src="icon/xsbh.png" />
				</div>
				<div class="row h5"  onclick="getkinds('刑事辩护')">刑事辩护</div>
			</div>
			<div class="col-md-2">
				<div class="row" onclick="getkinds('交通事故')">
					<img src="icon/jtsg.png" />
				</div>
				<div class="row h5"  onclick="getkinds('交通事故')">交通事故</div>
			</div>
			<div class="col-md-2">
				<div class="row">
					<img src="icon/fcjf.png" onclick="getkinds('房产纠纷')"/>
				</div>
				<div class="row h5"  onclick="getkinds('房产纠纷')">房产纠纷</div>
			</div>
		</div>
	<!-- 第三部分 功能展示  -->
	<br>
	<!-- 律师推送 -->
	<div class="container">
		<div class="row">
			<div class="col-md-8 h4">
				<img src="icon/dw.png" />&nbsp;&nbsp;&nbsp;附近的律师&nbsp;&nbsp;&nbsp;铜陵
			</div>
			<div class="col-md-4 h4" style="color: #3899fe">MORE >></div>
		</div>
	</div>
	<br>
	<!--循环遍历体  -->
	<div class="container">
		<table class="table">
			<tr>
				<td rowspan="3"><img src="layer/l1.png" class="mylogo" /></td>
				<td>李律师</td>
			</tr>
			<tr>
				<td>重庆市 市辖区|重庆融策律师事务所</td>
			</tr>
			<tr>
				<td>合同纠纷（21案例）</td>
			</tr>
		</table>
		<table class="table">
			<tr>
				<td rowspan="3"><img src="layer/ly2.jpg" class="mylogo" /></td>
				<td>周律师</td>
			</tr>
			<tr>
				<td>河南省 安阳市|河南地利律师事务所</td>
			</tr>
			<tr>
				<td>离婚纠纷（6案例）</td>
			</tr>
		</table>
	</div>
	<!-- 律师推送 -->
</body>
</html>
