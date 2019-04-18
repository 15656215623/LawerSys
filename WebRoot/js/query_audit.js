function getpass(id){
		 $.ajax({
				method : 'post',
				url : "http://localhost:8080/LawerSys/audit_pass.action",
				dataType : "text",
				data : {
					lid:id,
				},
				success : function() {
					$("#"+id).css({'background-color' : 'gray'});
					 $("#"+id).attr("disabled", true); 	
				},
			})
}
