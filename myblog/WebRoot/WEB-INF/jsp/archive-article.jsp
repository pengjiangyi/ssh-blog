<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<link href="http://keleyi.com/keleyi/phtml/jqtexiao/14/keleyidivpager.css" type="text/css" rel="Stylesheet" />

<!-- Bootstrap -->
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css"
	rel="stylesheet">

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
 <script type="text/javascript" src="http://keleyi.com/keleyi/phtml/jqtexiao/14/keleyidivpager.js"></script>
	<script type="text/javascript"
		src="http://127.0.0.1:8080/myblog/js/jquery-3.1.1.min.js"></script>
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
				<a class="navbar-brand" href="#" style="margin-left:150px ;">pjyblog</a>
			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
					<li class="active"><a
						href="${pageContext.request.contextPath}/index.jsp">主页 </a></li>
					<li class="head-li" id="guidang"><a
						href="${pageContext.request.contextPath}/archive.html">归档</a></li>
					<li class="head-li" id="liuyan"><a
						href="${pageContext.request.contextPath}/words-1.html">留言</a></li>
					<li class="head-li" id="guanyu"><a
						href="${pageContext.request.contextPath}/about.html"
						target="blank_">关于</a></li>
					<li class="head-li" id="ht5"><a href="#">随机词条</a></li>
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



				<div id="art">
					<c:forEach items="${map.list}" var="list">
						<div id="article-list">
							<div id="loading">
								<!--<img width="32" height="32" src="/Content/images/ico_loading2.gif" />-->
							</div>

							<div class="article"
								style="border: 1px SOLID #DDDDDD; height: 340PX; background-color: #ffffff;">

								<span class="label label-info"
									style="margin-top:15px;margin-left: 10px; display: inline-block; height: 25px; width: 120px;text-align: center; line-height: 25px;">${list.categories.name}</span>
								<span
									style="font-size: 20px; display: inline-block;margin-left: 10px; font:bold 20px/1.5em "
									MicrosoftYaHei";">${list.title}</span> <br />
								<div style="margin-top: 5px;">
									<span style="margin-left: 10px;">${list.createTime} </span> <span
										style="margin-left: 10px;"> <img alt=""
										src="${pageContext.request.contextPath}/img/read.png"
										style="width: 20px"> 浏览(${list.readcount}) </span> <span
										style="margin-left: 10px;"></span>

								</div>
								<div class="text"
									style=" padding-top:20px;height: 200px; margin-left: 10px; margin-top: 10px;font-size:17px">
									<div style="float: left;width: 200px;height: 200px">
										<img alt=""
											src="${pageContext.request.contextPath}/img/img1.jpg"
											style="width: 200px" height="200px">
									</div>
									<div
										style="float: left;word-break:break-all;width: 500px;height:200px;margin-left:30px;font-size: 13px;color:#837154">${list.content}
									</div>
								</div>
								<div style="margin-top: 10px;">

									<span class="labe label-info"
										style="display: inline-block; margin-left: 10px; width: 15%; text-align: center;">${list.tags.name}</span>

								</div>
								<div
									style="float:right;width:120px;height:35px;margin-right:40px;margin-top:-20px">
									<input type="button" style="width:80px;" value="阅读全文"
										onclick="readAll(${list.id})">
								</div>

							</div>

						</div>

					</c:forEach>
				</div>
				
					<div id="div_pager" style="margin-top: 30px">
					 </div>
				
				
				
			</div>
			
			
			
			<jsp:include page="aside.jsp"></jsp:include>
			

			
		</div>
	</div>
	</div>
	<!-- /.container -->
	
	
	<div style="display: none" id="pagecount">
		${map.pageCount}
		</div>
		<div style="display: none" id="count">
		${map.count}
		</div>
			<div style="display: none" id="page">
		${map.page}
		</div>
</div>
			<div style="display: none" id="ym">
		${ym}
		</div>
		
	
</body>
</html>
	<script type="text/javascript" src="js/archive-article.js">
		

</script>