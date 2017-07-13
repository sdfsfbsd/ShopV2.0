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
    span{
    color:#4169E1;
    font-weight:bold
    }
    .name{
    font-weight:bold
    }
    
    #img1{width:300px; height:300px;}
    #userpic{width:40px; height:40px;}
    #sp1{width:87px; height:87px; position: absolute; left:141; top:56; background: rgba(62, 55, 58, 0.4)
    }
    #img2{width:1800px; height:1800px; position: absolute;}
    .move{
    width:500px; 
    height:500px; 
    position: absolute; 
    left:510px; 
    top:0px; 
    overflow: hidden; 
    display: none;
    z-index:999
    }
    
    .content{
    color:black;
    font-weight:normal
    }
    .num{
    color:#3A5FCD;
    font-weight:bold
    }
    .Uname{
    color:black;
    font-weight:bold
    }
    .star-vote{
    width:120px;
    height:20px;
    position:relative;
    overflow:hidden;
    float:left;
    }
    .star-vote>span{
    position:absolute;
    width:120px;
    height:20px;
    background-size:cover;
    background-repeat:no-repeat;
    left:0px;
    top:0px;
    }
    .star-vote>.add-star{
    background-image:url("${pageContext.request.contextPath}/jpg/star.png");
    }
    .star-vote>.del-star{
    background-image:url("${pageContext.request.contextPath}/jpg/star-trans.png");
    background-color:white;
    }
    
    .star-vot{
    width:120px;
    height:20px;
    position:relative;
    overflow:hidden;
    float:right;
    }
    .star-vot>span{
    position:absolute;
    width:120px;
    height:20px;
    background-size:cover;
    background-repeat:no-repeat;
    left:0px;
    top:0px;
    }
    .star-vot>.add-star{
    background-image:url("${pageContext.request.contextPath}/jpg/star.png");
    }
    .star-vot>.del-star{
    background-image:url("${pageContext.request.contextPath}/jpg/star-trans.png");
    background-color:white;
    }
    
    .wrap {
    background: #fff;
    position:relative;
    left:-50px;
    margin: 20px auto;
    display: block;
    width: 480px;
    height: 420px;
    padding:20px;
    border-radius: 2px 2px 2px 2px; 
    -webkit-box-shadow: 0 1px 4px 
    rgba(0, 0, 0, 0.3), 0 0 40px 
    rgba(0, 0, 0, 0.1) inset;
    -moz-box-shadow: 0 1px 4px rgba(0, 0, 0, 0.3), 0 0 40px rgba(0, 0, 0, 0.1) inset;
    box-shadow: 0 1px 4px 
    rgba(0, 0, 0, 0.3), 0 0 40px 
    rgba(0, 0, 0, 0.1) inset;
}

.wrap img {
    width: 100%;
    margin-top: 15px;
}

p{ 
    margin-top: 15px;
    text-align: justify;
}

h1{
    font-size: 20px;
    font-weight: bold;
    margin-top: 5px; 
    text-shadow: 1px 1px 3px rgba(0,0,0,0.3);
}

a{
    text-decoration: none;
    color: #4A4A4A !important;
}

