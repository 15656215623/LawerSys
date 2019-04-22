<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE>
<html>
  <head>
    <base href="<%=basePath%>">   
    <title>普通用户后台-评论和打星</title>  
    <meta name="viewport" content="width=device-width, initial-scale=1">
  </head>
  <link  rel="stylesheet" href="css/pl.css"/>
  <body>
<jsp:include page="ucommon.jsp"></jsp:include>
<!-- 打星 -->
<div class="rgt">
<div class="panel panel-primary">
    <div class="panel-heading">
        <h3 class="panel-title">评论和打星</h3>
    </div>
    <div class="panel-body">
        <table class="table">
      <tr>
         <td>服务态度</td>
         <td>
         <ul id="service">
         <li> <img src="icon/ustart.png" onclick="changestart()"/></li>
         <li> <img src="icon/ustart.png" onclick="changestart()"/></li>
         <li> <img src="icon/ustart.png" onclick="changestart()"/></li>
         <li> <img src="icon/ustart.png" onclick="changestart()"/></li>
         <li> <img src="icon/ustart.png" onclick="changestart()"/></li>
         </ul>
        </td>
      </tr>
      <tr>
         <td>回复速度</td>
         <td>
          <ul id="speed">
         <li> <img src="icon/ustart.png" onclick="times()"/></li>
         <li> <img src="icon/ustart.png" onclick="times()"/></li>
         <li> <img src="icon/ustart.png" onclick="times()"/></li>
         <li> <img src="icon/ustart.png" onclick="times()"/></li>
         <li> <img src="icon/ustart.png" onclick="times()"/></li>
         </ul>
         </td>
      </tr>
	 <tr>      
         <td>专业技能</td>
            <td>
          <ul id="ability">
         <li> <img src="icon/ustart.png" onclick="ability()"/></li>
         <li> <img src="icon/ustart.png" onclick="ability()"/></li>
         <li> <img src="icon/ustart.png" onclick="ability()"/></li>
         <li> <img src="icon/ustart.png" onclick="ability()"/></li>
         <li> <img src="icon/ustart.png" onclick="ability()"/></li>
         </ul>
         </td>
      </tr>
	 <tr>
         <td>此次咨询评价
         <span id="oid"><%=request.getParameter("oid") %></span>
           <%String lanme=request.getParameter("lanme");
            lanme = new String (lanme.getBytes("ISO-8859-1"),"UTF-8"); %>
         <span id="lanme"><%=lanme %></span>
         </td>
         <td><input type="text" class="form-control" id="name" placeholder="待评价..."></td>
      </tr>
       <tr>
         <td colspan="2">
         <button type="button" class="btn btn-primary" onclick="postpl()">提交</button>
         </td>
      </tr>
</table>
    </div>
</div>
</div>
<script type="text/javascript">
//三个常量，来知道被选中的星星
//获取服务勾选的星星和专业技能的星星和回复速度的星星
var s=0;var t=0;var a=0;
function changestart(){
//改变星星-服务态度
  $("#service li").click(function(){
    var j=$(this).index();
    s=j;
    //全部变成星星
    var ims=$("#service li img");//获取所有的li元素
   for (var i = 0; i<5; i++) {
   if(i<=j){
   $(ims[i]).attr("src","icon/start.png");
   }else{
   $(ims[i]).attr("src","icon/ustart.png");
   }
	
                               }
  });
 
  
}
function times(){
 //改变星星-回复速度
   $("#speed li").click(function(){
    var j=$(this).index();
    t=j;
    //全部变成星星
    var ims=$("#speed li img");//获取所有的li元素
   for (var i = 0; i<5; i++) {
   if(i<=j){
   $(ims[i]).attr("src","icon/start.png");
   }else{
   $(ims[i]).attr("src","icon/ustart.png");
   }
	
                               }
  });
}
function ability(){
//专业技能
   $("#ability li").click(function(){
    var j=$(this).index();
    a=j;
    //全部变成星星
    var ims=$("#ability li img");//获取所有的li元素
   for (var i = 0; i<5; i++) {
   if(i<=j){
   $(ims[i]).attr("src","icon/start.png");
   }else{
   $(ims[i]).attr("src","icon/ustart.png");
   }
	
                               }
  });
}
//发布评论
function postpl(){
var oid=$("#oid").html();
var content=$("#name").val();
var lanme=$("#lanme").html();
var all=s+t+a+3;
//开始ajax
alert(oid);
	$.ajax({
	    type : "post",
		url : "http://localhost:8080/LawerSys/setstart.action",
		dataType :"text",
		data : {
			oid : oid,
			content : content,
			start:all,
			lanme:lanme
		},
		success : function() {
			window.location.href="http://localhost:8080/LawerSys/pl_success.jsp";
		},
	})
	//开始ajax
}

</script>
  </body>
</html>
