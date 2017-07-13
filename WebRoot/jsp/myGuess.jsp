<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'demo.jsp' starting page</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="商店详情">
<script type="text/javascript">
	$('.form_datetime').datetimepicker({
		//language:  'fr',
		weekStart : 1,
		todayBtn : 1,
		autoclose : 1,
		todayHighlight : 1,
		startView : 2,
		forceParse : 0,
		showMeridian : 1
	});
	function picChange() {
		var pic = document.getElementById("pic");
		var picUrl = document.getElementById("picUrl");
		var strs = new Array();
		strs = picUrl.value.split("\\");
		pic.src = "${pageContext.request.contextPath}/jpg/" + strs[strs.length - 1];
	}
</script>
<script
	src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="css/bootstrap-datetimepicker.min.css">
<script type="text/javascript" src="js/bootstrap-datetimepicker.js"
	charset="UTF-8"></script>
<script type="text/javascript" src="js/bootstrap-datetimepicker.fr.js"
	charset="UTF-8"></script>
<style>
body {
	background-image: url(${pageContext.request.contextPath}/jpg/2.jpg);
	background-color: #000000;
}

.enjoy-css {
	-webkit-box-sizing: content-box;
	-moz-box-sizing: content-box;
	box-sizing: content-box;
	border: 2px solid rgba(234, 218, 218, 1);
	font: normal 17px/1 Arial, Helvetica, sans-serif;
	color: #4a4d4f;
	-o-text-overflow: ellipsis;
	text-overflow: ellipsis;
	background: rgba(239, 239, 239, 1);
}

.border1 {
	-webkit-box-sizing: content-box;
	-moz-box-sizing: content-box;
	box-sizing: content-box;
	border: 2px solid rgba(188, 193, 196, 0.91);
	font: normal 16px/1 "Times New Roman", Times, serif;
	color: rgba(255, 255, 255, 1);
	text-align: center;
	-o-text-overflow: ellipsis;
	text-overflow: ellipsis;
}

.btn1-distance {
	margin-top: 10px;
}
</style>
<script type="text/javascript">
	$(".form_datetime").datetimepicker({
		format : 'yyyy-mm-dd hh:ii'
	});
</script>
</head>

