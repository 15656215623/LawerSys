<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    <title>咨询页面</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet"  href="css/bootstrap.min.css"/>
<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/chat.css"/>
  </head>
  <body>
 <jsp:include page="uhead.jsp"></jsp:include>
<!-- 消息框 -->
<div id="chatroom">
<div class="panel panel-primary">
	<div class="panel-heading">
		<h3 class="panel-title" ><span id="wlawer">${other}</span><span>律师</span></h3>
	</div>
	<div class="panel-body">
		 <div id="chat">
		 <ul id="message-list">
		 <s:iterator value="#request.list" var="l">
		 <s:if test="#l.self==#l.active">
		 	  <li>
		 <div class="row" >
		 <div class="col-md-7"></div>
		 <div class="col-md-5">${l.time}</div>
		 </div>
		  <div class="row" >
		  <div class="col-md-6"></div>
		 <div class="col-md-4">${l.content }</div>
		 <div class="col-md-2"><img src="logo/mr.png" class="userlogo"/></div>
		 </div>
		 </li>	
		 </s:if>
		 <s:else>
	  <li>
		 <div class="row" >
		 <div class="col-md-4">${l.time}</div>
		 </div>
		  <div class="row" >
		 <div class="col-md-2"><img src=${lawerlogo}  class="userlogo"/></div>
		 <div class="col-md-4">${l.content }</div>
		 </div>
		 </li>
		 </s:else>
		
		 </s:iterator>
		</div>
       <input type="text" class="form-control" placeholder="消息输入" id="mess"><br>
	   <button type="button" class="btn btn-primary" id="sendmes">发送</button>
	    <input type="text" id="lawerlogo" value='${lawerlogo}'   style="display: none;"/>
	    <!--获取oid ${oid}  -->
	    <span id="oid">${oid}</span>
	   <button type="button" class="btn btn-danger" id="closechat">结束咨询</button>	
	</div>
</div>
</div>
<!--消息框  -->
  </body>
  <script type="text/javascript">
  //获取当前的用户名
  var username=localStorage.getItem("username");
  var lawername=$("#wlawer").html();
  var lawerlogo=$("#lawerlogo").val();
  if("WebSocket" in window){
  var target = "ws://"+window.location.host+"/LawerSys/javasocket"+"/"+username;
  var socket = new WebSocket(target);
  //当与服务器建立连接的时候，就会触发这个方法
   	//1.只有点击按钮以后，才可以发送消息
   	document.getElementById("sendmes").onclick = function(){
   	var mess=$("#mess").val();
   		if(mess!=null&&mess!=""){
   	     socket.send(JSON.stringify({
						content : mess,
						nickname : username
					}));
					//清空输入框
			$("#mess").val('');	
   	        }else{
   	                alert("发送的消息不能为空");
                  	}
      }
      //1.只有点击按钮以后，才可以发送消息
   	//接收服务器发送的数据
   	socket.onmessage=function(evt){
   	  var s=evt.data;
   	  var message = JSON.parse(s);
   	  var uflag=0,lflag=0;
   	     //存储到数据库里面cusize，如果只有一个人在线肯定存储数据，在用户方，都要存储的
   	    //如果当前只有一个人,uflag=1;lflag=0   如果当前两个人，uflag=1;lflag=1;
   	    if(message.cusize==1){
          uflag=1;lflag=0;
   	    }else{
   	     uflag=1;lflag=1;
   	    }
   	    insertsql(message.content,uflag,lflag,message.nickname,message.date);
   	    var messageItem =""; 
      if(message.isSelf){
          //直接显示
messageItem = '<li>'
		           +' <div class="row" >'
		           +'<div class="col-md-7"></div>'
		        +'<div class="col-md-5">'
		        +message.date+'</div></div>'		 
		        +'<div class="row" >'
		        +'<div class="col-md-6"></div>'
		        +'<div class="col-md-4">'
		        +message.content+'</div><div class="col-md-2">'
		        +'<img src="logo/mr.png" class="userlogo"/></div></div></li>'   
      }else{
          //直接显示
messageItem ='<li><div class="row" ><div class="col-md-4">' 
		        +message.date+'</div></div>'	
		        +'<div class="row" ><div class="col-md-2">'	 
		        +'<img src="'+lawerlogo+'"  class="userlogo"/>'
		        +'</div><div class="col-md-4">'
		        +message.content+'</div></div></li>'       
      }
   	 
				$(messageItem).appendTo('#message-list');
				// 把滚动条滚动到底部
				//$(".chat-content-container").scrollTop($(".chat-content-container")[0].scrollHeight);
   	     
   	     //直接显示
   	}
   	socket.onerror=function(){socket.close();}
   	//点击关闭查询按钮的同时，跳转到评价页面
   	$("#closechat").click(function(){
   	socket.close();
   	//显示到评价页面
   	//获取oid
   	var oid=$("#oid").html();
   	window.location.href="http://localhost:8080/LawerSys/discuss.jsp?oid="+oid+"&&lanme="+lawername;
   	});
   
  }else{
  alert("您的浏览器不支持websocket通讯");
  }
  //插入数据库操作
  function insertsql(content,uflag,lflag,active,date){
   //ajax
	  $.ajax({
			method : 'post',
			url : "http://localhost:8080/LawerSys/inchart.action",
			data : {
				self :username,
				other:lawername,
				content:content,
				uflag:uflag,
				lflag:lflag,
				active:active,
				time:date
			},
			success : function() {},
		});
	 //ajax
  
  }
  
  </script>
</html>
