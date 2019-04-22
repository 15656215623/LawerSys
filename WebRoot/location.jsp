<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
	<script src="js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=O7gtWVLsIBlFrjfSqq6HVcWAIm3xAKfw"></script>
	<title>浏览器定位</title>
</head>
<body>
<h1 id="pro"></h1>
	<h1 id="allmap"></h1>
</body>
</html>
<script type="text/javascript">
//提供省份
var pro='';
var city='';
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
		pro=addComp.province;
		pro=pro.substring(0,2);
		city=addComp.city;
		 $("#pro").html(pro);
		$("#allmap").html(city);
		alert(addComp.province+"-"+addComp.city);
	});
		}
		else {
			alert('failed'+this.getStatus());
		}        
	},{enableHighAccuracy: true})
</script>
