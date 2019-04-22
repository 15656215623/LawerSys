<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML>
<html>
<head>
<base href="<%=basePath%>">
<title>某个律师的主页面</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<link rel="stylesheet" href="css/search.css" />
<style>
#ckind{
width: 100%;
height: 100%;
background-color: #f54545;
color: white;
margin-top:1%;
padding-top:2%;
padding-bottom:3%;
text-align:center;
/* 去掉三角 */
appearance:none;
-moz-appearance:none; /* Firefox */
-webkit-appearance:none; /* Safari 和 Chrome */
/* 去掉边框 */
  	border: 0;
	display: block;
	position: relative;
}
</style>
<body>
<jsp:include page="uhead.jsp"></jsp:include>
<!-- 第二部分 -->
	<div style="width:100%;height:330px;">
		<img src="image/lay.jpg" style="width:100%;height:100%;" />
	</div>
	<!-- 第二部分 -->
	<!-- 显示模块 -->
	<div class="container-fluid">
	<div class="row" >
	<div class="col-md-8" >
	<s:iterator value="#request.layer" var="layer">
	<table class="table tab_top" >
      <tr>
          <td rowspan="3" style="text-align: center;"><img src="${layer.logo}" style="width:100px;height:100px;border-radius:50%;"/></td>
         <td class="warning">${layer.lanme}律师</td>
      </tr>
      <tr>
         <td class="success">${layer.laddress}|${layer.officename}</td>
      </tr>
      <tr>
         <td class="warning">执业证号：${layer.liseid}</td>
      </tr>
      <tr>
        <td class="danger">律师简介</td> <td class="success">${layer.instroduce}</td>
      </tr>
      <tr>
        <td>
              <select id="ckind">
                <option>请选择纠纷类型</option>
               <option>合同纠纷</option>
                <option>借贷纠纷</option>
                 <option>劳动纠纷</option>
                  <option>刑事辩护</option>
                   <option>交通事故</option>
                    <option>合同纠纷</option>
                     <option>建筑工程</option>
                      <option>离婚纠纷</option>
               </select>
        <button type="button" class="btn btn-success" onclick="begin_chart('${layer.lanme }','${layer.logo}')" >开始咨询</button></td>
      </tr>
</table>
</s:iterator>
	</div>
	<div class="col-md-4" >
	<br><br>
	<div class="panel panel-primary">
	<div class="panel-heading">
		<h3 class="panel-title">办理的案例</h3>
	</div>
	<div class="panel-body">
		<s:iterator value="#request.demo" var="l">
     <s:if test="#l.ht!=0">合同纠纷共${l.ht}例;</s:if>
         <s:if test="#l.jd!=0">借贷纠纷共${l.jd}例;</s:if>
         <s:if test="#l.ld!=0">劳动纠纷共${l.ld}例;</s:if>
         <s:if test="#l.xs!=0">刑事辩护共${l.xs}例;</s:if>
         <s:if test="#l.jt!=0">交通事故共${l.jt}例;</s:if>
         <s:if test="#l.fc!=0">房产纠纷共${l.fc}例;</s:if>
         <s:if test="#l.jz!=0">建筑工程共${l.jz}例;</s:if>
         <s:if test="#l.lh!=0">离婚纠纷共${l.lh}例;</s:if>
      </s:iterator>
	</div>
</div>
		</div>
	</div>
	<!-- 显示模块 -->
</body>
<script type="text/javascript">
function begin_chart(lawername,lawerlogo){
var kk=$("#ckind").val();
var self = localStorage.getItem("username");
alert(kk);
if(kk=="请选择纠纷类型"){
alert("请选择要咨询的纠纷类型，方便律师解答");
}else{
if(self==null||self==""){
alert("您还没登录，不能享受咨询的权利");
}else{
//到后台查询数据历史数据10条显示在页面上
//生成一个随机的id
var oid=randomNum(4);
var logo = localStorage.getItem("userlogo");
window.location.href="http://localhost:8080/LawerSys/queryhistory.action?self="+self+"&&other="+lawername+"&&lawerlogo="+lawerlogo+"&&selflogo="+logo+"&&kinds="+kk+"&&oid="+oid;
}
}
}
//生成一个指定位数的随机数
function randomNum(n){ 
        var t=''; 
        for(var i=0;i<n;i++){ 
          t+=Math.floor(Math.random()*10); 
       } 
       return t;
 }
</script>
</html>

			
			
