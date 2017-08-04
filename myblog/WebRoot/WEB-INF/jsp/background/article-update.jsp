<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
        "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>完整demo</title>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/ueditor/ueditor.all.min.js"> </script>
    <!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
    <!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
    <script type="text/javascript" charset="utf-8" src="/pjy/background/lang/zh-cn/zh-cn.js"></script>
	<script src="js/jquery-3.1.1.min.js"></script>
    <style type="text/css">
        div{
            width:100%;
        }
   
}
    </style>
    
</head>
<body>
<form action="${pageContext.request.contextPath}/updateArticle.html" method="post">
<div>
<c:forEach items="${list}" var="list">
<div>
<div style="display: none" id="content">
	${list.content}
</div>

<input type="hidden" name="id" value="${list.id}">
<div style="margin-left: 5%">标题:<input type="text" style="width: 500px" name="title" id="title" value="${list.title}"></div>
<div style="margin-left: 5%">标签:<input type="text" style="width:400px" name="tags" id="tags" value="${list.tags.name}">
分类：<select  name="category" id="category" style="width: 100px" >
<c:forEach items="${list2}" var="cat">
<option value="${cat.name}">${cat.name}</option>
</c:forEach>
</select>
</div>
<div  style="margin-left: 5%">
图片链接:<input type="text" name="imgpath" value="${list.imgPath}" style="width: 600px">
</div>


</div>

<div style="margin-left: 5%">
    <script id="editor" type="text/plain" style="width:900px;height:500px;"></script>
</div>
<div style="margin-left: 5%;width: 900px;height: 50px">
<input type="submit"  id="btn" value="提交" style="float: right;width: 100px;height: 40px">
</div>
</c:forEach>
</div>
</form>

<script type="text/javascript">

    //实例化编辑器
    //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
    var ue = UE.getEditor('editor');
	
	     $(document).ready(function(){  
        var ue = UE.getEditor('editor');  
        var proinfo=document.getElementById("content").innerHTML;
          
        ue.ready(function() {//编辑器初始化完成再赋值  
            ue.setContent(proinfo);  //赋值给UEditor  
        });  
          
    });  
     


   
</script>
</body>
</html>