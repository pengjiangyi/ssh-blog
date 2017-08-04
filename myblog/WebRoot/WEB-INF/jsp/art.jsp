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
<title>pjy-blog</title>


<script type="text/javascript"
	src="ueditor/third-party/SyntaxHighlighter/shCore.js"></script>

<link rel="stylesheet" type="text/css"
	href="ueditor/third-party/SyntaxHighlighter/shCoreDefault.css">
<script type="text/javascript">
	SyntaxHighlighter.all();
</script>
<!-- Bootstrap -->
<link href="css/new_file.css" rel="stylesheet">
<link href="css/bootstrap.min.css" rel="stylesheet">
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

INPUT {
	border-left: #fff 1px solid;
	border-top: #fff 1px solid;
	border-right: #fff 1px solid;
	border-bottom: #fff 1px solid;
	margin: 0px 0px 15px 10px;
	padding-left: 10px;
	background: #ccc;
	float: left;
	font-size: 1em;
	line-height: 1.5em;
	height: 20px;
	text-align: left;
}

textarea {
	border-left: #fff 1px solid;
	border-top: #fff 1px solid;
	border-right: #fff 1px solid;
	border-bottom: #fff 1px solid;
	margin: 0px 0px 15px 10px;
	padding-left: 10px;
	background: #ccc;
	float: left;
	font-size: 1em;
	line-height: 1.5em;
}
</style>
</head>

<body style="background-color: #eeeeee;">

	<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/layer/layer.js"></script>
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<!--<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>-->
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="js/bootstrap.min.js"></script>

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
<div class="container" style="margin-top: 50px;margin-left: 17%">

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

					<div id="article-list" style="overflow: auto;">
						<c:forEach items="${article}" var="list">
							<div class="article"
								style="border: 1px SOLID #DDDDDD; min-height: 1100PX; background-color: #ffffff;">

								<div
									style="margin-left:5%;border-bottom:1px solid red; height: 120px;">
									<div style="font-size: 18px;font-weight:700;padding-top: 30px;">${list.title}</div>
									<div style="margin-top: 15px;">标签: ${list.tags.name}</div>
									<div style="float: right;margin-right: 20%;margin-top: 10px;">
										<span style="width: 100px;">${list.createTime}</span> <span
											style="width: 100px;margin-left: 10px;">阅读数(${list.readcount})</span>
									</div>

								</div>

								<div
									style="margin-left: 5%;font-size: 16px;margin-top: 50px;margin-right: 5%"
									id="text">${list.content}</div>

							</div>
						</c:forEach>

					</div>

				</div>

				<div style="margin-top: 30px;">

					<div style="margin-left: 9%;font-size: 17px;font-weight: 700;">
						<span id="commentsCount">${n}</span>条评论
					</div>

					<div style="margin-top: 30px;">

						<section class="comments" id="sec">
							<article class="comment" style="display: none">
								<a class="comment-img" href="#non"> <img src="img/head1.jpg"
									alt="" width="50" height="50"> </a>
								<div class="comment-body">
									<div class="text">
										<p></p>
									</div>
									<p class="attribution">
										by <a href="#non"></a> at
									</p>
								</div>
							</article>


							<c:forEach items="${comments}" var="com">
								<article class="comment">
									<a class="comment-img" href="#non"> <img
										src="img/head1.jpg" alt="" width="50" height="50"> </a>
									<div class="comment-body">
										<div class="text">
											<p>${com.text}</p>
										</div>
										<p class="attribution">
											by <a href="#non">${com.username}</a> at ${com.time}
										</p>
									</div>
								</article>
								<c:if test="${not empty replay}">
									<c:forEach items="${replay}" var="rep">
										<c:if test="${com.id==rep.remark.id}">
											<article class="comment" style="margin-left: 80px">
												<a class="comment-img" href="#non"> <img
													src="img/head1.jpg" alt="" width="50" height="50"> </a>
												<div class="comment-body">
													<div class="text">
														<p>${rep.text}</p>
													</div>
													<p class="attribution">
														by <a href="#non"><span style="color: red">博主彭江毅(回复)</span>
														</a> at ${rep.time}
													</p>
												</div>
											</article>
										</c:if>
									</c:forEach>
								</c:if>
							</c:forEach>
						</section>

					</div>

					<div style="margin-left: 7%;margin-top: 40px;">
						<form action="" id="form1">
							<input type="hidden" value="${id}" name="id" id="aid">

							<table>
								<tr style="padding-left: 5%;">
									<td style="font-size: 18px;font-weight: 700;">发表评论</td>
								</tr>
								<tr>
									<td><input type="text" placeholder="请输入你的名字"
										style="width: 200px;height: 40px;" name="username"
										id="username"></td>
									<td><input type="text"
										style="margin-left: 10px;width: 300px;height: 40px;"
										placeholder="博主回复通知到你的邮箱" name="mail" id="mail"></td>
									<td></td>
								</tr>
								<tr>
									<td colspan="3"><textarea id="cont"
											placeholder="上述邮件地址不会被公开，只用于回复"
											style="width: 100%;height: 200px;" name="cont"></textarea></td>

								</tr>
								<tr>

									<td></td>
									<td></td>
									<td><input type="button" id="bt1"
										style="text-align:center;width: 150px;float:right;height: 50px; "
										value="发表评论" />
									</td>
									<td><input type="reset" name="reset"
										style="display: none;" />
									</td>
								</tr>
							</table>
						</form>
					</div>
				</div>

				<!--分页-->
				<div class="pagination">
					<!--pagation本来就是BootStrap的类，现在用的是自定义的Bootstrap类-->
					<ul>
					</ul>

				</div>
			</div>

			<jsp:include page="aside.jsp"></jsp:include>
		</div>
	</div>
	</div>
	<!-- /.container -->

</body>

</html>

<script type="text/javascript" src="js/art.js">
	
</script>