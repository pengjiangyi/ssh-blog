<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
        "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>完整demo</title>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />

<!--[if lt IE 9]>
<script type="text/javascript" src="lib/html5shiv.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>
<![endif]-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/static/h-ui.admin/skin/default/skin.css"
	id="skin" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/static/h-ui.admin/css/style.css" />
<!--[if IE 6]>
<script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->


<script type="text/javascript" charset="utf-8"
	src="${pageContext.request.contextPath}/ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8"
	src="${pageContext.request.contextPath}/ueditor/ueditor.all.min.js">
	
</script>
<!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
<!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
<script type="text/javascript" charset="utf-8"
	src="${pageContext.request.contextPath}/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/ueditor/third-party/SyntaxHighlighter/shCore.js"></script>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/ueditor/third-party/SyntaxHighlighter/shCoreDefault.css">

<style type="text/css">
div {
	width: 100%;
}

.file {
	position: relative;
	display: inline-block;
	background: #D0EEFF;
	border: 1px solid #99D3F5;
	border-radius: 4px;
	padding: 4px 12px;
	overflow: hidden;
	color: #1E88C7;
	text-decoration: none;
	text-indent: 0;
	line-height: 20px;
}

.file input {
	position: absolute;
	overflow: hidden;
	right: 0;
	top: 0px;
	opacity: 0;
}

.file:hover {
	background: #AADFFD;
	border-color: #78C3F3;
	color: #004974;
	text-decoration: none;
}
</style>

</head>
<body>

	<form action="${pageContext.request.contextPath}/uploadArticle.html"
		method="post" enctype="multipart/form-data">
	<div style="width: 80%;margin-left: 5%">
		<table align="center" style="margin-top: 20px" class="ta">
			<tr>
				<td align="center" style="border:1px solid #a8a8a8;  width: 10%">标题：</td>
				<td><input type="text" name="title" id="title" placeholder="请填写文章标题"
					class="input-text">
				</td>
			</tr>
			<tr>
				<td align="center" style="border:1px solid #a8a8a8;  width: 10%">标签：</td>
				<td><input type="text" name= "tags" id="tags" placeholder="请填写文章标签"
					class="input-text"></td>
			</tr>
			<tr>
				<td align="center" style="border:1px solid #a8a8a8;  width: 10%">分类：</td>
				<td><span class="select-box inline"> <select
						name="category" id="category" class="select">
							<c:forEach items="${list}" var="cat">
								<option value="${cat.name}">${cat.name}</option>
							</c:forEach>
					</select> </span>
				</td>
			</tr>
			<tr>
			<tr>
				<td align="center" style="border:1px solid #a8a8a8;  width: 10%">图片：</td>
				<td><input type="text"  placeholder="请上传高度为250px的图片"   class="input-text showFileName">
					<div class="fileerrorTip"></div> <a href="javascript:;"
					class="file">选择文件 <input type="file" name="file" id="file">
				</a></td>
			</tr>
			<tr>
				<td align="center" style="border:1px solid #a8a8a8;  width: 10%">内容：</td>
				<td><script id="editor" type="text/plain"
						style="width:100%;height:500px;"></script>
				</td>
			</tr>
			<tr>
			<td></td>
			<td>
			<input type="submit" id="btn" value="提交"
				style="float: right;width: 100px;height: 40px">
			<td>
			</tr>
			
			



		</table>
	</div>
</form>





	<script type="text/javascript">
		//实例化编辑器
		//建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
		var ue = UE.getEditor('editor');
		$(function() {
			SyntaxHighlighter.all();
		});
	</script>
</body>
</html>
<!--_footer 作为公共模版分离出去-->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/lib/layer/2.4/layer.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/h-ui.admin/js/H-ui.admin.js"></script>
<!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/lib/My97DatePicker/4.8/WdatePicker.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/lib/laypage/1.2/laypage.js"></script>

<script>
	$(".file").on("change", "input[type='file']", function() {

		var filePath = $(this).val();
		if (filePath.indexOf("jpg") != -1 || filePath.indexOf("png") != -1) {
			$(".fileerrorTip").html("").hide();
			var arr = filePath.split('\\');
			var fileName = arr[arr.length - 1];
			$(".showFileName").val(fileName);
		} else {
			$(".showFileName").val("");
			$(".fileerrorTip").html("您未上传文件，或者您上传文件类型有误！").show();
			return false
		}
	})
</script>