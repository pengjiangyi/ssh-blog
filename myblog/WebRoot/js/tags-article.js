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
	
	var totalPage = $("#pagecount").html();
var totalRecords = $("#count").html();
var tagsname=$("#tagsname").html();
var pageNo = $("#page").html(); //这里设置参数名(柯 乐 义 注 释)
if (!pageNo) {
pageNo = 1;
}
//生成分页控件 根据分页的形式在这里设置
kkpager.init({
pno: pageNo,
//总页码
total: totalPage,
//总数据条数
totalRecords: totalRecords,
//链接前部
hrefFormer: rootPath+'/tags-article-',
//链接尾部
hrefLatter: '.html',
getLink: function (n) {
return this.hrefFormer+n+"-"+tagsname+this.hrefLatter; //参数名跟上面相同
}
});
kkpager.generPageHtml();











var photo=document.querySelectorAll(".photo");
	//产生不相同的6个随机数
	 var num = new Array();
        for(var i = 0; i < 6; i++){
            var val =  Math.ceil(Math.random() * 10);
            var isEqu = false;
            for(var idx in num){
                if(num[idx] == val){isEqu = true; break;}
            }
            if(isEqu)
                i--;
            else
                num[num.length] = val;
        }
	for(var i=0;i<photo.length;i++)
	{
	photo[i].src="img/head"+ num[i]+".jpg";
	}
	/* var size = 2;
	var page=1;
	var tt;
	
	function y(page)
	{

	}
	
	function x(page){
	$
								.ajax({
									type : "post",
									url : "${pageContext.request.contextPath}/user.do?p=selectAllArticle",
									data:{
									PAGE:page
									},
									success : function(data) {
										var data = eval('(' + data + ')');
										var pageCount = (data.length % size == 0) ? (data.length / size)
												: (data.length / size + 1);
										;
										var ul = document
												.getElementById("fenye");

										for ( var k = 1; k <= pageCount; k++) {
											var li = document
													.createElement('li');
											li.innerHTML = '<a >' + k
													+ '</a>';
											li.className="num";
											li.onclick=function(){
											y(this.innerText);
											}
											ul.appendChild(li);
										}
										
										
										
									

										for ( var i = 0; i < data.length; i++) {
											var div = document
													.createElement('div');
											div.innerHTML = '<div id="article-list" style="margin-top:10px">'
													+ '<div id="loading">'
													+ '</div>'
													+ '<div class="article" style="border: 1px SOLID #DDDDDD; height: 340PX; background-color: #ffffff;">'
													+

													'<span class="label label-info" style="margin-top:15px;margin-left: 10px; display: inline-block; height: 25px; width: 120px;text-align: center; line-height: 25px;">'
													+ data[i].categories.name
													+ '</span>'
													+ '<span style="font-size: 20px; display: inline-block;margin-left: 10px;">'
													+ data[i].title
													+ '</span>'
													+

													'<br/>'
													+ '<div style="margin-top: 5px;">'
													+ '<span style="margin-left: 10px;">'
													+ data[i].createTime
													+ '</span>'
													+ '<span style="margin-left: 10px;"> '
													+ '浏览次数(100)'
													+ ' </span>'
													+ '<span style="margin-left: 10px;">'
													+ '评论次数(200)'
													+ '</span>'
													+

													'</div>'
													+ '<div style="height: 200px; margin-left: 10px; margin-top: 10px; background-color: #2AABD2;" class="cc">'
													+ ''
													+ '</div>'
													+ '<div style="margin-top: 10px;"  class="tags">'
													+
													<span class="labe label-info" style="display: inline-block; margin-left: 10px; width: 15%; text-align: center;">java</span>
													<span class="labe label-info" style="display: inline-block; margin-left: 10px; width: 15%; text-align: center;">jsp</span>
													<span class="labe label-info" style="display: inline-block; margin-left: 10px; width: 15%; text-align: center;">mysql</span>
													<span class="labe label-info" style="display: inline-block; margin-left: 10px; width: 15%; text-align: center;">javaee</span>
													'</div>'
													+ '<div style="float:right;width:120px;height:35px;margin-right:40px;margin-top:-20px"><input type="button" style="width:80px;" value="阅读全文"></div>'
													+

													'</div>' +

													'</div>';
											var list = document
													.getElementById("art");
											list.appendChild(div);

											var cc = document
													.getElementsByClassName("cc");
											var text = data[i].content;
											cc[i].innerHTML = text;
											var tags = document
													.getElementsByClassName("tags");
											var strs = new Array(); //定义一数组 
											strs = data[i].tags.name.split(","); //字符分割 

											for ( var j = 0; j < strs.length; j++) {
												var span = document
														.createElement('span');
												span.innerHTML = '<span class="labe label-info" style="display: inline-block; margin-left: 10px; width: 15%; text-align: center;">'
														+ strs[j] + '</span>';
												tags[i].appendChild(span);
											}

										}

									}
								});
	}
	
	
	$(document).ready(function() {
	x();
	})

*/
	
	$(".head-li").on("mouseover mouseout", function(event) {
		if (event.type == "mouseover") {
			//鼠标悬浮
			$(this).addClass("active")
		} else if (event.type == "mouseout") {
			//鼠标离开
			$(this).removeClass("active")
		}
	})
	function readAll(id)
	{
	location.href=rootPath+"/index-article-detail-"+id+".html";
	}
	$(".btn-primary").each(
			function() {
				$(this)
						.css(
								'background-color',
								'#'
										+ Math.floor(16777216 * Math.random())
												.toString(16))
				$(this).css("border", "none");
			})