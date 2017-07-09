<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
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

<title>猜吧</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" href="/css/bootstrap.min.css">
<!-- 如果你想采用Bootstrap2的样式，那么引入该压缩css文件 -->
<link rel="stylesheet" href="/UI/css/bootstrap-theme.min.css">
<script type="text/javascript" src="./dwr/util.js"></script>
<script type="text/javascript" src="./dwr/engine.js"></script>
<script type="text/javascript" src="./dwr/interface/dwrUtil.js"></script>
<!-- 引入已经压缩的js文件 -->
<script src="/UI/js/bootstrap.min.js"></script>
<link
	href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script
	src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style type="text/css">
body {
	background-image: url(${pageContext.request.contextPath}/jpg/2.jpg);
	background-color: #000000;
}

;
.bg {
	background-color: white;
	height: 400px;
	border-top-left-radius: 5px;
	border-top-right-radius: 5px;
	border-bottom-left-radius: 5px;
	border-bottom-right-radius: 5px;
}
;
</style>
<script type="text/javascript">

	function StartLotery() {
		var price = document.getElementById("guessPrice");
		var cPrice = document.getElementById("commodityPrice");
		var userBalance = document.getElementById("userBalance");
		//alert("开始调用dwr进行登录校验");
		/* 下面一行实际上是没有意义的 */

		dwrUtil.guessPrice(price.value, cPrice.value, callback);

		if (Number(userBalance.value) < 1) {
			alert("余额不足！");
		} else {
			function callback(result) {
				if (result == true) {
					document.getElementById("priceForm").submit();
					alert("成功猜中商品！");
				} else {
					document.getElementById("priceForm").submit();
					alert("错误，再试试吧？");
				}
			}
		}


	}
</script>
</head>

<body>
	<div class="container">
		<div class="row clearfix">
			<div class="col-md-12 column">
				<div class="modal fade" id="modal-container-951502" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-hidden="true">×</button>
								<h4 class="modal-title" id="myModalLabel">输入竞猜金额</h4>
							</div>
							<div class="modal-body">
								<form class="form-horizontal" id="priceForm"
									action="${pageContext.request.contextPath}/buyAction.do?id=<s:property value="#session.item.getId().getIdcommodity()"/>"
									method="post">
									<div class="form-group">
										<div class="col-md-12 column" style="padding-bottom: 10px">
											<h4 class="col-sm-5 control-label text-info">
												余额：
												<s:property value="#session.User.getBalance()" />
												元
											</h4>
											<input id="userBalance" type="hidden" name=""
												userBalance""
											value='<s:property value="#session.User.getBalance()"/>'>

										</div>
										<div class="col-md-12 column" style="padding-bottom: 10px">
											<label for="guessPrice"
												class="col-sm-3 control-label text-info">竞猜金额</label>
											<div class="col-sm-9">
												<input type="text" class="form-control" id="guessPrice"
													name="guessPrice" style="width: 400px" />
											</div>
										</div>
									</div>
								</form>

							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">关闭</button>
								<button type="button" class="btn btn-primary"
									onclick="StartLotery()">保存</button>
							</div>
						</div>
					</div>
				</div>
				<nav class="navbar navbar-default" role="navigation">
				<div class="navbar-header">
					<ul class="nav navbar-nav">
						<li><a class="navbar-brand active"
							href="${pageContext.request.contextPath}/jsp/mainPage.jsp">首页</a></li>
					</ul>
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
					<ul class="nav navbar-nav navbar-right ">
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
										href="${pageContext.request.contextPath}/getShopsAction.do">我的竞猜</a></li>
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
			</div>
		</div>
		<div class="row clearfix"
			style="background-color: white;padding-top:30px;border-top-left-radius: 15px;border-top-right-radius: 15px;">
			<div class="col-md-6 column">
				<ul class="breadcrumb">
					<li class="active"><s:property value="#session.item.getType()" />
						<a href="<s:property value="#session.item.getType()"/>"></a></li>
					<li><s:property value="#session.item.getCommName()" /></li>
				</ul>
				<p style="text-align:center;">
					<img alt="140x140"
						src="${pageContext.request.contextPath}/jpg/<s:property value="#session.item.getCommPicUrl()"/>"
						style="width:370px;height:200px;" />
				</p>
			</div>
			<div class="col-md-6 column">
				<br />
				<h2>
					<s:property value="#session.item.getCommName()" />
				</h2>
				<input id="commodityPrice" type="hidden" name="commodityPrice"
					value='<s:property value="#session.item.getCommPrice()"/>'>
				<br />
				<h3>
					数量：
					<s:property value="#session.item.getCommNumber()" />
				</h3>
				<br />
				<h4>
					竞猜截止时间：
					<s:property value="#session.item.getExpireTime()" />
				</h4>
				<br />

				<h3>
					<div id="CountMsg" class="HotDate">
						剩余时间： <span id="t_d">00天</span> <span id="t_h">00时</span> <span
							id="t_m">00分</span> <span id="t_s">00秒</span>
					</div>
				</h3>

				<script type="text/javascript">
					function getRTime() {
						var EndTime = new Date("${session.item.expireTime}"); //截止时间 
						var NowTime = new Date();
						var t = EndTime.getTime() - NowTime.getTime();
						var d = Math.floor(t / 1000 / 60 / 60 / 24);
						var h = Math.floor(t / 1000 / 60 / 60 % 24);
						var m = Math.floor(t / 1000 / 60 % 60);
						var s = Math.floor(t / 1000 % 60);
						document.getElementById("t_d").innerHTML = d + "天";
						document.getElementById("t_h").innerHTML = h + "时";
						document.getElementById("t_m").innerHTML = m + "分";
						document.getElementById("t_s").innerHTML = s + "秒";
					}
					setInterval(getRTime, 1000);
				</script>

				<br /> <a id="modal-951502" href="#modal-container-951502"
					role="button" class="btn btn-default" data-toggle="modal">立即开抢</a>
			</div>
		</div>
		<div class="row clearfix" style="background-color: white; ">
			<div class="col-md-12 column">
				<div class="tabbable" id="tabs-33659">
					<ul class="nav nav-tabs">
						<li class="active"><a href="#panel-910560" data-toggle="tab">
								商品详情</a></li>
					</ul>
					<div class="tab-content">
						<div class="tab-pane active" id="panel-910560">
							<dl class="dl-horizontal">
								<br />
								<dd>
									<s:property value="#session.item.getCommDescription()" />
								</dd>
							</dl>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>

