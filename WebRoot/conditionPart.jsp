<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
<title>全部的检索条件</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.min.css" />
<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/jquery.cityselect.js"></script>
<script src="js/condition.js"></script>
<link rel="stylesheet" href="css/search.css" />
</head>
<body>
	<div class="container-fluid h4"  id="shead">
        <ul> 
			 <li style="color:white">
			 多条件联合检索
			 </li> 
			 <li id="mycity">
					<select class="prov"></select> 
					<select class="city" disabled="disabled" id="ct"></select>		
			 </li>
               <li>
               <select id="kk">
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
			 <li>
			 <select id="orderby">
			 <option>综合排序</option>
			 <option>执业年限</option>
			 <option>案例数量</option>
			 </select>
			 </li>
			 <li>
			  <button type="button" class="btn btn-default" onclick="moresearch()">搜索</button>
			 </li>
        </ul> 
    </div> 
    </div> 
	</div>
	<!-- 第三部分 -->
	<div class="container">
<form class="form-horizontal" role="form">
   <div class="row" >
	    <div class="col-md-2" >
			<select id="selected">
				<option>选择查询条件</option>
				<option>律师名字</option>
				<option>事务所名称</option>
			</select>
	   </div>
      <div class="col-md-6" >
     	<input type="text" class="form-control" id="condition" 
				   placeholder="请输入律师名字/律师事务所名字">
      </div>
  <div class="col-md-4" >
     <button type="button" class="btn btn-default" onclick="queryname()">搜索</button>
      </div>
   </div>
	</form>
</div>
	<!-- 第三部分 -->
</body>
</html>

			
			
