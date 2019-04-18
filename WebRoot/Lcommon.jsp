<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE>
<html>
<head>
<base href="<%=basePath%>">
<title>律师公共部分</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/admin.css" />
<script src="js/Admin.js"></script>
<script src="js/lcommon.js"></script>
</head>
<body>
<jsp:include page="head.jsp"></jsp:include>	
	<!-- 手风琴菜单 -->
	<!--  手风琴菜单-->
	<div class="panel-group" id="accordion">
		<!-- 第一个部分 -->
		<div class="panel panel-default">
			<div class="panel-heading">
				<h4 class="panel-title">
					<a data-toggle="collapse" data-parent="#accordion"
						href="#collapseOne" class="collapsed"> 个人中心 </a>
				</h4>
			</div>
			<div id="collapseOne" class="panel-collapse collapse in">
				<div class="part_panel panel-body">
					<p>
						<a onclick="mydata(1)">我的资料</a>
					</p>
					<p>
						<a onclick="mydata(2)">修改资料</a>
					</p>
					<p>
						<a data-toggle="modal" data-target="#logo"> 上传头像 </a>
					</p>
				</div>
			</div>
		</div>
		<!-- 第二个部分 -->
		<div class="panel panel-default">
			<div class="panel-heading">
				<h4 class="panel-title">
					<a data-toggle="collapse" data-parent="#accordion"
						href="#collapseTwo"> 案例 </a>
				</h4>
			</div>
			<div id="collapseTwo" class="panel-collapse collapse in">
				<div class="part_panel panel-body">
					<p onclick="demokinds()">
					我的案例
					</p>
					<p data-toggle="modal" data-target="#mydemo">上传案例</p>
				</div>
			</div>
		</div>
		<!-- 第三个部分 -->
		<div class="panel panel-default">
			<div class="panel-heading">
				<h4 class="panel-title">
					<a data-toggle="collapse" data-parent="#accordion"
						href="#collapseThree"> 收到投诉 </a>
				</h4>
			</div>
			<div id="collapseThree" class="panel-collapse collapse in">
				<div class="part_panel panel-body">
					<p>
						<a href="">用户投诉</a>
					</p>
					<p>
						<a href="">用户评价</a>
					</p>
				</div>
			</div>
		</div>
	</div>

	<!-- 模态框 -->
	<!-- 模态框（Modal）上传头像的模态框 -->
	<div class="modal fade" id="logo" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">上传头像</h4>
				</div>
				<div class="modal-body">
					<form id="uploadForm" enctype="multipart/form-data">
						<input type="text" name="lanme" id="logoname" /> <input id="ufile"
							type="file" name="file" />
						<button type="button" class="btn btn-primary"
							onclick="$('#ufile').click();">上传图片</button>
						<button type="button" class="btn btn-success" onclick="setlogo()">设置为头像</button>
					</form>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭
					</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>
	<!-- 模态框 -->
	<!-- 上传多个案例 -->
	<div class="modal fade" id="mydemo" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">上传案例（支持一次上传多个案例）</h4>
				</div>
				<div class="modal-body">
					<form id="updemo" enctype="multipart/form-data">
						<input type="text" name="lanme" id="demoname" /> <input
							type="file" name="file" multiple="multiple" id="dfile" />
						<button type="button" class="btn btn-primary"
							onclick="$('#dfile').click();">上传多个案例</button>
						<br>
						<br>
						<!-- 案例类型 -->
						<select id="uli">
							<option>请选择案例类型</option>
							<option>合同纠纷</option>
							<option>借贷纠纷</option>
							<option>劳动纠纷</option>
							<option>刑事辩护</option>
							<option>交通事故</option>
							<option>房产纠纷</option>
							<option>建筑工程</option>
							<option>离婚纠纷</option>
						</select> <input type="text" name="kinds" id="kk" /><br>
						<br>
						<button type="button" class="btn btn-success"
							onclick="up_moredemo()">上传</button>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭
					</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>
	<!-- 上传多个案例 -->
</body>
</html>
