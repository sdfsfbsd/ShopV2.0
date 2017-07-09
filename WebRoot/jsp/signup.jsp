<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>BUKE网</title>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/dwr/util.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/dwr/engine.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/dwr/interface/dwrUtil.js"></script>
<meta name="keywords" content="keyword1,keyword2,keyword3">
<meta name="description" content="this is my page">
<meta name="content-type" content="text/html; charset=UTF-8">
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
<script
	src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>

<script type="text/javascript">

	function hasClass(element, csName) {
		element.className.match(RegExp('(\\s|^)' + csName + '(\\s|$)')); //使用正则检测是否有相同的样式
	}

	function usernameCheck() {
		var regex = /^[0-9A-Za-z_]{6,15}$/
		var loginUserName = document.getElementById("InputUsername");

		dwrUtil.usernameCheck(loginUserName.value, callback);
		function callback(result) {
			console.log(result);
			if (result == "extence") {
				document.getElementById('UserNameExMsg').style.display = "block";
				document.getElementById('UserNameMsg').style.display = "none";
			} else if (result == "unExtence") {
				document.getElementById('UserNameExMsg').style.display = "none";
			}
		}
		if (!regex.test(loginUserName.value)) {
			document.getElementById('UserNameMsg').style.display = "block";
		} else {
			document.getElementById('UserNameMsg').style.display = "none";
		}
	}
	function emailCheck() {
		var temp = document.getElementById("InputEmail");
		var emailMsg = document.getElementById("EmailMsg");
		var myreg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
		if (!myreg.test(temp.value)) {
			emailMsg.style.display = "block";
		} else {
			emailMsg.style.display = "none";
		}

	}
	function passwordCheck() {
		var temp = document.getElementById("p1");
		var passwordMsg = document.getElementById("PasswordMsg");
		if (temp.value.length < 8) {
			passwordMsg.style.display = "block";
		} else {
			passwordMsg.style.display = "none";
		}
	}
	function passwordCheck2() {
		var p1 = document.getElementById("p1");
		var p2 = document.getElementById("p2");
		var passwordMsg = document.getElementById("PasswordMsg2")
		if (p1.value == p2.value) {
			passwordMsg.style.display = "none";
		} else {
			passwordMsg.style.display = "block";
		}
	}
	function signupCheck() {
		var p1 = document.getElementById("p1");
		var p2 = document.getElementById("p2");
		if (p1.value == p2.value) {
			document.getElementById('signupForm').submit();
			alert("注册成功！");
		} else {
			alert("注册失败！");
		}
	}
</script>
<style type="text/css">
body {
	background-image: url(${pageContext.request.contextPath}/jpg/2.jpg);
	background-color: #000000;
}

;
.vertical-center {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
}
</style>
</head>
<!--<body style="background-image:;background-position:center; background-repeat:repeat-y">

  -->

<body>
	<div class="container">
		<div class="center-block" style="padding-top: 200px"  >
			<h2 style="text-align:center;color:white;font-size: 55px">猜吧</h2>
			<div class="center-block">
				<div class="row">
					<div class="center-block"
						style="width:400px;padding-left:10px; padding-right:10px;padding-top:20px;padding-bottom:10px; background-color:rgba(255, 255, 255, 0.8);border-top-left-radius: 15px;border-top-right-radius: 15px;border-bottom-left-radius: 15px;border-bottom-right-radius: 15px;">
						<form role="form" id="signupForm" method="post"
							class="form-horizontal"
							action="${pageContext.request.contextPath}/signupAction.do">

							<div class="form-group">
								<label for="InputUsername "
									class="col-sm-3 control-label text-info">用户名</label>
								<div class="col-sm-9">
									<input onblur="usernameCheck()" type="text"
										class="form-control " name="userName" id="InputUsername"
										placeholder="6~16位,不包含特殊字符" />
									<div class="form-group" id="UserNameMsg" style="display:none;">
										<label class="text" style="color: red"> 用户名格式有误！ </label>
									</div>
									<div class="form-group" id="UserNameExMsg"
										style="display:none;">
										<label class="text" style="color: red"> 用户名存在！ </label>
									</div>
								</div>
							</div>

							<div class="form-group" style="padding-top: 10px">
								<label for="InputEmail" class="col-sm-3 control-label text-info">邮箱</label>
								<div class="col-sm-9">
									<input onblur="emailCheck()" id="InputEmail" type="text"
										class="form-control" name="email" placeholder="邮箱信息" />
									<div class="form-group" id="EmailMsg" style="display:none;">
										<label class="text" style="color: red"> 邮箱格式有误！ </label>
									</div>
								</div>

							</div>
							<div class="form-group" style="padding-top: 10px">
								<label for="exampleInputPassword1"
									class="col-sm-3 control-label text-info">密码</label>
								<div class="col-sm-9">
									<input onblur="passwordCheck()" type="password"
										class="form-control" name="passWord" id="p1"
										placeholder="8~16位" />

									<div class="form-group" id="PasswordMsg" style="display:none;">
										<label class="text" style="color: red"> 密码太短！</label>
									</div>
								</div>
							</div>

							<div class="form-group" style="padding-top: 10px">
								<label for="exampleInputPassword1"
									class="col-sm-3 control-label text-info">确认密码</label>
								<div class="col-sm-9">
									<input type="password" class="form-control"
										name="passWordConfirmed" id="p2" onblur="passwordCheck2()"
										placeholder="与上面一致" />
									<div class="form-group" id="PasswordMsg2" style="display:none;">
										<label class="text" style="color: red"> 密码不一致！</label>
									</div>
								</div>
							</div>
							<div class="row clearfix">
								<div class="col-md-4 column "></div>
								<div class="col-md-4 column ">
									<a class="btn btn-info btn-block" href="javascript:"
										id="submitBtn" style="color: black;" 
										onclick="signupCheck()">注册</a>
								</div>
								<div class="col-md-4 column "></div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
