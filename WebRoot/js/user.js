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