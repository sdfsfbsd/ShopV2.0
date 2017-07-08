<%@page import="org.springframework.web.context.request.RequestScope"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>BUKE网</title>

<meta name="keywords" content="keyword1,keyword2,keyword3">
<meta name="description" content="this is my page">
<meta name="content-type" content="text/html; charset=UTF-8">
	<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
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
</head>
  
  <body>
    	<div class="container">
		<div class="row clearfix">
			<div class="col-md-12 column">
				<nav class="navbar navbar-default" role="navigation">
					<div class="navbar-header">
						<ul class="nav navbar-nav">
							<li><a class="navbar-brand active" href="${pageContext.request.contextPath}/jsp/mainPage.jsp">首页</a></li>
						</ul>
					</div>
					<div class="collapse navbar-collapse"
						id="bs-example-navbar-collapse-1">
						<ul class="nav navbar-nav">

							<li><a href="#">畅销榜</a></li>
						</ul>
						<form class="navbar-form navbar-left" role="search"
							action="search" method="post">
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
										<li><a href="${pageContext.request.contextPath }/jsp/personalData.jsp">我的信息</a></li>
										<li class="divider"></li>
										<li><a href="${pageContext.request.contextPath}/jsp/myGuess.jsp">我的竞猜</a></li>
										<li class="divider"></li>
										<li><a href="myshop.jsp">我的订单</a></li>
									</ul></li>
								<li><a href="${pageContext.request.contextPath}/logoutAction.do">注销</a></li>

							</s:if>



							<s:else>
								<li><a href="login.jsp">登录</a></li>
							</s:else>
						</ul>
					</div>
				</nav>
				<div class="row clearfix">
					<div class="col-md-4 column">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h3 class="panel-title">分类</h3>
							</div>
							<div class="panel-body"
								style="border-bottom:1px solid ;border-bottom-color: #CCCCCC">
								<span style="display:inline-block;">
								<form action = "${pageContext.request.contextPath}/showTypeAction.do" method = "post">								
									<input type="hidden" name="type" value="yundong"/>
									<input type="submit" class="btn btn-default" value="运动" />	
								</form>
								</span>
								<span style="display:inline-block;">
								<form action = "${pageContext.request.contextPath}/showTypeAction.do" method = "post">								
									<input type="hidden" name="type" value="huwai"/>
									<input type="submit" class="btn btn-default"  value="户外" />	
								</form>
								</span>
							</div>
							<div class="panel-body"
								style="border-bottom:1px solid ;border-bottom-color: #CCCCCC">
																<span style="display:inline-block;">
								<form action = "${pageContext.request.contextPath}/showTypeAction.do" method = "post">								
									<input type="hidden" name="type" value="jiadian"/>
									<input type="submit" class="btn btn-default" value="家电" />	
								</form>
								</span>
								<span style="display:inline-block;">
								<form action = "${pageContext.request.contextPath}/showTypeAction.do" method = "post">								
									<input type="hidden" name="type" value="shuma"/>
									<input type="submit" class="btn btn-default" value="数码" />	
								</form>
								</span>
								<span style="display:inline-block;">
								<form action = "${pageContext.request.contextPath}/showTypeAction.do" method = "post">								
									<input type="hidden" name="type" value="shouji"/>
									<input type="submit" class="btn btn-default" value="手机" />	
								</form>
								</span>
							</div>
							<div class="panel-body"
								style="border-bottom:1px solid ;border-bottom-color: #CCCCCC">
																<span style="display:inline-block;">
								<form action = "${pageContext.request.contextPath}/showTypeAction.do" method = "post">								
									<input type="hidden" name="type" value="xiexue"/>
									<input type="submit" class="btn btn-default" value="鞋靴" />	
								</form>
								</span>
								<span style="display:inline-block;">
								<form action = "${pageContext.request.contextPath}/showTypeAction.do" method = "post">								
									<input type="hidden" name="type" value="peijian"/>
									<input type="submit" class="btn btn-default" value="配件" />	
								</form>
								</span>
							</div>
							<div class="panel-body"
								style="border-bottom:1px solid ;border-bottom-color: #CCCCCC">
																<span style="display:inline-block;">
								<form action = "${pageContext.request.contextPath}/showTypeAction.do" method = "post">								
									<input type="hidden" name="type" value="wujindianzi"/>
									<input type="submit" class="btn btn-default" value="五金电子" />	
								</form>
								</span>
								<span style="display:inline-block;">
								<form action = "${pageContext.request.contextPath}/showTypeAction.do" method = "post">								
									<input type="hidden" name="type" value="bangong"/>
									<input type="submit" class="btn btn-default" value="办公" />	
								</form>
								</span>
							</div>
						</div>
					</div>
					<div class="col-md-8 column" style="padding-top: 10px;padding-bottom: 10px">
						<div class="carousel slide" id="carousel-727637">
							<ol class="carousel-indicators">
								<li class="active" data-slide-to="0"
									data-target="#carousel-727637"></li>
								<li data-slide-to="1" data-target="#carousel-727637"></li>
								<li data-slide-to="2" data-target="#carousel-940489"></li>
							</ol>
							<div class="carousel-inner">
								<div class="item active" align="center">
									<img alt="" src="${pageContext.request.contextPath}/jpg/baiyexing.jpg" style="height: 230px"/>
									<div class="carousel-caption">
										<h4 style="color: white;">罗尼</h4>
										<p style="color: white;">英国国家图书奖作品，斯蒂芬.金盛赞推荐，被称为当代经典的传奇处女作</p>
										<form action="getIteminfo"="post">
											<input type="hidden" name="itemId" value="1" /> <input
												type="submit" class="btn btn-default" value="点击前往" />
										</form>
									</div>
								</div>
								<div class="item" align="center">
									<img alt="" src="${pageContext.request.contextPath}/jpg/1.jpg"  style="height: 230px" />
									<div class="carousel-caption">
										<h4>人间失格</h4>
										<p>(公版书)“尽管人是这么的让人失望，但人还是这么的需要人“太宰治对这世界深情的告白。</p>
										<form action="getIteminfo"="post">
											<input type="hidden" name="itemId" value="2" /> <input
												type="submit" class="btn btn-default" value="点击前往" />
										</form>
									</div>
								</div>
								<div class="item" align="center">
									<img alt="" src="${pageContext.request.contextPath}/jpg/1.jpg"  style="height: 230px"/>
									<div class="carousel-caption">
										<h4>发现的乐趣</h4>
										<p>比尔·盖茨的偶像科学家。“找到真爱，自由自我，做一个有趣的人。”在这本书里，费曼不仅是一位伟大的科学家，更是一位睿智的思想家。与费曼一同体会：科学的魅力、人文的愉悦、发现万物之理的乐趣。</p>
										<form action="getIteminfo"="post">
											<input type="hidden" name="itemId" value="3" /> <input
												type="submit" class="btn btn-default" value="点击前往" />
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
					<!--div class="col-md-12 column"
						style="background-color: white;height: 700px;border-top-left-radius: 5px;border-top-right-radius: 5px;border-bottom-left-radius: 5px;border-bottom-right-radius: 5px;">
						</div-->
						<div class="col-md-12 column" style="background-color: white;padding-bottom: 15px;padding-top: 15px">
					<s:iterator value="#session.Item" id="item">
						<div class="col-md-3" style="height: 500">
							<img alt=""
								src="${pageContext.request.contextPath}/jpg/<s:property value = "commPicUrl" ></s:property>"  style="height: 300px;width : 200px" />
							
							<tr>
								<form action="showItemAction" method="post">
									<input type="hidden" name="itemId"
										value="<s:property value = "idcommodity"></s:property>" /> 
									<input type="submit" class="btn btn-default"
										value="<s:property value = "commName"></s:property>" />
								</form>
							</tr>
						</div>
					</s:iterator>
				</div>
				</div>
			</div>
		</div>
	</div>
  </body>
</html>
