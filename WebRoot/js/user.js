//重置密码的功能
function resetpass(){
	var pass=$("#pass").val();
	var repass=$("#apass").val();
	//获取用户名
	 var user=localStorage.getItem("username");
	if(pass==repass){
		//开始ajax
		　$.ajax({
		    type : "post",
			url : "http://localhost:8080/LawerSys/user_repass.action",
			dataType :"text",
			data : {
				username : user,
				password : pass
			},
			success : function() {
				//关闭模态框
				alert("密码修改成功");
				 $("#close_lo").click(); 
				//关闭模态框
			},
		})
		//开始ajax
	}else{
		alert("两次密码输入不一致，请重新输入");
		$("#pass").val('');
		$("#repass").val('');
	}
}
//根据用户名查找律师订单
function findorder(){
	var user=localStorage.getItem("username");
	window.location.href="http://localhost:8080/LawerSys/hist_order.action?user="+user;
}
//根据用户名查找律师订单
//我的评价
function myaccess(){
	//根据用户名查询content不为null的数据显示在页面上
	var user=localStorage.getItem("username");
	window.location.href="http://localhost:8080/LawerSys/access_order.action?user="+user;
}
//我的投诉
function complaint(){
//查询投诉
	var user=localStorage.getItem("username");
	window.location.href="http://localhost:8080/LawerSys/mycom.action?user="+user;	
}
//我咨询的类型
function mykinds(){
	var user=localStorage.getItem("username");
	window.location.href="http://localhost:8080/LawerSys/ukinds.action?username="+user;	
	
}
