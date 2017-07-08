<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Shop</title>

<meta name="keywords" content="keyword1,keyword2,keyword3">
<meta name="description" content="this is my page">
<meta name="content-type" content="text/html; charset=UTF-8">
<!-- 		插入外部样式表，使用DwrUtil -->
<script type="text/javascript" src="./dwr/util.js"></script>
<script type="text/javascript" src="./dwr/engine.js"></script>
<script type="text/javascript" src="./dwr/interface/dwrUtil.js"></script>
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
<script type="text/javascript">

	function loginCheck() {
		var errerMeg = document.getElementById("ErrorMsg");
		errerMeg.style.display = "none";
		var username = document.getElementById("exampleInputUserName");
		var password = document.getElementById("exampleInputPassword");
		if (username.value == "") {
			document.getElementById('UserNameMsg').style.display = "block";
		} else {
			document.getElementById('UserNameMsg').style.display = "none";
		}
		if (password.value == "") {
			document.getElementById('PassWordMsg').style.display = "block";
		} else {
			document.getElementById('PassWordMsg').style.display = "none";
		}
	}

	function login() {
		var loginUserName = document.getElementById("exampleInputUserName");
		var loginPassWord = document.getElementById("exampleInputPassword");
		//alert("开始调用dwr进行登录校验");
		/* 下面一行实际上是没有意义的 */
		dwrUtil.loginCheck(loginUserName.value, loginPassWord.value, callback);
		function callback(result) {
			if (result == "1") {
				//alert("登入成功！");
				document.getElementById("loginForm").submit();
			} else {
				//alert("用户名或密码错误请重新输入！");
				var errerMeg = document.getElementById("ErrorMsg");
				errerMeg.style.display = "block";
			//$("#msg").html("用户名或密码错误，请重新输入！");
			}
		}
	}
</script>
<body>
	<div class="container">
		<div class="row clearfix "
			style=" position:absolute;  top:30%;   margin:-100px 0 0 -150px ;padding-right: 60px;padding-left: 30px">
			<div class="col-md-12 column ">
				<div class="row clearfix">
				<div class="col-md-4 column "></div>
					<div class="col-md-4 column" style="margin-bottom: 40px">
						<h2 style="color:white;font-size: 55px">猜吧</h2>
					</div>
					<div class="col-md-4 column "></div>
				</div>

				<div class="row clearfix">
					<div class="col-md-6 column ">
						<h1 style="color: white">关于我们</h1>
						<p style="font-size: 22px;color: white">猜吧是全球知名的综合性网上二手物品猜卖交易平台，由国内著名机构科文公司、
							美国MMO基金、美国IER集团、卢森堡BIR集团、天使创业投资基金共同投资成立。</p>
						<p>
							<a class="btn" href="#" style="color: white;">View details »</a>
						</p>
					</div>
					<div class="col-md-2 column "></div>
					<div class="col-md-3 column"
						style="background-color:rgba(255, 255, 255, 0.8);border-top-left-radius: 15px;border-top-right-radius: 15px;border-bottom-left-radius: 15px;border-bottom-right-radius: 15px;">
						<form id="loginForm" name="loginForm"
							action="${pageContext.request.contextPath}/loginAction.do"
							method="post">
							<div class="form-group">
								<a class="btn" href="" style="color: white"></a>
							</div>
							<div class="form-group">
								<label for="exampleInputUserName">用户名</label><input type="email"
									onBlur="loginCheck();" class="form-control"
									id="exampleInputUserName" name="userName" />
							</div>
							<div class="form-group" id="UserNameMsg" style="display:none;">
								<label class="text" style="color: red"> 用户名不能为空！ </label>
							</div>

							<div class="form-group">
								<label for="exampleInputPassword">密码</label>
								<input
									type="password" onBlur="loginCheck();" class="form-control"
									id="exampleInputPassword" name="passWord" />
							</div>

							<div class="form-group" id="PassWordMsg" style="display:none;">
								<label class="text" style="color: red"> 密码不能为空！ </label>
							</div>
							<div class="form-group" id="ErrorMsg" style="display:none;">
								<label class="text" style="color: red"> 用户名或密码错误！请重新输入！
								</label>
							</div>

							<div class="checkbox">
								<label><input type="checkbox" />记住密码</label>
							</div>
							<div class="row clearfix">
								<div class="col-md-6 column ">
									<a onclick="login()" class="btn btn-info btn-block"
										href="javascript:" style="color: black;">登录</a>
								</div>
								<!-- "document.getElementById('loginForm').submit();" -->
								<div class="col-md-6 column ">
									<a class="btn btn-info btn-block" href="jsp/signup.jsp"
										style="color: black;">注册</a>
								</div>
							</div>

							<div class="form-group">
								<a class="btn" href="" style="color: white"></a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
