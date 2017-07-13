<%@page import="org.springframework.web.context.request.RequestScope"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>猜吧</title>

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

<SCRIPT type=text/javascript>
function Over(o){ o.style.border='1px solid #FF3300';}
function Out(o){ o.style.border='0px dotted #000';}
</SCRIPT>
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
								<a href = "${pageContext.request.contextPath}/showTypeAction.do?type =yundong">运动</a>
								/<a href = "${pageContext.request.contextPath}/showTypeAction.do?type =huwai">户外</a>
							</div>
							<div class="panel-body"
								style="border-bottom:1px solid ;border-bottom-color: #CCCCCC">
								 <a href = "${pageContext.request.contextPath}/showTypeAction.do?type =jiadian" >家电</a>
								/<a href = "${pageContext.request.contextPath}/showTypeAction.do?type =shuma">数码</a>
								/<a href = "${pageContext.request.contextPath}/showTypeAction.do?type =shouji">手机</a>
							</div>
							<div class="panel-body"
								style="border-bottom:1px solid ;border-bottom-color: #CCCCCC">
								 <a href = "${pageContext.request.contextPath}/showTypeAction.do?type =xiexue">鞋靴</a>
								/<a href = "${pageContext.request.contextPath}/showTypeAction.do?type =peijian">配件</a>
							</div>
							<div class="panel-body"
								style="border-bottom:1px solid ;border-bottom-color: #CCCCCC">
								 <a href = "${pageContext.request.contextPath}/showTypeAction.do?type =wujindianzi">五金电子</a>
								/<a href = "${pageContext.request.contextPath}/showTypeAction.do?type =bangong">办公</a>
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
						
			
				
			</div>
					<div class="col-md-12 column"
						style="background-color: white;height: auto;border-top-left-radius: 5px;border-top-right-radius: 5px;border-bottom-left-radius: 5px;border-bottom-right-radius: 5px;">
			<div class="panel panel-default" border-radius: 8px 8px 8px 8px;>
				<div class="panel-heading" >
					<h1 class="panel-title">
						<font color ="000">当前分类：
						<s:property value = "#session.Classify.get(0).getType()"></s:property> </font>
					</h1>
				</div>
				<div class="panel-body">			
					<s:iterator value="#session.Classify" id="classifyitem">
						
						<div class="col-md-3 column" onmouseover= Over(this); onmouseout= Out(this);style = "height:370px">
							<div>
							<img alt=""
								src="${pageContext.request.contextPath}/jpg/<s:property value = "commPicUrl" ></s:property>"  style="height: 300px;width : 250px" />
							</div>
							<div style="padding-top: 5px">
								
								 <a href = "${pageContext.request.contextPath}/showItemAction.do?
								 idcommodity=<s:property value ="id.idcommodity"></s:property>">
					 			  <s:property value = "commName"></s:property></a>						
								
							</div>
							<div>
								<font color = "#FF0000">截止时间：<s:property value = "expireTime"></s:property></font>
							</div>
						</div>
					</s:iterator> 		
			</div>		
		</div>
		</div>
			</div>
			</div>
		</div>
	</div>
  </body>
</html>
