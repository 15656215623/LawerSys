//页面刚加载的时候，开始判断，如果有用户名，就显示在页面上，如果没有用户名的话，就显示登录名称
function load_data() {
	//初始化数据
	var theme = localStorage.getItem("username");
	//显示用户名
	$("#logoname").val(theme);
	$("#demoname").val(theme);
	//显示头像
	var logo = localStorage.getItem("userlogo");
	var mr = "logo/mr.png";
	if (logo == null || logo == "") {
		$("#mylogo").attr('src', mr);
	} else {
		$("#mylogo").attr('src', logo);
	}

	//显示头像
	if (theme == null || theme == "") {
		$("#cue").show();
		$("#uname").html('');
	} else {
		$("#cue").hide();
		$("#uname").html(theme);
	}
}
//页面刚加载的时候，开始判断，如果有用户名，就显示在页面上，如果没有用户名的话，就显示登录名称
//退出登录
function exitu() {
	localStorage.removeItem("username");
	localStorage.removeItem("userlogo");
	//刷新部分
	load_data();
}
//退出登录
function layr() {
	$("#lay_reg").show();
	$("#user_reg").hide();
	$("#layers").css("color", "#337ab7");
	$("#cuser").css("color", "black");
}
function commr() {
	$("#lay_reg").hide();
	$("#user_reg").show();
	$("#layers").css("color", "black");
	$("#cuser").css("color", "#337ab7");
}
function laylogin() {
	$("#lawerlo").show();
	$("#commlo").hide();
	$("#lsl").css("color", "#337ab7");
	$("#ptl").css("color", "black");
}
function userlogin() {
	$("#lawerlo").hide();
	$("#commlo").show();
	$("#ptl").css("color", "#337ab7");
	$("#lsl").css("color", "black");
}
//通过ajax实现注册成功，提示注册成功，赶紧去登录吧
function userregedit() {
	//获取用户名 密码 再次确认密码
	var user = $("#username").val();
	var pass = $("#password").val();
	var rpass = $("#rpassword").val();
	//如果用户名和密码不一致就提示，不然就执行后台注册功能
	if (rpass == pass) {
		$.ajax({
			method : 'post',
			url : "http://localhost:8080/LawerSys/user_r.action",
			dataType : "text",
			data : {
				username : user,
				password : pass
			},
			success : function(ret) {
				//提示注册成功
				alert(ret);
				//关闭模态框
				$("#close_re").click();

			},
		})
	} else {
		alert("两次密码输入不一致，请重新输入");
	}
}
//用户登录
function ulogin() {
	//获取用户名和密码,登录成功以后，把用户名存储在session里面，然后显示在首页里面
	var username = $("#uusername").val();
	var password = $("#password").val();
	$.ajax({
		method : 'post',
		url : "http://localhost:8080/LawerSys/user_l.action",
		dataType : "text",
		data : {
			username : username,
			password : password
		},
		success : function(ret) {
			//提示注册成功
			if (ret == "success") {
				//关闭模态框
				$("#close_lo").click();
				//把用户名密码存储在session里面，首页显示用户名称
				localStorage.setItem("username", username);
				load_data();
				//普通用户登录成功，跳转到个人中心页面，以用来区分一下和律师的不同
				window.location.href = "usercenter.jsp";
				//普通用户登录成功，跳转到个人中心页面，以用来区分一下和律师的不同

			} else {
				alert("用户名或者密码输入错误，请重新输入");
				$("#password").val('');
			}

		},
	})
}
//页面刚加载的时候，开始判断，如果有用户名，就显示在页面上，如果没有用户名的话，就显示登录名称
//列表选择
function getkinds() {
	$("#uli li").click(function() {
		var v = $(this).text();
		$("#tresult").val(v);
	})
}
//列表选择
//1-3个类型
var str = '';
function choose_kinds() {
	$("#allli li button").click(function() {
		//如果背景颜色是白色的就变成把红色或者深蓝色，如果背景颜色是深蓝色的就变成白色
		var rgb = $(this).css('background-color');
		if (rgb == "rgb(255, 255, 255)") {
			$(this).css({
				'background-color' : '#337ab7'
			});
		} else {
			$(this).css({
				'background-color' : 'white'
			});
		}
		//如果背景颜色是白色的就变成把红色或者深蓝色，如果背景颜色是深蓝色的就变成白色
		str = '';
		//循环遍历，背景颜色不是白色的，都添加进来
		var btn = $("#allli li button");//获取所有的li元素
		for (var i = 0; i < btn.length; i++) {
			var gb = btn[i].style.backgroundColor;
			if (gb == "rgb(51, 122, 183)") {
				str = str + btn[i].innerHTML + ";";

			}
		}
		//添加元素
		$("#youkinds").val(str);
	})
}
//1-3类型
//超级管理员登录
function slogin() {
	var sname = $("#susername").val();
	var spass = $("#spassword").val();
	$.ajax({
		method : 'post',
		url : "http://localhost:8080/LawerSys/super_l.action",
		dataType : "text",
		data : {
			username : sname,
			password : spass
		},
		success : function(ret) {
			//提示注册成功
			if (ret == "success") {
				//关闭模态框
				$("#close_sp").click();
				//把用户名密码存储在session里面，首页显示用户名称
				localStorage.setItem("username", "超级管理员");
				//页面开始跳转，跳转到后台
				window.location.href = "Admin.jsp";
			} else {
				alert("用户名或者密码输入错误，请重新输入");
				$("#password").val('');
			}

		},
	})

}
//超级管理员登录

//律师登录
function layerlogin() {
	var sname = $("#lanme").val();
	var spass = $("#lpass").val();
	$.ajax({
		method : 'post',
		url : "http://localhost:8080/LawerSys/audit_l.action",
		dataType : "text",
		data : {
			lanme : sname,
			password : spass
		},
		success : function(ret) {
			//提示注册成功
			if (ret == "success") {
				//关闭模态框
				$("#close_sp").click();
				//把用户名密码存储在session里面，首页显示用户名称
				localStorage.setItem("username", sname);
				//页面开始跳转，跳转到后台
				window.location.href = "layer.jsp";
			} else {
				alert("用户名或者密码输入错误，请重新输入");
				$("#password").val('');
			}

		},
	})
}
//律师登录
