<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<title>倾听你我的心声</title>

<!-- Bootstrap -->

<link href="css/art.css" rel="stylesheet">

<link
	href="http://keleyi.com/keleyi/phtml/jqtexiao/14/keleyidivpager.css"
	type="text/css" rel="Stylesheet" />
<link href="css/bootstrap.min.css" rel="stylesheet">
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


</head>




<body style="background-color: #eeeeee;  ">
	<script type="text/javascript"
		src="http://keleyi.com/keleyi/phtml/jqtexiao/14/keleyidivpager.js"></script>
	<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
		<script src="js/modernizr.js"></script>
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
<a class="navbar-brand" href="#" style="margin-left:5%;"><img src="images/logo4.png" alt="logo" style="margin-top:-5px ;"></a>			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li class="head-li"><a
						href="${pageContext.request.contextPath}/index.jsp">主页 </a>
					</li>
					<li class="head-li" id="guidang"><a
						href="${pageContext.request.contextPath}/archive.html">归档</a>
					</li>
					<li class="active" id="liuyan"><a
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
				<div style="margin-top: 30px;">


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


							<c:forEach items="${map.list}" var="words">
								<article class="comment">
									<a class="comment-img" href="#non"> <img class="com-photo"
										style="border-radius:50px" src="img/head1.jpg" alt=""
										width="50" height="50"> </a>
									<div class="comment-body">
										<div class="text" style="word-break:break-all;"
											<p>${words.text}</p>
										</div>
										<p class="attribution">
											by <a href="#non">${words.username}</a> at
											<fmt:formatDate value="${words.time}"
												pattern="yyyy-MM-dd HH:mm:ss" />
										</p>
									</div>
								</article>

								<c:if test="${not empty list2}">
									<c:forEach items="${list2}" var="rep">
										<c:if test="${words.id==rep.words.id}">
											<article class="comment" style="margin-left: 80px">
												<a class="comment-img" href="#non"> <img
													style="border-radius:50px" src="img/head11.jpg" alt=""
													width="50" height="50"> </a>
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
					<div id="div_pager" style="margin-top: 30px">
					</div>
					<div style="margin-top: 50px;" >
						<h2 style="text-align: center;">
							<span class="glyphicon glyphicon-pencil"></span> Add Comment
						</h2>

						<form action="" id="form1">

							<input type="hidden" value="${id}" name="id" id="aid">
							<div class="row">
								<div class="col-md-6">
									<input type="text" name="username" id="username"
										placeholder="Your Name" class="form-control input-lg" style="margin-left: 2%;margin-bottom: 20px">
								</div>
								<div class="col-md-6">
									<input type="email" name="mail" id="mail" placeholder="Email"
										class="form-control input-lg" style="margin-left: 2%;margin-bottom: 20px">
								</div>
							</div>



							<textarea rows="10" name="cont" id="cont"
								placeholder="Your Message" class="form-control input-lg" style="margin-left: 10px"></textarea>

							<div class="buttons clearfix " style="margin-top:20px;margin-bottom: 20px";>
								<button type="button" id="bt1"
									class="btn btn-xlarge btn-clean-one"
									style="width: 100%;margin-left: 10px">Submit</button>
							</div>
							<td><input type="reset" name="reset" style="display: none;" />
							</td>
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
	<div style="display: none" id="pagecount">${map.pageCount}</div>
	<div style="display: none" id="count">${map.count}</div>
	<div style="display: none" id="page">${map.page}</div>



</body>

</html>
<script type="text/javascript" src="js/word.js"></script>
