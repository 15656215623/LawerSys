<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
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
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>
<script src="js/location.js"></script>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=O7gtWVLsIBlFrjfSqq6HVcWAIm3xAKfw"></script>
<body>
<jsp:include page="head.jsp"></jsp:include>
	<!-- logo部分 -->
	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<img src="image/logo.PNG" style="height: 150px;" />
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
			<div class="col-md-8 h4" >
				<img src="icon/dw.png" />&nbsp;&nbsp;&nbsp;<span onclick="nearby()">附近的律师</span>&nbsp;&nbsp;&nbsp;<span id="allmap"></span>
			</div>
			<div class="col-md-4 h4" style="color: #3899fe" onclick="nearby()">MORE >></div>
		</div>
	</div>
	<br>
	<!--循环遍历体 ，根据咨询类型来显示 -->
	<div class="container">
	<s:iterator value="#request.list" var="l">
	<table class="table" onclick="single_layer('${l.lanme}');">
			<tr>
				<td rowspan="5"><img src="${l.logo}" class="mylogo" /></td>
				<td><span>${l.lanme}</span>律师</td>
			</tr>
			<tr>
			<td>
			<s:if test="#l.start==0">
				暂无星级
				</s:if>
				<ul id="start">
				
					<s:if test="#l.start==1">
						<li><img src="icon/start.png" /></li>	
						</s:if> <s:if test="#l.start==2">
								<li><img src="icon/start.png" /></li>
								<li><img src="icon/start.png" /></li>
						</s:if> <s:if test="#l.start==3">	
								<li><img src="icon/start.png" /></li>
								<li><img src="icon/start.png" /></li>
								<li><img src="icon/start.png" /></li>
						</s:if> <s:if test="#l.start==4">
								<li><img src="icon/start.png" /></li>
								<li><img src="icon/start.png" /></li>
								<li><img src="icon/start.png" /></li>
								<li><img src="icon/start.png" /></li>
						</s:if> <s:if test="#l.start==5">
								<li><img src="icon/start.png" /></li>
								<li><img src="icon/start.png" /></li>
								<li><img src="icon/start.png" /></li>
								<li><img src="icon/start.png" /></li>
								<li><img src="icon/start.png" /></li>
						</s:if>
						</ul>
				
				</td>
			</tr>
			<tr>
				 <td>${l.laddress}|${l.officename}</td>
			</tr>
			 <tr>
				<td>擅长类型|${l.kinds}</td>
			</tr>
			 <tr>
         <td><s:if test="#l.ht!=0">合同纠纷共${l.ht}例;</s:if>
         <s:if test="#l.jd!=0">借贷纠纷共${l.jd}例;</s:if>
         <s:if test="#l.ld!=0">劳动纠纷共${l.ld}例;</s:if>
         <s:if test="#l.xs!=0">刑事辩护共${l.xs}例;</s:if>
         <s:if test="#l.jt!=0">交通事故共${l.jt}例;</s:if>
         <s:if test="#l.fc!=0">房产纠纷共${l.fc}例;</s:if>
         <s:if test="#l.jz!=0">建筑工程共${l.jz}例;</s:if>
         <s:if test="#l.lh!=0">离婚纠纷共${l.lh}例;</s:if>
         
         </td>
      </tr>
		</table>
		</s:iterator>
		<!-- <table class="table" onclick="single_layer('');">
			<tr>
				<td rowspan="3"><img src="layer/l1.png" class="mylogo" /></td>
				<td>王明安</td>
			</tr>
			<tr>
				<td>安徽省铜陵市|铜陵三民律师事务所</td>
			</tr>
			<tr>
				<td>暂无案例</td>
			</tr>
		</table>
		<table class="table">
			<tr>
				<td rowspan="3"><img src="layer/ly2.jpg" class="mylogo" /></td>
				<td>孙桃</td>
			</tr>
			<tr>
				<td>黑龙江省哈尔滨市 |黑龙江子涵律师事务所</td>
			</tr>
			<tr>
				<td>暂无案例</td>
			</tr>
		</table> -->
	</div>
	<!-- 律师推送 -->
</body>
<script type="text/javascript">
			// 百度地图API功能
	var map = new BMap.Map("allmap");
/* 	var point = new BMap.Point(116.331398,39.897445);
	map.centerAndZoom(point,12); */
	var geolocation = new BMap.Geolocation();
	geolocation.getCurrentPosition(function(r){
		if(this.getStatus() == BMAP_STATUS_SUCCESS){
			var mk = new BMap.Marker(r.point);
			map.addOverlay(mk);
			map.panTo(r.point);
			//根据经纬度获取城市的名称
			 // 使用百度地图JS API
	var point = new BMap.Point(r.point.lng,r.point.lat);
	var geoc = new BMap.Geocoder();
	geoc.getLocation(point, function(rs){
		var addComp = rs.addressComponents;
		var cy=addComp.city;
		cy=cy.substring(0,2);
		//显示在框里面
		$("#allmap").html(cy);
	});
		}
		else {
			alert('failed'+this.getStatus());
		}        
	},{enableHighAccuracy: true})
		//获取位置
		</script>
</html>
