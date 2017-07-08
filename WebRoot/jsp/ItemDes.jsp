<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>  
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

  <head>
    <base href="<%=basePath%>">
    
    <title> 猜吧 </title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="/css/bootstrap.min.css">
    <!-- 如果你想采用Bootstrap2的样式，那么引入该压缩css文件 -->
    <link rel="stylesheet" href="/UI/css/bootstrap-theme.min.css">
    <!-- 引入已经压缩的js文件 -->
    <script src="/UI/js/bootstrap.min.js"></script>
    <link href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
	<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
	body {
	background-image: url(${pageContext.request.contextPath}/jpg/2.jpg);
	background-color: #000000;
	};
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
    <div class="container" >
    <div class="row clearfix">
		<div class="col-md-12 column">
		<nav class="navbar navbar-default" role="navigation">
		<div class="navbar-header">
					<ul class="nav navbar-nav">
						<li> <a class="navbar-brand active" href="${pageContext.request.contextPath }/jsp/mainPage.jsp">首页</a></li></ul>
					</div>
					<div class="collapse navbar-collapse"
						id="bs-example-navbar-collapse-1">
						<ul class="nav navbar-nav">
						 
							<li><a href="#">畅销榜</a></li>
						</ul>
						<form class="navbar-form navbar-left" role="search">
							<div class="form-group">
								<input type="text" class="form-control" />
							</div>
							<button type="submit" class="btn btn-default">搜索</button>
						</form>
						<ul class="nav navbar-nav navbar-right ">
							<s:if test="#session.userName!=null">
								<li><a href="personalData.jsp"><s:property
											value="#session.userName" /> </a></li>
								<li><a href="<s:url action="logout"/>">注销</a></li>
							</s:if>
							<s:else>
								<li><a href="login.jsp">登陆</a></li>
							</s:else>
						</ul>
					</div>
				</nav>
		</div>
	</div>
	<div class="row clearfix" style="background-color: white;padding-top:30px;border-top-left-radius: 15px;border-top-right-radius: 15px;">
		<div class="col-md-6 column">
		<ul class="breadcrumb">
				<li class="active">
				<s:property value="#session.item.getType()"/>
					 <a href="<s:property value="#session.item.getType()"/>"></a>
				</li>
				<li>
					<s:property value="#session.item.getCommName()"/>
				</li>
			</ul>
			<p style="text-align:center;">
			<img alt="140x140" src="${pageContext.request.contextPath}/jpg/<s:property value="#session.item.getCommPicUrl()"/>" style= "width:370px;height:200px;"/>
			</p>
		</div>
		<div class="col-md-6 column">
		<br />
		<h2> <s:property value="#session.item.getCommName()"/></h2>
		<br />
		<h3>数量：<s:property value="#session.item.getCommNumber()"/></h3>
		<br />
		<h4> 竞猜截止时间：<s:property value="#session.item.getExpireTime()"/></h4>
		<br />
		
		<h3>
		<div id="CountMsg" class="HotDate"> 
		剩余时间：
		<span id="t_d">00天</span> 
		<span id="t_h">00时</span> 
        <span id="t_m">00分</span> 
        <span id="t_s">00秒</span> 
        </div> 
        </h3>
        
        <script type="text/javascript"> 
        function getRTime(){
         
        var EndTime= new Date("${session.item.expireTime}"); //截止时间 
        var NowTime = new Date(); 
        var t =EndTime.getTime() - NowTime.getTime(); 
        var d=Math.floor(t/1000/60/60/24); 
        var h=Math.floor(t/1000/60/60%24); 
        var m=Math.floor(t/1000/60%60); 
        var s=Math.floor(t/1000%60);  
        document.getElementById("t_d").innerHTML = d + "天"; 
        document.getElementById("t_h").innerHTML = h + "时"; 
        document.getElementById("t_m").innerHTML = m + "分"; 
        document.getElementById("t_s").innerHTML = s + "秒"; 
        } 
        setInterval(getRTime,1000); 
        </script> 
        
        <br/>
        <button type="button" class="btn btn-default" style='font-size:20px'>立即开抢</button>
		</div>
		</div>
	<div class="row clearfix" style="background-color: white; ">
		<div class="col-md-12 column">
		<div class="tabbable" id="tabs-33659">
				<ul class="nav nav-tabs">
					<li class="active">
						 <a href="#panel-910560" data-toggle="tab">	商品详情</a>
					</li>
				</ul>
				<div class="tab-content">
					<div class="tab-pane active" id="panel-910560">
				<dl class="dl-horizontal">
				<br/>
				<dd>
					<s:property value="#session.item.getCommDescription()"/>
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

