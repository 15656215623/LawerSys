$(document).ready(function() {
	$("#kk").val('');
	//根据ul的id来获取下面所有的li元素 并且为每个li配置点击事件
	$("#uli option").click(function() {
		//获取选中的li里面的值
		var v = $(this).text();
		//把值放在span里面，显示
		if (v == "请选择案例类型") {
			$("#kk").val('');
			alert("请选择一个案例类型，以便管理员审核");
		} else {
			$("#kk").val(v);
		}

	})
})

//显示案例
function demokinds(){
	var user=localStorage.getItem("username");
	window.location.href="http://localhost:8080/LawerSys/mydemo.action?lanme="+user;
}