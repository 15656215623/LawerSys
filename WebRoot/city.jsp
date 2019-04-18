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
<title>省市二级联动</title>
		<script src="js/jquery-3.3.1.min.js"></script>
		<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=O7gtWVLsIBlFrjfSqq6HVcWAIm3xAKfw"></script>
		
		<script type="text/javascript" src="js/jquery.cityselect.js"></script>
				<style type="text/css">
			.demo{width:80%; margin:20px auto}
			.demo p{line-height:24px}
		</style>
	</head>	
	<body>
	
		<h1 id="allmap"></h1>
		<div id="main">
			<div class="demo">
				<div id="city_1">
					<select class="prov"></select> 
					<select class="city" disabled="disabled"></select>
				</div>				
			</div>		
			</div>
		</div>
	</body>
	
</html>
<script type="text/javascript">
			// 百度地图API功能
	var map = new BMap.Map("allmap");
	var point = new BMap.Point(116.331398,39.897445);
	map.centerAndZoom(point,12);
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
		var pro=addComp.province;
		pro=pro.substring(0,2);
		var cy=addComp.city;
		cy=cy.substring(0,2);
		alert(pro+"-"+cy);
		//显示在框里面
		$("#city_1").citySelect({prov:pro,city:cy});
	});
		}
		else {
			alert('failed'+this.getStatus());
		}        
	},{enableHighAccuracy: true})
		//获取位置

		</script>