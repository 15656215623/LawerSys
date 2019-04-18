//每个都是获取里面的内容，然后提交给后台查询
function getkinds(kind){
	window.location.href="http://localhost:8080/LawerSys/searcher.action?kinds="+kind;
}
//把选择的文本放在输入框里面
function gettext(){
	$("#selected option").click(function(){
		var d=$(this).text();
		if(d=="选择查询条件"||d=="律师名字"){
			d=0;
		}else{
			d=1;//事务所名称
		}
		$("#condition").val(d);
	});
}
//初始化
$(function(){
	$("#city_1").citySelect({
		prov:"海南",
		nodata:"海口"
	});

})
