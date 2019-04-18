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
<script src="js/skiller.js"></script>
<script src="js/condition.js"></script>
<script type="text/javascript" src="js/jquery.cityselect.js"></script>
<link rel="stylesheet" href="css/search.css" />
</head>
<body>
	<div class="container-fluid h4"  id="shead">   
	<ul id="city_1">
	<li><h4 style="color:white">多条件联合查询</h4></li>
	<li><select class="prov" id="prov"></select> </li>
	<li><select class="city" disabled="disabled" id="ct"></select></li>
	<li>
	<select id="akind">
            <option>选择案例类型</option>
            <option>合同纠纷</option>
            <option>借贷纠纷</option>
              <option> 劳动纠纷</option>
                <option>刑事辩护</option>
                  <option>房产纠纷</option>
                  <option>交通事故</option>
                  <option>建筑纠纷</option>
                  <option>离婚纠纷</option>
              </select>
	</li>
	<li>
	<select id="others">
            <option>综合排序</option>
            <option>执业年限</option>
            <option>案例数量</option>
            </select>
	</li>
	<li>
	<button type="button" class="btn btn-default" onclick="moreserarch()">搜索</button>
	</li>
	</ul>            
    </div> 
	<!-- 第三部分 -->
	<div class="container">
<form class="form-horizontal" role="form" method="post" action="/LawerSys/condition.action">
   <div class="row" >
	    <div class="col-md-2" >
			<select id="selected" onclick="gettext()">
				<option>选择查询条件</option>
				<option>律师名字</option>
				<option>事务所名称</option>
			</select>
	   </div>
      <div class="col-md-6" >
     	<input type="text" class="form-control" name="lanme" 
				   placeholder="请输入律师名字/律师事务所名字">
      </div>
  <div class="col-md-4" >
     <button type="submit" class="btn btn-default">搜索</button>
     <input type="text" id="condition" name="condition" style="display: none;" />
      </div>
   </div>
	</form>
</div>
	<!-- 第三部分 -->
</body>
</html>

			
			
