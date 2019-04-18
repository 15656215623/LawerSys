function nearby(){
	var lo=$("#allmap").text();
	//给后台
	window.location.href="http://localhost:8080/LawerSys/searchlocation.action?laddress="+lo;
}