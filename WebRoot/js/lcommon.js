function  mydata(flag){
	//获取存储的用户名
	var user=localStorage.getItem("username");
	if(flag==1){
		window.location.href='/LawerSys/lay_data.action?lanme='+user;	
	}else if(flag==2){
		window.location.href='/LawerSys/lay_udata.action?lanme='+user;	
	}

}


//提交修改的资料
function updatadata(){
	var user=localStorage.getItem("username");
	var address=$("#address").val();
	var oname=$("#oname").val();
	var time=$("#time").val();
	var instroduce=$("#instroduce").val();
	//ajax
	$.ajax({
		method : 'post',
		url : "http://localhost:8080/LawerSys/audit_l.action",
		dataType : "text",
		data : {
			lanme : user,
			laddress : address,
			officename:oname,
			ltime:time,
			instroduce:instroduce
		},
		success : function(ret) {
			//提示注册成功
			if(ret=="success"){
				//关闭模态框
				alert("密码修改成功");
			}else{
				alert("用户名或者密码输入错误，请重新输入");
				$("#password").val('');
			}
			
			 
		},
	})	
	//ajax
}
//提交修改的资料
function save(){
	//保存律师资料,
	var user=localStorage.getItem("username");
	var address=$("#address").val();
	var oname=$("#oname").val();
	var time=$("#time").val();
	var pass=$("#pass").val();
	var instroduce=$("#instroduce").val();
	//ajax
	$.ajax({
		method : 'post',
		url : "http://localhost:8080/LawerSys/layer_update.action",
		dataType : "text",
		data : {
			lanme : user,
			laddress : address,
			password:pass,
			officename:oname,
			ltime:time,
			instroduce:instroduce
		},
		success : function() {
			//提示注册成功
          window.location.href='/LawerSys/layer.jsp';
		},
	})	
	//ajax
}

//上传头像
function setlogo(){
	//ajax
	$.ajax({
		method : 'post',
		url : "http://localhost:8080/LawerSys/layer_logo.action",
		dataType : "text",
		data:new FormData($('#uploadForm')[0]),
        cache: false,
        processData: false,
        contentType: false,
        success:function(res){
        	localStorage.setItem("userlogo",res);
    		//跳转页面
    		window.location.href='/LawerSys/layer.jsp';	
        }
	})
	
	//ajax
}
//上传头像
//上传多个案例
function up_moredemo(){
	//获取案例的类型，如果案例类型是null的话，就不提交
	var kk=$("#kk").val();
	if(kk==""||kk==null){
		alert("请选择上传案例的类型");
	}else{
		alert("正在上传");
		//ajax
		$.ajax({
			method : 'post',
			url : "http://localhost:8080/LawerSys/layer_demo.action",
			dataType : "text",
			data:new FormData($('#updemo')[0]),
	        cache: false,
	        processData: false,
	        contentType: false,
	        success:function(res){
	    		//跳转页面
	    		window.location.href='/LawerSys/demo.jsp';	
	        }
		})
		
		//ajax	
	}
	
}
//上传多个案例