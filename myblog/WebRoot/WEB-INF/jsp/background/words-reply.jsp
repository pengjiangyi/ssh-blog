<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

  
  <body>
  
  <form id="form1">
  <table>
  <tr>
  <td>回复内容:</td>
  <td>
  <textarea rows="6" cols="" id="name"  name="name"></textarea>
  <input type="hidden"  value="${id}" id="wordsid"> 
   <input type="hidden"  value="${mail}" id="mail"> 
  </td>
  </tr>
  <tr>
  <td></td>
  <td><input id="btn" onclick="add()"  type="button" value="提交" style="float: right;"></td>
  </tr>
  </table>
  
  
  </form>
  
  
  
    
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
		function getRootPath() {
	// http://localhost:8083/uimcardprj/share/meun.jsp
	var curWwwPath = window.document.location.href;
	// uimcardprj/share/meun.jsp
	var pathName = window.document.location.pathname;
	var pos = curWwwPath.indexOf(pathName);
	// http://localhost:8083
	var localhostPaht = curWwwPath.substring(0, pos);
	// uimcardprj
	var projectName = pathName
			.substring(0, pathName.substr(1).indexOf('/') + 1);
	if (projectName == "/pc")
		projectName = "";

	return (localhostPaht + projectName);
}
var rootPath = getRootPath();



		




	function add()
	{
	var text=document.getElementById("name").value;
	var id=document.getElementById("wordsid").value;
	var mail=document.getElementById("mail").value;
	$.ajax({
				url : rootPath+"/addWordsReply.ajax",
				type : "post",
				data : {
				text:text,
				ID:id,
				mail:mail
				},
				success : function(data) {
					if ("success" == data) {
						layer.confirm('添加成功！', {
							btn : [ '确定' ]
						// 按钮
						}, function() {
							// window.parent.location.reload();//刷新列表
							parent.window.location.href = rootPath
									+ "/findWords.html";
							var index = parent.layer.getFrameIndex(window.name);/* 获取索引窗口 */
							parent.layer.close(index);/* 关闭该索引窗口 */
							// parent.location.replace(parent.location.href);
						});

					} else {
						layer.msg(data);
					}

				},error: function(XMLHttpRequest, textStatus, errorThrown) {
                        alert(XMLHttpRequest.status);
                        alert(XMLHttpRequest.readyState);
                        alert(textStatus);
                    }
			});
		 
	
	
	
	
	
	
	}



</script>