<body>
	<div class="container">
		<div class="row clearfix">
			<div class="col-md-12 column">
				<div class="modal fade" id="modal-container-848666" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-hidden="true">×</button>
								<h4 class="modal-title" id="myModalLabel_2">填写物品信息</h4>
							</div>
							<div class="modal-body">
								<form class="form-horizontal"
									action="${pageContext.request.contextPath}/newCommodyAction.do"
									method="post">
									<div class="form-group">
										<div class="col-md-12 column" style="padding-bottom: 10px">
											<label for="dtp_input1"
												class="col-sm-3 control-label text-info">选择过期时间</label>
											<div class="col-sm-9">

												<div class="input-group date form_datetime"
													data-date="2017-01-01T05:25:07Z"
													data-date-format="yyyy-mm-dd hh:ii"
													data-link-field="dtp_input1">
													<input class="form-control" size="16" type="text"
														name="time" value="" readonly> <span
														class="input-group-addon"><span
														class="glyphicon glyphicon-remove"></span></span> <span
														class="input-group-addon"><span
														class="glyphicon glyphicon-th"></span></span>
												</div>
											</div>
										</div>
										<div class="col-md-12 column" style="padding-bottom: 10px">
											<label for="ItemID" class="col-sm-3 control-label text-info">物品名称</label>
											<div class="col-sm-9">
												<input type="text" class="form-control" id="name"
													name="name" style="width: 400px" />
											</div>
										</div>
										<div class="col-md-12 column" style="padding-bottom: 10px">
											<label for="ItemID" class="col-sm-3 control-label text-info">价格</label>
											<div class="col-sm-9">
												<input type="text" class="form-control" id="price"
													name="price" style="width: 400px" />
											</div>
										</div>
										<div class="col-md-12 column" style="padding-bottom: 10px">
											<label for="ItemID" class="col-sm-3 control-label text-info">类型</label>
											<div class="col-sm-9">
												<input type="text" class="form-control" id="type"
													name="type" style="width: 400px" />
											</div>
										</div>
										<div class="col-md-12 column" style="padding-bottom: 10px">
											<label for="ItemID" class="col-sm-3 control-label text-info">数量</label>
											<div class="col-sm-9">
												<input type="text" class="form-control" id="number"
													name="number" style="width: 400px" />
											</div>
										</div>
										<div class="col-md-12 column" style="padding-bottom: 10px">
											<label for="ItemID" class="col-sm-3 control-label text-info">描述</label>
											<div class="col-sm-9">
												<textarea name="description" rows="10" cols="10"
													placeholder="在此输入对物品的描述" style="width: 400px"></textarea>
											</div>
										</div>
										<div class="col-md-12 column" style="padding-bottom: 10px">
											<div class="col-md-4 column">
												<label for="pic" class="text-info">上传照片</label> <img
													id="pic" alt="140x140" src="" height="220" width="200" />
											</div>
											<div class="col-md-8 column">
												<div class="col-sm-9">
													<input type="file" class="form-control" id="picUrl"
														name="picUrl" onchange="picChange()" />
												</div>

											</div>
										</div>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-default"
											data-dismiss="modal">关闭</button>
										<button type="submit" class="btn btn-primary">保存</button>
									</div>

								</form>

							</div>

						</div>

					</div>

				</div>
				<nav class="navbar navbar-default" role="navigation">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target="#bs-example-navbar-collapse-1">
						<span class="sr-only">Toggle navigation</span><span
							class="icon-bar"></span><span class="icon-bar"></span><span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand"
						href="${pageContext.request.contextPath}/jsp/mainPage.jsp">首页</a>
				</div>

				<div class="collapse navbar-collapse"
					id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li><a href="<s:url action="detial"/>">畅销榜</a></li>
					</ul>
					<form class="navbar-form navbar-left" role="search" action="search"
						method="post">
						<div class="form-group">
							<input type="text" class="form-control" name="search" />
						</div>
						<button type="submit" class="btn btn-default">搜索</button>
					</form>
					<ul class="nav navbar-nav navbar-right">
						<s:if test="#session.User!=null">
							<li class="dropdown"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown"><s:property
										value="#session.User.getUsername()" /><strong class="caret"></strong>
							</a>
								<ul class="dropdown-menu">
									<li><a
										href="${pageContext.request.contextPath }/jsp/personalData.jsp">我的信息</a></li>
									<li class="divider"></li>
									<li><a
										href="${pageContext.request.contextPath}/jsp/myGuess.jsp">我的竞猜</a></li>
									<li class="divider"></li>
									<li><a href="#">我的订单</a></li>
								</ul></li>
							<li><a
								href="${pageContext.request.contextPath}/logoutAction.do">注销</a></li>
						</s:if>
						<s:else>
							<li><a
								href="${pageContext.request.contextPath}/jsp/login.jsp">登录</a></li>
						</s:else>
					</ul>
				</div>
				</nav>
				<div class="row clearfix">
					<div class="col-md-4 column">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h3 class="panel-title">我的竞猜</h3>
							</div>
							<div class="panel-body">
								<a href="${pageContext.request.contextPath}/jsp/myGuess.jsp">我发布的竞猜</a>
							</div>
							<div class="panel-body">
								<a href="${pageContext.request.contextPath}/findOrderAction.do">我已抢到的宝贝</a>
							</div>
						</div>
					</div>
					<div class="col-md-8 column">
						<div class="row clearfix "
							style="background-color: white;padding-top:30px;border-top-left-radius: 5px;border-top-right-radius: 5px;border-bottom-left-radius: 5px;border-bottom-right-radius: 5px;">
							<div class="col-md-2 column"></div>
							<div class="col-md-8 column " style="padding-bottom: 30px">
								<div class="col-md-12 column " style="padding-bottom: 15px">
									<h3 class="text-center text-info">
										商品数量：
										<s:property value="#session.Commodities.size()" />
									</h3>
								</div>
								<div class="col-md-12 column">
									<table class="table table-hover table-bordered table-striped">
										<thead>
											<tr>
												<th>产品</th>
												<th>价格</th>
												<th>数量</th>
												<th>是否成交</th>
												<th>详细信息</th>
											</tr>
										</thead>
										<tbody>
											<s:iterator value="#session.Commodities" id="item">
												<tr>
													<td><s:property value="#item.getCommName()" /></td>
													<td><s:property value="#item.getCommPrice()" /></td>
													<td><s:property value="#item.getCommNumber()" /></td>
													<td><s:if test="#item.getIsSold()==0">否</s:if> <s:else>是</s:else></td>
													<td><a id="modal-848667"
														href="#modal-container-848667" role="button"
														class="btn btn-info btn-xs" data-toggle="modal">查看</a></td>
												</tr>
											</s:iterator>
										</tbody>
									</table>
								</div>
							</div>
							<div class="col-md-2 column"></div>
							<div class="col-md-12 column" style="padding-bottom: 10px">
								<div class="col-xs-4 col-md-offset-4">
									<a id="modal-848666" href="#modal-container-848666"
										data-toggle="modal" role="button"
										class="btn btn-success btn-xs">发布新的竞猜</a>
								</div>
								<div>   </div>
								<div>
								
							</div>
							
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	
	
		$('.form_datetime').datetimepicker({
			//language:  'fr',
			weekStart : 1,
			todayBtn : 1,
			autoclose : 1,
			todayHighlight : 1,
			startView : 2,
			forceParse : 0,
			showMeridian : 1
		});
	</script>
</body>
</html>
