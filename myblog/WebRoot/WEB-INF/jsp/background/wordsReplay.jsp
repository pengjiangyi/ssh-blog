<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<!--[if lt IE 9]>
<script type="text/javascript" src="lib/html5shiv.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>
<![endif]-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/static/h-ui.admin/skin/default/skin.css"
	id="skin" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/static/h-ui.admin/css/style.css" />
<!--[if IE 6]>
<script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>资讯列表</title>
</head>
<body>
	<nav class="breadcrumb">
		<i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span>
		资讯管理 <span class="c-gray en">&gt;</span> 资讯列表 <a
			class="btn btn-success radius r"
			style="line-height:1.6em;margin-top:3px"
			href="javascript:location.replace(location.href);" title="刷新"><i
			class="Hui-iconfont">&#xe68f;</i>
		</a>
	</nav>
	<div class="page-container">
		<div class="text-c">
			<button onclick="removeIframe()" class="btn btn-primary radius">关闭选项卡</button>
			<span class="select-box inline"> <select name=""
				class="select">
					<option value="0">全部分类</option>
					<option value="1">分类一</option>
					<option value="2">分类二</option>
			</select> </span> 日期范围： <input type="text"
				onfocus="WdatePicker({ maxDate:'#F{$dp.$D(\'logmax\')||\'%y-%M-%d\'}' })"
				id="logmin" class="input-text Wdate" style="width:120px;"> -
			<input type="text"
				onfocus="WdatePicker({ minDate:'#F{$dp.$D(\'logmin\')}',maxDate:'%y-%M-%d' })"
				id="logmax" class="input-text Wdate" style="width:120px;"> <input
				type="text" name="" id="" placeholder=" 资讯名称" style="width:250px"
				class="input-text">
			<button name="" id="" class="btn btn-success" type="submit">
				<i class="Hui-iconfont">&#xe665;</i> 搜资讯
			</button>
		</div>
		<div class="cl pd-5 bg-1 bk-gray mt-20">
			<span class="l"><a href="javascript:;" onclick="datadel()"
				class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i>
					批量删除</a> <a class="btn btn-primary radius" data-title="添加资讯"
				data-href="article-add.html" onclick="Hui_admin_tab(this)"
				href="javascript:;"><i class="Hui-iconfont">&#xe600;</i> 添加资讯</a>
			</span> <span class="r">共有数据：<strong>54</strong> 条</span>
		</div>
		<div class="mt-20">
			<table
				class="table table-border table-bordered table-bg table-hover table-sort">
				<thead>
					<tr class="text-c">
						<th width="25"><input type="checkbox" name="" value="">
						</th>
						<th width="80">ID</th>
						<th>回复ID</th>
						<th width="160">回复用户名</th>
						<th width="160">回复邮箱</th>
						<th width="160">回复时间</th>
					
						<th>回复内容</th>
						<th width="60">状态</th>
						<th width="120">操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="words">
						<tr class="text-c">
							<td><input type="checkbox" value="" name="wordbox">
							</td>
							<td>${words.id}</td>
							<td class="x">${words.words.id}</td>
							<td>${words.username}</td>
							<td>741506070@qq.com</td>
							<td>${words.time}</td>
							<td>${words.text}</td>
							<td class="td-status"></td>
							<td class="f-14 td-manage"> <a style="text-decoration:none" class="ml-5"
								onClick="article_edit('资讯编辑','${words.text}','${words.id}')"
								href="javascript:;" title="编辑"><i class="Hui-iconfont">&#xe6df;</i>
							</a> <a style="text-decoration:none" class="ml-5"
								onClick="article_del(this,${words.id})" href="javascript:;"
								title="删除"><i class="Hui-iconfont">&#xe6e2;</i>
							</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<!--_footer 作为公共模版分离出去-->
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

	function datadel()
	{
	var list=[];
	var list2=[];
	 $.each($('input[name=wordbox]:checked'),function(){
                list.push($(this).parent().next().text());
                list2.push($(this).parent().next().next().text())
                //alert($(this).parent().)
            });
	if(list.length==0)
	{
	layer.alert("请先选中");
	return;
	}
	else{
	layer.confirm('确认要删除吗？',function(index){
	$.ajax({
			type: 'POST',
			url: rootPath+'/deleteWordsReplayALL.ajax',
			data:{
			list:list,
			list2:list2
			},
			traditional:true,
			success: function(data){
			location.reload();
			},
			error:function(data) {
				console.log(data.msg);
			},
		});		
	
	})
	}
	
	}





/*留言回复-删除*/
function article_del(obj,id){

	var  wordid=$(obj).parents("td").prev().prev().prev().prev().prev().prev().html();
	

	layer.confirm('确认要删除吗？',function(index){
		$.ajax({
			type: 'POST',
			url: rootPath+'/deleteWordsReplayById.ajax',
			data:{
			ID:id,
			Wordid:wordid
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


/* 留言回复 */
function article_edit(obj,text,id){
		layer.open({
				title : "回复内容修改",
				move : [ '.xubox_title', false ],//设置不可被拖动
				type : 2,
				area : [ "300px", "200px" ],
				content : "/myblog/updateWordsReplay-"+id+"-"+text+".html"
			});
		
		


	/* $(obj).parents("tr").find(".td-status").html('<span class="label label-default radius">已回复</span>');
	layer.msg('已回复!', {icon: 1,time:2000}); */
}
</script>
</body>
</html>