<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'aside.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

<link href="${pageContext.request.contextPath}/css/styles.css"
	rel="stylesheet">

<link href="${pageContext.request.contextPath}/css/font-awesome.min.css"
	rel="stylesheet">


<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:400,600|PT+Serif:400,400italic'
	rel='stylesheet' type='text/css'>


</head>
<style>
.tagBall {
	width: 300px;
	height: 250px;
	margin: 50px auto;
	position: relative;
}

.tag {
	display: block;
	position: absolute;
	left: 0px;
	top: 0px;
	color: #000;
	text-decoration: none;
	font-family: "微软雅黑";
	font-weight: bold;
}

.tag:hover {
	border: 1px solid #666;
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
</style>


<body>


	<!--右侧边栏:大概包含五部分内容：1.关注我、2.目录分类、3.最新评论、4.标签云或友情链接-->
	<aside     class="col-md-4" id="sidebar"> <aside
		style="margin-top: 40px;">
	<div class="hidden-xs">
		<div class="panel-heading">
			<img style="width: 20px"
				src="${pageContext.request.contextPath}/img/person.png" /> 彭江毅
		</div>
		<div class="panel-body"
			style="padding:10px;font-size: 15px; line-height: 1.5;">
			<div>
				<div
					style="width:150px;text-align:center;font-size:14px;float:left;">
					<img id="wxlook" class="img-responsive" style="margin-right:5px"
						width="145" height="145" alt="微信扫一扫" title="打开微信扫一扫"
						src="http://on5j96b7m.bkt.clouddn.com/pjyblog/20170421/110627638.png">
					微信扫一扫
				</div>
				<div style="text-indent:2em;">
					<p>
						这是一个程序员的独立博客站，主要用于分享与编程技术相关的内容， 同时这里也是博主记录工作学习中遇到的问题及其解决方案的地方。
						PS:彭江毅:非著名程序员，IT界的一名小学生。目前在研究javaweb、mysql、算法基础等... 更多信息请点击： <a
							target="_blank"
							href="${pageContext.request.contextPath}/about.html"
							style="color:#1abc9c">关于本站.</a>
					</p>
				</div>
			</div>
		</div>
		<hr style="margin:0 0 10px 0" />
		<div class="gzwm">
			<ul>
				<li style="float: left;margin-right: 15px"><a class="github"
					href="https://pengjiangyi.github.io" target="_blank" title="GitHub">
						<img style="width: 20px"
						src="${pageContext.request.contextPath}/img/github.png" /> github</a>
				</li>
				<li style="float: left;margin-right: 15px"><a class="xlwb"
					href="http://weibo.com/5343552673/profile?rightmod=1&wvr=6&mod=personinfo&is_all=1" target="_blank" title="新浪微博"> <img style="width: 20px"
						src="${pageContext.request.contextPath}/img/weibo.png" /> 新浪微博</a>
				</li>
				<li><a class="github.io" href="https://pengjiangyi.github.io"
					target="_blank" title="git博客"> <img style="width: 20px"
						src="${pageContext.request.contextPath}/img/git.png" /> git博客</a>
				</li>

			</ul>
		</div>
	</div>
	</aside> <aside id="doc_category">
	<div class="hidden-xs">
		<div class="panel-heading">
			<img style="width: 20px"
				src="${pageContext.request.contextPath}/img/fenlei.png" /> 文以类聚
		</div>
		<div class="d_tags">
			<c:forEach items="${category}" var="str">
				<a
					href="${pageContext.request.contextPath}/category-article-1-${str[2]}.html">
					<span class="taggg"  
				style="display:inline-block;   border: 1px solid #cccccc;margin-left:5% ;margin-bottom:20px; padding-left:16px;padding-right:17px;padding-top:4px;padding-bottom:4px  font-size: 18px">${str[1]}(${str[0]})</span> 
					
					</a>
			</c:forEach>

			<!-- <a href="/Home/Index/3">
								<button class="btn btn-primary" type="button">
									hexo <span class="badge">2</span>
								</button> </a> <br /> <a href="/Home/Index/1">
								<button class="btn btn-primary" type="button">
									ssh<span class="badge">3</span>
								</button> </a> <a href="/Home/Index/3">
								<button class="btn btn-primary" type="button">
									mysql <span class="badge">1</span>
								</button> </a> -->

		</div>
	</div>
	</aside> <aside id="tags">
	<div class="hidden-xs">
		<div class="panel-heading">
			<img style="width: 20px"
				src="${pageContext.request.contextPath}/img/qian.png" /> 标签云
		</div>
		<c:forEach items="${tag}" var="tags">
			<span class="taggg"  onclick="findarticle(this)"
				style="display:inline-block;   border: 1px solid #cccccc;margin-left:5% ;margin-bottom:20px; padding-left:16px;padding-right:17px;padding-top:4px;padding-bottom:4px  font-size: 18px">${tags}</span>
		</c:forEach>

	</div>
	</aside> <aside id="doc_category">
	<div class="hidden-xs">
		<div class="panel-heading">
			<img style="width: 20px"
				src="${pageContext.request.contextPath}/img/top.png" /> 阅读排行
		</div>
		<div class="d_title">
			<ul class="list-group list-group-flush">
				<c:forEach items="${readCount}" var="read">
					<li class="list-group-item"  style="word-break:break-all;overflow: hidden"><span class="comment-log" ">
							<a
							href="${pageContext.request.contextPath}/index-article-detail-${read.id}.html">
								<span> ${read.title} </span> </a> <span> (${read.readcount})
						</span> </span>
					</li>
				</c:forEach>
			</ul>
		</div>
	</div>
	</aside> <aside id="doc_category">
	<div class="hidden-xs">
		<div class="panel-heading">
			<img style="width: 20px"
				src="${pageContext.request.contextPath}/img/cundang.png" /> 文章存档
		</div>
		<div class="d_title">
			<ul class="list-group list-group-flush">
				<c:forEach items="${ll}" var="list">
					<li class="list-group-item"><span class="comment-log">
							<a href="${pageContext.request.contextPath}/archive-1/${list.ym}">
								<span>${list.ym}</span> </a> <span> (${list.count}) </span> </span>
					</li>
				</c:forEach>
			</ul>
		</div>
	</div>
	</aside> <aside>
	<div class="hidden-xs">
		<div class="panel-heading">
			<img style="width: 20px"
				src="${pageContext.request.contextPath}/img/comments.png" /> 最新评论
		</div>
		<ul class="list-group list-group-flush">
			<c:if test="${!empty remark}">
				<c:forEach items="${remark}" var="remark">
					<li class="list-group-item"><span class="author-avatar">
							<img src="img/head1.jpg" class="avatar avatar-40 photo"
							height="40" width="40" style="border-radius:40px "> </span> <span
						class="comment-log "> <a class="log"
							href="${pageContext.request.contextPath}/index-article-detail-${remark.artic.id}.html">
								${remark.text} </a> </span></li>
				</c:forEach>
			</c:if>
			<c:if test="${empty remark}">

				<li class="list-group-item"><span class="comment-log">赶快！还没有人评论！</span>
				</li>
			</c:if>
		</ul>
	</div>
	</aside> <aside id="zyn_latest_comments-2">
	<div class="hidden-xs">
		<div class="panel-heading">
			<img style="width: 20px"
				src="${pageContext.request.contextPath}/img/remark.png" /> 雁过留声
		</div>


		<ul class="list-group list-group-flush">
			<c:if test="${!empty words}">
				<c:forEach items="${words}" var="words">
					<li class="list-group-item"><span class="author-avatar">
							<img src="img/head1.jpg" class="avatar avatar-40 photo"
							height="40" width="40" style="border-radius:40px " /> </span> <span
						class="comment-log log"> ${words.text} </span></li>
				</c:forEach>
			</c:if>
			<c:if test="${empty words}">
				<li class="list-group-item"><span class="comment-log">就等你来踩一踩了</span>
				</li>
			</c:if>
		</ul>
	</div>
	</aside> <aside id="tag_cloud">
	<div class="hidden-xs">
		<div class="panel-heading">
			<img style="width: 20px"
				src="${pageContext.request.contextPath}/img/qian.png" /> 上上签儿
		</div>
		<div class="">


			<div class="tagBall" >
				<a class="tag" style="font-size:15pt" href="">PJY</a> <a class="tag"
					style="font-size:16pt" href="">Java</a> <a class="tag"
					style="font-size:10pt" href="">Javascript</a> <a class="tag"
					style="font-size:14pt" href="">博客</a> <a class="tag"
					style="font-size:12pt" href="">从前车马很慢</a> <a class="tag"
					style="font-size:13pt" href="">一生只够爱一个人</a> <a class="tag"
					style="font-size:12pt" href="">车马邮件都慢</a> <a class="tag"
					style="font-size:11pt" href="">从前的锁也好看</a> <a class="tag"
					style="font-size:9pt" href="">钥匙精美有样子</a> <a class="tag"
					style="font-size:17pt" href="">Spring</a> <a class="tag" href=""
					style="font-size: 12px">springMVC</a> <a class="tag" href=""
					style="font-size: 21px">mysql</a> <a class="tag" href=""
					style="font-size: 13px">算法</a> <a class="tag" href=""
					style="font-size: 14px">数据结构</a> <a class="tag" href=""
					style="font-size: 15px">html</a> <a class="tag" href=""
					style="font-size: 16px">css</a>
			</div>
		</div>
	</div>
	</aside> </aside>
</body>
</html>

<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="js/tagcanvas.min.js"></script>
<script type="text/javascript" src="js/canvas2-tag.js"></script>
<script src="js/modernizr.js"></script>


<script>
	$(".taggg").mouseover(function() {
		$(this).css("border", "1px solid black");
		$(this).css("cursor", "pointer")
	})

	$(".taggg").mouseout(function() {
		$(this).css("border", "1px solid #cccccc");
	})
	
	function findarticle(obj)
	{
	location.href="/myblog/tags-article-1-"+$(obj).text()+".html";
	
	}
	
	var text=document.getElementsByClassName('log');
	for(var i=0;i<text.length;i++)
	{
	if(text[i].innerText.length>20)
	text[i].innerText=text[i].innerText.substr(0,15)+"......"
	}
	
</script>
