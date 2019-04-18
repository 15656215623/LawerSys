<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    <title>websocket通讯</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"  href="css/bootstrap.min.css"/>
<link rel="stylesheet" href="css/admin.css"/>
<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
  </head>
  <body>
<!-- 消息框 -->
<table class="table">
	<caption>咨询页面</caption>
	 <tr>
         <td>
		  <textarea class="form-control" rows="5" id="content"></textarea>
		 </td>
      </tr>
       <tr>
         <td>
		    <input type="text" class="form-control" placeholder="昵称" id="user">
		 </td>
      </tr>
      <tr>
         <td>
        <input type="text" class="form-control" placeholder="消息输入" id="mess">
		  </td>
		  <td>
	   <button type="button" class="btn btn-success" id="sendmes">发送</button>
		  </td>
      </tr>
     
</table>
<!--消息框  -->
  </body>
  <script type="text/javascript">
  /* 连接服务器 */
  if("WebSocket" in window){
  var socket = new WebSocket("ws://${pageContext.request.getServerName()}:${pageContext.request.getServerPort()}${pageContext.request.contextPath}/serverSocket");
  //当与服务器建立连接的时候，就会触发这个方法
   	socket.onopen=function (){
   	//1.只有点击按钮以后，才可以发送消息
   	document.getElementById("sendmes").onclick = function(){
   	var mess=$("#mess").val();
   		if(mess!=null&&mess!=""){
   	     socket.send("消息内容："+mess);
   	        }else{
   	                alert("发送的消息或用户名不能为空");
                  	}
      }
      //1.只有点击按钮以后，才可以发送消息
   	}
   	//接收服务器发送的数据
   	socket.onmessage=function(evt){
   	     var s=evt.data;
   	     //把数据显示在文本框里面
   	     var cs=$("#content").val();
   	     $("#content").val(cs+s);
   	}
   	socket.onerror=function(){
   	alert("程序发生错误");
   	}
   	socket.onclose=function(){
   	socket.close();
   	alert("程序正在关闭");
   	}
  }else{
  alert("您的浏览器不支持websocket通讯");
  }
  
  </script>
</html>
