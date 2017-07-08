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
td.usertd{
 	vertical-align: middle;
    height: 60px;
}
#td1{
    vertical-align: middle;
    height: 60px;
}
#td2{
    vertical-align: middle;
    height: 60px;
}
#td3{
    vertical-align: middle;
    height: 60px;
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
				
					<div class="col-md-12 column">
						<div class="row clearfix "
							style="height: auto;background-color: white;padding-top:30px;
							border-top-left-radius: 5px;border-top-right-radius: 5px;border-bottom-left-radius: 
							5px;border-bottom-right-radius: 5px;">
							<div class="col-md-12 column" style="padding-bottom: 15px">
								<div class="list-group">
									
								</div>
								<div>
									<h4><b>用户信息</b></h4>	
									<div class="container">
									<div class="row clearfix">
										<div class="col-md-11 column">
											<table class="table table-striped">
												<thead>
													<tr>
														<th>用户图片</th>
														<th>用户姓名</th>
														<th>收货地址</th>
														<th>联系电话</th>
														<th>状态</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td class="usertd"><img alt="140x140" height="100" width="100"
																		src="${pageContext.request.contextPath}/jpg/<s:property value="#session.User.getPicUrl()" />"> </td>
														<td class="usertd"><s:property value="#session.User.getUsername()"/></td>
														<td class="usertd"><s:property value="#session.User.getAdd1()"/></td>
														<td class="usertd"><s:property value="#session.User.getPhone()"/></td>
								                    <tr>
												</tbody>
											</table>
										</div>
									</div>
								</div>
								<HR SIZE=2 style="border:1 solid #B0E2FF">
								</div>
								<div>
									<h4><b>订单信息</b></h4>
								</div>
							</div>
							<div class="container">
								<div class="row clearfix">
									<div class="col-md-11 column">
										<table class="table table-striped">
											<thead>
												<tr>
													<th>商品图片</th>
													<th>订单号</th>
													<th>商品名</th>
													<th>状态</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td>
														<img alt="140x140" height="100" width="100"
																		src="${pageContext.request.contextPath}/jpg/<s:property value="#session.ComPic" />">
													</td>
													<td id="td1"><s:property value="#session.OrderID"/></td>
													<td id="td2"><s:property value="#session.ComName"/></td>
													<td id="td3">Default</td>
												</tr>
											</tbody>
										</table>
									</div>
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
