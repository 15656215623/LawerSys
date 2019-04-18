function moreserarch(){
	//点击这个按钮的时候，获取三个条件的文字
	var sf=$("#prov").val();//省份
	var cs=$("#ct").val();//城市
	var kk=$("#akind").val();//纠纷类型
	var other=$("#others").val();//案例类型
	if(kk=="选择案例类型"){
		kk=null;
	}
	if(other=="综合排序"){
		other=null;	
	}else if(other=="执业年限"){
		other=1;	
	}else{
		other=2;	
	}
	//把这些经过处理的数据传递到后台
	window.location.href="http://localhost:8080/LawerSys/condition.action?laddress"+cs+"&&";
	alert(cs+cs+kk+other);
}