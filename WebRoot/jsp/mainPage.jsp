<%@page import="org.springframework.web.context.request.RequestScope"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
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

.dpdown1 {
  position: relative;
  display: inline-block;
}
.dpdown-content {
  display: none;
  position: absolute;
  background-color: #f9f9f9;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  padding: 12px 16px;
}
.dpdown1:hover .dpdown-content {
  display: block;
}

</style>





</head>
<body style="background-image: '‪2.jpg'">
	<div class="container">
		<div class="row clearfix">
			<div class="col-md-12 column">
				<nav class="navbar navbar-default" role="navigation">
					<div class="navbar-header">
						<ul class="nav navbar-nav">
							<li><a class="navbar-brand active" href="mainPage.jsp">首页</a></li>
						</ul>
					</div>
					<div class="collapse navbar-collapse"
						id="bs-example-navbar-collapse-1">
						<ul class="nav navbar-nav">

							<li><a href="<s:url action="detial"/>">畅销榜</a></li>
						</ul>
						<form class="navbar-form navbar-left" role="search" action="search" method="post">
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
										<li><a href="personalData.jsp">我的信息</a></li>
										<li class="divider"></li>
										<li><a href="myshop.jsp">我的店铺</a></li>
										<li class="divider"></li>
										<li><a href="<s:url action="shopcart"/>">购物车</a></li>
										<li class="divider"></li>
										<li><a href="myshop.jsp">我的订单</a></li>
									</ul>
								</li>
								
								<li><a href="<s:url action="logoutAction.do"/>">注销</a></li>
								
							</s:if>
							
							
							
							<s:else>
								<li><a href="login.jsp">登陆</a></li>
							</s:else>
						</ul>
					</div>
				</nav>
				<div class="row clearfix">
					<div class="col-md-4 column">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h3 class="panel-title">分类书榜</h3>
							</div>
							<div class="panel-body"
								style="border-bottom:1px solid ;border-bottom-color: #CCCCCC">
								<a href="#">经典著作 · 哲学类</a>
							</div>
							<div class="panel-body"
								style="border-bottom:1px solid ;border-bottom-color: #CCCCCC">
								<a href="#">军事科学 · 财经管理</a>
							</div>
							<div class="panel-body"
								style="border-bottom:1px solid ;border-bottom-color: #CCCCCC">
								<a href="#">历史地理 · 文化教育</a>
							</div>
							<div class="panel-body"
								style="border-bottom:1px solid ;border-bottom-color: #CCCCCC">
								<a href="#">摄影影视 · 舞蹈戏剧</a>
							</div>
							<div class="panel-body"
								style="border-bottom:1px solid ;border-bottom-color: #CCCCCC">
								<a href="#">农业科学 · 工业技术</a>
							</div>
							<div class="panel-body"
								style="border-bottom:1px solid ;border-bottom-color: #CCCCCC">
								<a href="#">数理化学 · 医药卫生</a>
							</div>
							<div class="panel-body"
								style="border-bottom:1px solid ;border-bottom-color: #CCCCCC">
								<a href="#">书法篆刻 · 自然科学</a>
							</div>
							<div class="panel-body"
								style="border-bottom:1px solid ;border-bottom-color: #CCCCCC">
								<a href="#"> 期刊 · 港版图书</a>
							</div>
							<div class="panel-body">
								<a href="#">生活休闲 · 少儿读物</a>
							</div>
						</div>
					</div>
					<div class="col-md-1 column"></div>
					<div class="col-md-6 column">
						<div class="carousel slide" id="carousel-727637">
							<ol class="carousel-indicators">
								<li class="active" data-slide-to="0"
									data-target="#carousel-727637"></li>
								<li data-slide-to="1" data-target="#carousel-727637"></li>
								<li data-slide-to="2" data-target="#carousel-940489"></li>
							</ol>
							<div class="carousel-inner">
								<div class="item active" align="center">
									<img alt="" src="Resource/Picture/1/1.jpg" />
									<div class="carousel-caption">
										<h4 style="color: white;">罗尼</h4>
										<p style="color: white;">英国国家图书奖作品，斯蒂芬.金盛赞推荐，被称为当代经典的传奇处女作</p>
										<form action="getIteminfo" ="post">
									<input type="hidden" name="itemId"
										value="1" /> 
										<input type="submit" class="btn btn-default"
										value="点击前往" />
										</form>
									</div>
								</div>
								<div class="item" align="center">
									<img alt="" src="Resource/Picture/2/1.jpg" />
									<div class="carousel-caption">
										<h4>人间失格</h4>
										<p>(公版书)“尽管人是这么的让人失望，但人还是这么的需要人“太宰治对这世界深情的告白。</p>
										<form action="getIteminfo" ="post">
									<input type="hidden" name="itemId"
										value="2" /> 
										<input type="submit" class="btn btn-default"
										value="点击前往" />
										</form>
									</div>
								</div>
								<div class="item" align="center">
									<img alt="" src="Resource/Picture/3/1.jpg" />
									<div class="carousel-caption">
										<h4>发现的乐趣</h4>
										<p>比尔·盖茨的偶像科学家。“找到真爱，自由自我，做一个有趣的人。”在这本书里，费曼不仅是一位伟大的科学家，更是一位睿智的思想家。与费曼一同体会：科学的魅力、人文的愉悦、发现万物之理的乐趣。</p>
										<form action="getIteminfo" ="post">
									<input type="hidden" name="itemId"
										value="3" /> 
										<input type="submit" class="btn btn-default"
										value="点击前往" />
										</form>
									</div>
								</div>
							</div>
							<a class="left carousel-control" href="#carousel-727637"
								data-slide="prev"><span
								class="glyphicon glyphicon-chevron-left"></span></a> <a
								class="right carousel-control" href="#carousel-727637"
								data-slide="next"><span
								class="glyphicon glyphicon-chevron-right"></span></a>
						</div>
					</div>
					<div class="col-md-1 column"></div>
				</div>
			</div>
		</div>
	</div>
</body>
</Shtml>