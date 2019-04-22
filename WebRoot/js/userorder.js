function queryorder(lawer){
//获取用户名和律师名，给后台传递过去
	var user=localStorage.getItem("username");
	window.location.href="http://localhost:8080/LawerSys/operate_user.action?self="+lawer+"&&other="+user;
}
