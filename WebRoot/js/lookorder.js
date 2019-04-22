function queryorder(lawer){
//获取用户名和律师名，给后台传递过去
	var user=localStorage.getItem("username");
	window.location.href="http://localhost:8080/LawerSys/operate_all.action?self="+user+"&&other="+lawer;
}
//删除记录
function deleteorder(lawer){
	var user=localStorage.getItem("username");
	//用ajax
	//开始ajax
	　$.ajax({
	    type : "post",
		url : "http://localhost:8080/LawerSys/operate_delete.action",
		dataType :"text",
		data : {
			self : user,
			other : lawer
		},
		success : function() {
			window.location.href="http://localhost:8080/LawerSys/hist_order.action?user="+user;
		},
	})
	//开始ajax
}