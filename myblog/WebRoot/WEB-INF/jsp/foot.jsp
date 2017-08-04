<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'foot.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <div class="container-fluid" style="background-color: #f8f8f8;font-size: 14px;height: 45px;line-height: 45px">
    <div class="row">
    <div class="col-md-5" style="text-align: center;">&copy; CopyRight© 2016-2017版权所有 ICP备案号：湘ICP备17014576号  </div>
    <div class="col-md-2" style="text-align: center;">商务合作QQ:741506070</div>
	<div class="col-md-5" style="text-align: center;">投稿邮箱:java@pengjiangyi.com</div>
    </div>
    </div>
  </body>
</html>
