<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html lang="zh-CN">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>www.pengjiangyi.com</title>

<link
	href="http://keleyi.com/keleyi/phtml/jqtexiao/14/keleyidivpager.css"
	type="text/css" rel="Stylesheet" />

<!-- Bootstrap -->
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css"
	rel="stylesheet">

<link href="${pageContext.request.contextPath}/css/styles.css"
	rel="stylesheet">

<link href="${pageContext.request.contextPath}/css/font-awesome.min.css"
	rel="stylesheet">


<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:400,600|PT+Serif:400,400italic'
	rel='stylesheet' type='text/css'>


<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<style>
#bs-example-navbar-collapse-1 li {
	width: 100px;
	text-align: center;
}

.title:hover {
	cursor: pointer;
}

a:link {
	text-decoration: none;
	color: blue
}

a {
	color: black;
	cursor: pointer;
}

　　 a:active {
	text-decoration: blink
}

　　 a:hover {
	text-decoration: underline;
	color: red
}

　　 a:visited {
	text-decoration: none;
	color: green
}

.hidden-xs {
	margin-top: 20px;
	margin-bottom: 20px;
	background-color: #ffffff;
	border: 1px solid #dddddd;
}

.gzwm li {
	list-style: none;
}

.btn-primary {
	margin-left: 20px;
	width: 140px;
	margin-bottom: 5px;
	font-size: 6px;
}

.text {
	overflow: hidden;
	position: relative;
}
</style>
</head>

<body style="background-color: #eeeeee;">
	<script type="text/javascript"
		src="http://keleyi.com/keleyi/phtml/jqtexiao/14/keleyidivpager.js"></script>
	<script type="text/javascript"
		src="http://127.0.0.1:8080/myblog/js/jquery-3.1.1.min.js"></script>
	<script src="js/modernizr.js"></script>

	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<!--<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>-->
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="http://127.0.0.1:8080/myblog/js/bootstrap.min.js"></script>


	<nav class="navbar navbar-default navbar-fixed-top">
		<div class="container-fluid">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
					aria-expanded="false">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#" style="margin-left:5%;"><img src="images/logo4.png" alt="logo" style="margin-top:-5px ;"></a>
			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li class="active"><a
						href="${pageContext.request.contextPath}/index.jsp">主页 </a>
					</li>
					<li class="head-li" id="guidang"><a
						href="${pageContext.request.contextPath}/archive.html">归档</a>
					</li>
					<li class="head-li" id="liuyan"><a
						href="${pageContext.request.contextPath}/words-1.html">留言</a>
					</li>
					<li class="head-li" id="guanyu"><a
						href="${pageContext.request.contextPath}/about.html"
						target="blank_">关于</a>
					</li>
					<li class="head-li" id="ht5"><a
						href="${pageContext.request.contextPath}/photo.html">摄影</a>
					</li>
				</ul>

			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->

	</nav>
	<div class="container" style="margin-top: 50px;">

		<div class="row">
			<!--row必须包含在.container（固定宽度）或 .container-fluid （100% 宽度）中,通过row在水平方向创建一组column12个-->
			<div id="mainbody" class="col-md-8">
				<!--<div id="ie-warning" class="alert alert-danger fade in">
						<button type="button" class="close" data-dismiss="alert">×</button>
						<span class="glyphicon glyphicon-exclamation-sign"></span> 请注意，ZynBlog并不支持低于IE8的浏览器，为了获得最佳效果，推荐使用FireFox浏览器。
					</div>-->
				<!--	每日一句，从数据库获取-->
				<div class="well fade in daytips"
					style="padding:15px;background-color: #f9f9f9; margin-top: 40px;">
					<button type="button" class="close" data-dismiss="alert">×</button>
					<div style='line-height:20px'>
						<span>勿忘初心，方得始终</span>
					</div>
				</div>
				<!--	文章列表，从数据库查，新增DIV-->
				<c:forEach items="${map.list}" var="list" varStatus="status">
					<c:if test="${status.index%2 == 0}">
						<div class="row">
					</c:if>
					<div class="col-md-6 col-sm-6">
						<article class=" blog-teaser" style="background-color: #f7f6f1;">
							<header>
								<div style="height: 250px" >
								<img src="${list.imgPath}" alt=""  style="height:250px;  padding: 10px 10px 10px 10px" class="img-resonsive">
								</div>
								<h3>
									<a onclick="readAll(${list.id})">${list.title}  </a>
								</h3>
								<span class="meta" >
								<span style="margin-right: 10px"><span class="glyphicon glyphicon-eye-open"></span>${list.readcount}</span>
								
								<span
									class="glyphicon glyphicon-th-list" ><fmt:formatDate value="${list.createTime}" pattern="yyyy-MM-dd"/></span> <span class="glyphicon glyphicon-user" style="margin-left: 10px"></span>MR.pjy</span>
								<hr>
							</header>
							<div class="body"
								style="height: 100px;word-break:break-all;overflow: hidden">${list.content}
							</div>
							<div class="clearfix">
							
								
								<span  onclick="readAll(${list.id})" class="btn btn-clean-one">Read more</span>
							</div>
						</article>
					</div>
					<c:if test="${status.index%2==1 || status.index+1==fn:length(map.list)}">
			</div>
			</c:if>
			</c:forEach>
			<div id="div_pager" style="margin-top: 30px"></div>
		</div>
		<jsp:include page="aside.jsp"></jsp:include>
	</div>
   
   
   
	<!-- /.container -->
	
	
	  <div class="container-fluid" style="background-color: #f8f8f8;font-size: 14px;height: 45px;line-height: 45px">
    <div class="row">
    <div class="col-md-5" style="text-align: center;">&copy; CopyRight© 2016-2017版权所有 ICP备案号：湘ICP备17014576号  </div>
    <div class="col-md-2" style="text-align: center;">商务合作QQ:741506070</div>
	<div class="col-md-5" style="text-align: center;">投稿邮箱:java@pengjiangyi.com</div>
    </div>
    </div>
		

	
	
	<div style="display: none" id="pagecount">${map.pageCount}</div>
	<div style="display: none" id="count">${map.count}</div>
	<div style="display: none" id="page">${map.page}</div>

</body>

  
</html>
<script src="js/index-main.js">
	
</script>
<script>
	var text=document.getElementsByClassName('body');
	for(var i=0;i<text.length;i++)
	{
	var dd=text[i].innerHTML.replace(/<\/?.+?>/g,"");
	var dds=dd.replace(/ /g,"");//dds为得到后的内容
	var text2=dds.replace(/&nbsp;/ig, "");
	 if(text2.length>10)
	 {
	 text[i].innerHTML=text2.substr(0,50)+"...";
	 }
	}
	
</script>