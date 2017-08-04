<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<!--[if lt IE 9]>
<script type="text/javascript" src="lib/html5shiv.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>
<![endif]-->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/h-ui.admin/css/style.css" />
<!--[if IE 6]>
<script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>资讯列表</title>
</head>
<body>
<nav class="breadcrumb">首页 <span class="c-gray en">&gt;</span> 文章管理 <span class="c-gray en">&gt;</span> 文章列表 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ></a></nav>
<div class="page-container">
	<div class="text-c">
	
			<form action="searchArticle-like.html" method="post">
			<button onclick="removeIframe()" class="btn btn-primary radius">关闭选项卡</button>
			<span class="select-box inline"> <select name="status"
				class="select">
					
					<option value="-1">全部分类</option>
					<c:forEach items="${list2}" var="list2">
					<option value="${list2.id}">${list2.name}</option>
					</c:forEach>
			</select> </span> 日期范围： <input type="text"
				onfocus="WdatePicker({ maxDate:'#F{$dp.$D(\'logmax\')||\'%y-%M-%d\'}' })"
				id="logmin" class="input-text Wdate" style="width:120px;"   name="logmin"> -
			<input type="text"
				onfocus="WdatePicker({ minDate:'#F{$dp.$D(\'logmin\')}',maxDate:'%y-%M-%d' })"
				id="logmax" class="input-text Wdate" style="width:120px;"  name="logmax"> <input
				type="text" name="article" id="" placeholder="文章名称或者关键内容" style="width:250px"
				class="input-text">
			<button name="" id="" class="btn btn-success" type="submit">
				 搜文章
			</button>
			</form>
		</div>
		<div class="cl pd-5 bg-1 bk-gray mt-20">
			<span class="l"><a href="javascript:;" onclick="datadel()"
				class="btn btn-danger radius">
					批量删除</a> <a class="btn btn-primary radius" data-title="发表文章"
				data-href="" 
				href="${pageContext.request.contextPath}/selectArticle.html"> 发表文章</a>
			</span> 
		</div>


	<div class="mt-20">
		<table class="table table-border table-bordered table-bg table-hover table-sort">
			<thead>
				<tr class="text-c">
					<th width="25"><input type="checkbox" name="" value=""></th>
					<th width="80">ID</th>
					<th>文章名称</th>
					<th width="80">文章分类</th>
					<th width="80">文章标签</th>
					<th width="160">发表时间</th>
					<th width="160">最后修改时间</th>
					<th width="60">状态</th>
					<th width="120">操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="art">
				<tr class="text-c">
					<td><input type="checkbox" value="" name=""></td>
					<td>${art.id }</td>
					<td ><u style="cursor:pointer" class="text-primary"
								onClick="article_find('查看','',${art.id})" title="查看">${art.title}</u></td>
					<td>${art.categories.name}</td>
					<td>${art.tags.name}</td>
					<td>${art.createTime}</td>
					<td>${art.updateTime}</td>
					<td class="td-status"><span class="label label-success radius">正在使用</span></td>
					<td class="f-14 td-manage"> <a style="text-decoration:none" class="ml-5" onClick="article_edit('文章编辑','','${art.id}')" href="javascript:;" title="编辑">编辑
					<a style="text-decoration:none" class="ml-5"
								onClick="article_del(this,${art.id})" href="javascript:;"
								title="删除">删除
							</a
					
					</td>
				</tr>
				
				</c:forEach>
				
			</tbody>
		</table>
	</div>
</div>
<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="${pageContext.request.contextPath}/lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath}/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/h-ui/js/H-ui.min.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath}/static/h-ui.admin/js/H-ui.admin.js"></script>
<!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="${pageContext.request.contextPath}/lib/My97DatePicker/4.8/WdatePicker.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath}/lib/datatables/1.10.0/jquery.dataTables.min.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath}/lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript">





	function getRootPath() {
		// http://localhost:8083/uimcardprj/share/meun.jsp
		var curWwwPath = window.document.location.href;
		// uimcardprj/share/meun.jsp
		var pathName = window.document.location.pathname;
		var pos = curWwwPath.indexOf(pathName);
		// http://localhost:8083
		var localhostPaht = curWwwPath.substring(0, pos);
		// uimcardprj
		var projectName = pathName.substring(0,
				pathName.substr(1).indexOf('/') + 1);
		if (projectName == "/pc")
			projectName = "";

		return (localhostPaht + projectName);
	}
	var rootPath = getRootPath()


$('.table-sort').dataTable({
	"aaSorting": [[ 1, "desc" ]],//默认第几个排序
	"bStateSave": true,//状态保存
	"aoColumnDefs": [
	  //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
	  {"orderable":false,"aTargets":[0,8]}// 不参与排序的列
	]
});



/*资讯-添加*/
function article_add(title,url,w,h){
	var index = layer.open({
		type: 2,
		title: title,
		content: url
	});
	layer.full(index);
}
function article_del(obj,id){
	layer.confirm('确认要删除吗？',function(index){
		$.ajax({
			type: 'POST',
			url: rootPath+'/deleteArticleById.html',
			data:{
			ID:id
			},
			success: function(data){
			if(data=="success")
			{
				$(obj).parents("tr").remove();
				layer.msg('已删除!',{icon:1,time:1000});
				}
				else{
				layer.msg('存在二级回复!',{icon:0,time:1000});
				return
				}
			},
			error:function(data) {
				console.log(data.msg);
			},
		});		
	});
}



/*资讯-查看*/
function article_find(title,url,id,w,h){
	location.href="/myblog/index-article-detail-"+id+".html";
}
//编辑
function article_edit(title,url,id,w,h){
	var index = layer.open({
		type: 2,
		title: title,
		content: "/myblog/updateArticle-"+id+".html"
	});
	layer.full(index);
}


</script> 
</body>
</html>