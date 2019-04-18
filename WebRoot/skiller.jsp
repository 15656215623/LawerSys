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
<title>按照专长查找</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="js/skiller.js"></script>
</head>
<body>
	<jsp:include page="head.jsp"></jsp:include>
	<!--搜索公共的条件  -->
<jsp:include page="conditionPart.jsp"></jsp:include>
<br>
	<!--搜索公共的条件  -->
	<!-- 第二部分 -->
	<div class="row">
		<img src="image/011.jpg" style="width:100%;height: 100%;" />
	</div>
	<br>
	<!-- 第二部分 -->
	
	<div class="container">
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
            <div class="row">
			<div class="col-md-2">
				<div class="row" onclick="getkinds('建筑纠纷')">
					<img src="icon/jzgc.png" />
				</div>
				<div class="row h5"  onclick="getkinds('建筑纠纷')">建筑纠纷</div>
			</div>
			<div class="col-md-2">
				<div class="row" onclick="getkinds('离婚纠纷')">
					<img src="icon/lhjf.png" />
				</div>
				<div class="row h5"  onclick="getkinds('离婚纠纷')">离婚纠纷</div>
			</div>
			</div>
		
	</div>
	
</body>
</html>

			
			