a:hover{
    text-decoration: underline;
    color: #6B6B6B !important ;
}
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
												元&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												
											</h4>
											<h4 class="col-sm-5 control-label text-info">
											竞猜范围：<s:property value="#session.item.getLowerLimit()"/>~
												<s:property value="#session.item.getUpperLimit()"/>
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
		
		
		<div class="row clearfix" style="background-color: white;padding-top:30px;border-top-left-radius: 15px;border-top-right-radius: 15px;">
			<div class="col-md-6 column">
				<ul class="breadcrumb">
					<li class="active"><s:property value="#session.item.getType()" />
						<a href="<s:property value="#session.item.getType()"/>"></a></li>
					<li><s:property value="#session.item.getCommName()" /></li>
				</ul>
				<p style="text-align:center;">
					<img alt="140x140"
						 src="${pageContext.request.contextPath}/jpg/<s:property value="#session.item.getCommPicUrl()"/>" 
						 id="img1"/>
				    <span id="sp1"></span>
					<div id="box" class="move">
					   <img src="${pageContext.request.contextPath}/jpg/<s:property value="#session.item.getCommPicUrl()"/>" 
					   alt="" id="img2">
					</div>
				</p>
			</div>
			
			<div class="col-md-6 column">
			  <div class ="wrap">
				<br/>
				<h3 class="name">
					<s:property value="#session.item.getCommName()" />
				</h3>
				<input id="commodityPrice" type="hidden" name="commodityPrice" value='<s:property value="#session.item.getCommPrice()"/>'>
				<br/>
				<h4  class="num" >
					数量：<s:property value="#session.item.getCommNumber()" />
				</h4>
				<h3>
					<div id="CountMsg" class="HotDate">
						剩余时间:
					    <span id="t_d">00天</span> 
						<span id="t_h">00时</span> 
						<span id="t_m">00分</span> 
						<span id="t_s">00秒</span>
					</div>
				</h3>
				<br/>
				<h4>
					竞猜截止时间：<s:property value="#session.item.getExpireTime()" />
				</h4>
				<br/>
				<div  style="float:left;font-size:18px;" >
					商家：<s:property value="#session.item.id.shop.id.user.getUsername()" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;信誉评分： 
				</div>
				
				<div id="starcon" class="star-vote">	
                   <span id="addstar" class="add-star"></span>
                   <span id="delstar" class="del-star"></span>
                </div>
                <br/>
                 <br/>
				<a id="modal-951502" href="#modal-container-951502" role="button" 
				   class="btn btn-default" data-toggle="modal">立即开抢</a>
				  
			</div>
		</div>
		</div>
		<div class="row clearfix" style="background-color: white; ">
			<div class="col-md-12 column">
				<div class="tabbable" id="tabs-33659">
					<ul class="nav nav-tabs">
						<li class="active">
						   <a href="#panel-910560" data-toggle="tab">商品详情</a>
						</li>
						<li>
						   <a href="#panel-496130" data-toggle="tab">商家评论(<s:property value="#session.csize"/>)</a>
					    </li>
					</ul>
					<div class="tab-content">
					
						<div class="tab-pane active" id="panel-910560">
						
							<dl class="dl-horizontal">
							
								<br/>
								<dd>
									<s:property value="#session.item.getCommDescription()" />
								</dd>
							</dl>
						</div>
						
						<div class="tab-pane" id="panel-496130">
						<div class="row clearfix">
		<div class="col-md-1 column">
		</div>
		<div class="col-md-11 column">
					       <s:iterator value="#session.clist" id ="comment">
					          <dl>
			                  <br/>
				                 <dt>
				                    <span>
					                   <img  alt="10x10" src="${pageContext.request.contextPath}/jpg/<s:property value="id.user.picUrl"/>"                  
					                   id="userpic"/>
					                </span>
					                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					                <span class="content">
					                   <s:property value="content"/>
					                </span> 
					                   &nbsp;&nbsp;&nbsp;&nbsp;
					                <div class ="Uname"><s:property value="id.user.username"/></span>				                
					                <div id="starcon" class="star-vot">
                                       <span id="addstar" class="add-star"></span>
                                       <span id="" class="del-star" style="left:<s:property value="commentType"/>px" ></span>
                                    </div>                      
				                 </dt>
			                  </dl>
			                  <HR style="border:1 dashed #987cb9" width="100%" color=#987cb9 SIZE=1>
			               </s:iterator>
					    </div>
					</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	window.onload=showStar("${session.item.id.shop.id.user.getCreditLevel()}");        
            //n表示后台获取的星数
    function showStar(n){
        var conwid=document.getElementById("starcon").offsetWidth;
        var delstar=document.getElementById("delstar");
        console.log(conwid);
                
                //透明星星移动的像素
        var delmove=(2*n*conwid)/10;
            //del_star.style.backgroundPosition=-del_move+"px 0px";
        delstar.style.left=delmove+"px";
    }
    
    window.onload=function(){
      var img1 = document.getElementById('img1');
      var img2 = document.getElementById('img2');
      var sp = document.getElementById('sp1');
      var oBox = document.getElementById('box');
      sp.onmouseover=function(){
        oBox.style.display='block';
      };
      sp.onmouseout=function(){
        oBox.style.display='none';
      };
      document.onmousemove=function(ev){
        var x = (ev.clientX || event.clientX)-270-sp.offsetWidth/2;
        var y = (ev.clientY || event.clientY)-155-sp.offsetHeight/2;
        if((ev.clientX || event.clientX)-270<sp.offsetWidth/2){
          x = 0;
        }
        if((ev.clientX || event.clientX)-270>img1.offsetWidth-sp.offsetWidth/2){
          x = img1.offsetWidth-sp.offsetWidth;
        }
        if((ev.clientY || event.clientY)-155<sp.offsetHeight/2){
          y = 0;
        }if((ev.clientY || event.clientY)-155>img1.offsetHeight-sp.offsetHeight/2){
          y = img1.offsetHeight-sp.offsetHeight;
        }
        if((ev.clientX || event.clientX)<560 && (ev.clientY || event.clientY)<460) {
          sp.style.left = (x+143) + 'px';
          sp.style.top = (y+54) + 'px';
          img2.style.left = -x * (img2.offsetWidth / img1.offsetWidth) + 'px';
          img2.style.top = -y * (img2.offsetHeight / img1.offsetHeight) + 'px';
        }
      }
    }
	</script>
</body>
</html>
	
