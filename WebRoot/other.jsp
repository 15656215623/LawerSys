<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    <title>聊天室</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet"  href="css/bootstrap.min.css"/>
<link rel="stylesheet" href="css/admin.css"/>
<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/chat.css"/>
  </head>
  <body>
<!-- 消息框 -->
<table class="table">
	<caption>咨询页面</caption>
	 <tr>
         <td>
		 <div id="chat">
		 <ul id="message-list"></ul>
		 </div>
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
	   <button type="button" class="btn btn-success" id="closechat">结束咨询</button>
		  </td>
      </tr>
     
</table>
<!--消息框  -->
  </body>
  <script type="text/javascript">
  /* 连接服务器 */
   function rand(num){
		    	return parseInt(Math.random()*1000000+1);
		    }
  if("WebSocket" in window){
  var target = "ws://"+window.location.host+"/LawerSys/javasocket"+"/"+rand();
  var socket = new WebSocket(target);
  //当与服务器建立连接的时候，就会触发这个方法
   	//1.只有点击按钮以后，才可以发送消息
   	document.getElementById("sendmes").onclick = function(){
   	var mess=$("#mess").val();
   	var user=$("#user").val();
   		if(mess!=null&&mess!=""){
   	     socket.send(JSON.stringify({
						content : mess,
						nickname : user
					}));
   	        }else{
   	                alert("发送的消息或用户名不能为空");
                  	}
      }
      //1.只有点击按钮以后，才可以发送消息
   	//接收服务器发送的数据
   	socket.onmessage=function(evt){
   	  var s=evt.data;
   	  var message = JSON.parse(s);
   	     //存储到数据库里面
          //ajax
	  $.ajax({
			method : 'post',
			url : "http://localhost:8080/LawerSys/inchart.action",
			data : {
				self :"小田",
				other:"小美",
				content:s
			},
			success : function() {},
		});
	 //ajax
   	     
   	     //直接显示
var messageItem = '<li class="'
						+ (message.isSelf ? 'youright' : 'youleft')
						+ '">'
						+ '<span>'+message.nickname+' </span><span>'+message.date+'</span><br>'
						+'<span>'+message.content+'</span><img src="icon/'
						+ (message.isSelf ? 'dw.png' : 'dz.png')
						+ '"  width="48" height="48"/></a>'
				        +'</li>';
				$(messageItem).appendTo('#message-list');
				// 把滚动条滚动到底部
				$(".chat-content-container").scrollTop($(".chat-content-container")[0].scrollHeight);
   	     
   	     //直接显示
   	}
   		socket.onerror=function(){alert("程序发生错误");}
   	$("#closechat").click(function(){
   	socket.close();
   	});
   
  }else{
  alert("您的浏览器不支持websocket通讯");
  }
  
  </script>
</html>
