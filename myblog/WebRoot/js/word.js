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


/*分页查询*/
var totalPage = $("#pagecount").html();
var totalRecords = $("#count").html();
var pageNo = $("#page").html(); // 这里设置参数名(柯 乐 义 注 释)
if (!pageNo) {
	pageNo = 1;
}
// 生成分页控件 根据分页的形式在这里设置
kkpager.init({
	pno : pageNo,
	// 总页码
	total : totalPage,
	// 总数据条数
	totalRecords : totalRecords,
	// 链接前部
	hrefFormer : rootPath+'/words-',
	// 链接尾部
	hrefLatter : '.html',
	getLink : function(n) {
		return this.hrefFormer + n + this.hrefLatter; // 参数名跟上面相同
	}
});
kkpager.generPageHtml();





var photo = document.querySelectorAll(".photo");
var photo2 = document.querySelectorAll(".com-photo");
// 产生不相同的6个随机数
var num = new Array();
for ( var i = 0; i < 16; i++) {
	var val = Math.ceil(Math.random() * 16);
	var isEqu = false;
	for ( var idx in num) {
		if (num[idx] == val) {
			isEqu = true;
			break;
		}
	}
	if (isEqu)
		i--;
	else
		num[num.length] = val;
}
for ( var i = 0; i < photo.length; i++) {
	photo[i].src = rootPath+"/img/head" + num[i] + ".jpg";
}

for ( var i = 0; i < photo2.length; i++) {
	photo2[i].src = rootPath+"/img/head" + num[i] + ".jpg";
}



function html2Escape(sHtml) {
	return sHtml.replace(/[<>&"]/g, function(c) {
		return {
			'<' : '&lt;',
			'>' : '&gt;',
			'&' : '&amp;',
			'"' : '&quot;'
		}[c];
	});
}

$("#bt1")
		.click(
				function() {
					var mail = $("#mail").val();
					var username = $("#username").val();
					var cont = $("#cont").val();
					var myreg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
					if (username.length == 0) {
						layer.msg("请输入你的名字!");
						return;
					}
					if (mail.length == 0) {
						layer.msg("请输入你的邮箱!");
						return;
					}
					if (!myreg.test(mail)) {
						layer.msg("邮箱格式不正确");
						return;
					}
					if (cont.length == 0) {
						layer.msg("请填写评论!");
						return;
					}

					$
							.ajax({
								url : rootPath + "/addWords.ajax",
								type : "post",
								async : false,
								data : {
									mail : mail,
									username : username,
									cont : html2Escape(cont)

								},
								success : function(data) {
									var time = new Date();
									var year = time.getFullYear();
									var mon = time.getMonth() + 1;
									var da = time.getDate();
									var h = time.getHours();
									var m = time.getMinutes();
									var s = time.getSeconds();
									if (mon < 10)
										mon = "0" + mon;
									if (da < 10)
										da = "0" + da;
									if (h < 10)
										h = "0" + h;
									if (m < 10)
										m = "0" + m;
									if (s < 10)
										s = "0" + s;
									var date = year + "-" + mon + "-" + da
											+ "- " + h + ":" + m + ":" + s;
									var div = document.createElement('div');
									div.innerHTML = '<article class="comment">'
											+ '<a class="comment-img" href="">'
											+ '<img src="img/head1.jpg" alt="" width="50" height="50">'
											+ '</a>'
											+ '<div class="comment-body">'
											+ '<div class="text" style="word-break:break-all;">' + '<p>'
											+ html2Escape(cont) + '</p>'
											+ '</div>'
											+ '<p class="attribution">'
											+ ' by ' + '<a href="#non">'
											+ username + '</a>' + ' at ' + date
											+ '</p>' + '</div>' + '</article>';

									$("#sec").prepend(div);

									$("input[type=reset]").trigger("click");
								},
								error : function(XMLHttpRequest, textStatus,
										errorThrown) {
									alert(XMLHttpRequest.status);
									alert(XMLHttpRequest.readyState);
									alert(textStatus);
								}
							});

				})

$(".head-li").on("mouseover mouseout", function(event) {
	if (event.type == "mouseover") {
		// 鼠标悬浮
		$(this).addClass("active")
	} else if (event.type == "mouseout") {
		// 鼠标离开
		$(this).removeClass("active")
	}
})
$(".btn-primary").each(
		function() {
			$(this).css('background-color',
					'#' + Math.floor(16777216 * Math.random()).toString(16))
			$(this).css("border", "none");
		})
