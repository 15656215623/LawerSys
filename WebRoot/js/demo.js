function downfile(id){
	$.ajax({
		method : 'post',
		url : "http://localhost:8080/LawerSys/ddemo.action",
		dataType : "text",
		data : {
			did : id,
		},
		success : function(res) {
			//提示注册成功
         alert("文件下载成功，请到d盘down文件夹里面查看");
		},
	})	
	//ajax
}
//审核通过
function getpass(id,lanme,demo,kinds){
	 $.ajax({
			method : 'post',
			url : "http://localhost:8080/LawerSys/pass_demo.action",
			dataType : "text",
			data : {
				did:id,
				lanme:lanme,
				demo:demo,
				kinds:kinds
			},
			success : function() {
				$("#"+id).css({'background-color' : 'gray'});
				 $("#"+id).attr("disabled", true); 	
			},
		})
}
