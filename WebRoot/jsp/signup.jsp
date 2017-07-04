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

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>
<style type="text/css">
body {
	background-image: url(2.jpg);
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
  
<body style="background-image: '‪2.jpg'">
	<div class="container">
		<div class="center-block">
			<h2 style="text-align:center;color:white;font-size: 55px">BUKE</h2>
			<div class="center-block">
				<div class="row">
					<div class="center-block"
						style="width:300px;padding-left:10px; padding-right:10px;padding-top:20px;padding-bottom:10px; background-color:rgba(255, 255, 255, 0.8);border-top-left-radius: 15px;border-top-right-radius: 15px;border-bottom-left-radius: 15px;border-bottom-right-radius: 15px;">
						<form role="form" id="signUpForm" method="post" action="signup">

							<div class="form-group">
								<label for="exampleInputEmail1 ">用户名</label><input type="email"
									class="form-control" name="userName" />
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">邮箱</label><input
									type="password" class="form-control" name="eMail" />
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">密码</label><input
									type="password" class="form-control" name="passWord" />
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">再次确认密码</label><input
									type="password" class="form-control" name="passWordConfirmed" />
							</div>
							<div class="row clearfix">
								<div class="col-md-4 column "></div>
								<div class="col-md-4 column ">
									<a class="btn btn-info btn-block" href="javascript:"
										style="color: black;"
										onclick="document.getElementById('signUpForm').submit();">注册</a>
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
