$(function(){
	$("#mycity").citySelect({prov:"海南",city:"海口"});
})
//多条件联合查询
function moresearch(){
	//获取城市，
	var ct=$("#ct").val();
	//获取类型
	var kk=$("#kk").val();
	//获取综合排序
	var orderby=$("#orderby").val();
	if(kk=="请选择纠纷类型"){
		kk=null;
	}
	if(orderby=="综合排序"){
		orderby=null;
	}
	window.location.href="http://localhost:8080/LawerSys/searchmore.action?laddress="+ct+"&&kinds="+kk+"&&orderby="+orderby;	
}
//根据律师名称或者事务所名称查询
function queryname(kind){
	var kk=$("#selected").val();
	var name=$("#condition").val();
	if(kk=="选择查询条件"||kk=="律师名字"){
		kk=1;
	}else{
		kk=2;
	}
	window.location.href="http://localhost:8080/LawerSys/searchbyname.action?lid="+kk+"&&lanme="+name;	
}