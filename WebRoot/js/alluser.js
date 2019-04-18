
function  mydata(){
	//获取存储的用户名
	 var user=localStorage.getItem("username");
	 //ajax
	 $.ajax({
			method : 'post',
			url : "http://localhost:8080/LawerSys/lay_data.action",
			data : {
				lanme : user
			},
			success : function() {
					 window.location.href ="layerinfo.jsp"; 
			},
		})	
	 //ajax
	 
}