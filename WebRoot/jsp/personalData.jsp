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

<title>My JSP 'demo.jsp' starting page</title>

<meta name="keywords" content="keyword1,keyword2,keyword3">
<meta name="description" content="this is my page">
<meta name="content-type" content="text/html; charset=UTF-8">

<!-- 		插入外部样式表，使用DwrUtil -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/dwr/util.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/dwr/engine.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/dwr/interface/dwrUtil.js"></script>

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
<script type="text/javascript">

	function passwordCheck() {
		var loginUserName = document.getElementById("oldUsername");
		var loginPassWord = document.getElementById("oldPassword");
		//alert("开始调用dwr进行密码校验");
		dwrUtil.loginCheck(loginUserName.value, loginPassWord.value, callback);
		function callback(result) {
			if (result == "1") {
				alert("修改成功！");
				document.getElementById("privateInfoForm").submit();
			} else {
				alert("旧密码错误,请重新输入！");
			}
		}
	}
	function picChange() {
		var pic = document.getElementById("pic");
		var picUrl = document.getElementById("picUrl");
		var strs = new Array();
		strs = picUrl.value.split("\\");
		pic.src = "${pageContext.request.contextPath}/jpg/" + strs[strs.length - 1];
	}
</script>
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

</head>

<body>
	<div class="container">
		<div class="row clearfix">
			<div class="col-md-12 column">
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

		<div class="row clearfix">

			<div class="col-md-3 column ">


				<div class="border1">
					<img alt="140x140"
						src="${pageContext.request.contextPath}/jpg/<s:property value="#session.User.getPicUrl()" />"
						height="220" width="200" />
				</div>

				<div class="btn1-distane"></div>
			</div>
			<div class="col-md-1 column "></div>
			<div class="col-md-8 column enjoy-css"
				style="background-color:white;padding-bottom: 15px;padding-top: 15px;height: 450px;border-top-left-radius: 5px;border-top-right-radius: 5px;border-bottom-left-radius: 5px;border-bottom-right-radius: 5px;">

				<div class="col-md-12 column">
					<div class="tabbable" id="tabs-458838">
						<ul class="nav nav-tabs">
							<li class="active"><a href="#panel-637903" data-toggle="tab">基本资料</a></li>
							<li><a href="#panel-896076" data-toggle="tab">安全信息</a></li>
							<li><a href="#panel-896075" data-toggle="tab">头像照片</a></li>
						</ul>
						<div class="tab-content" style="padding-top: 10px">
							<div class="tab-pane active" id="panel-637903">
								<form
									action="${pageContext.request.contextPath}/changeInfoAction.do"
									method="post" id="infoForm">
									<dl>
										<dt class="text-info" style="padding-bottom: 15px">
											姓名:&nbsp&nbsp&nbsp<input type="text" name="userName"
												id="oldUsername"
												value="<s:property value="#session.User.getUsername()" />" />

										</dt>

										<dt class="text-info" style="padding-bottom: 15px">
											邮箱:&nbsp&nbsp&nbsp<input type="text" name="email"
												value="<s:property value="#session.User.getAdd1()" />" />

										</dt>
										<dt class="text-info" style="padding-bottom: 15px">
											联系方式:&nbsp&nbsp&nbsp<input type="text" name="phone"
												value="<s:property value="#session.User.getPhone()" />" />

										</dt>
										<dt class="text-info" style="padding-bottom: 15px">
											账户余额:&nbsp&nbsp&nbsp
											<s:property value="#session.User.getBalance()" />
											元
										</dt>
									</dl>
									<div class="col-md-12 column " style="">
										<div class="col-xs-4 col-md-offset-4">
											<a onclick="document.getElementById('infoForm').submit();"
												role="button" class="btn btn-info btn-xs">保存</a>
										</div>
									</div>
								</form>

							</div>
							<div class="tab-pane " id="panel-896076">
								<form
									action="${pageContext.request.contextPath}/changePasswordAction.do"
									id="privateInfoForm" method="post">
									<dl>
										<dt class="text-info" style="padding-bottom: 15px">
											旧密码:&nbsp&nbsp&nbsp <input type="text" name="oldPassword"
												id="oldPassword" />
										</dt>
										<dt class="text-info" style="padding-bottom: 15px">
											新密码:&nbsp&nbsp&nbsp <input type="text" name="newPassword" />
										</dt>
									</dl>
									<div class="col-md-12 column " style="">
										<div class="col-xs-4 col-md-offset-4">
											<a onclick="passwordCheck()" role="button"
												class="btn btn-info btn-xs">保存</a>
										</div>
									</div>
								</form>
							</div>
							<div class="tab-pane " id="panel-896075">
								<form
									action="${pageContext.request.contextPath}/changePicAction.do"
									id="picUrlForm" method="post">
									<p>选择新头像</p>
									<div class="col-md-12 column" style="padding-bottom: 10px">
										<div class="col-md-4 column">
											<label for="pic" class="text-info">上传照片</label> <img id="pic"
												alt="140x140" src="" height="220" width="200" />
										</div>
										<div class="col-md-8 column">
											<div class="col-sm-9">
												<input type="file" class="form-control" id="picUrl"
													name="picUrl" onchange="picChange()" />
											</div>
										</div>
									</div>
									<div class="col-md-12 column " style="">
										<div class="col-xs-6 col-md-offset-4">
											<a onclick="document.getElementById('picUrlForm').submit()" role="button"
												class="btn btn-info btn-xs">保存</a>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>


			</div>

		</div>
		<div class="row clearfix">
			<div class="col-md-12 column"></div>
		</div>
	</div>
</body>
</html>
