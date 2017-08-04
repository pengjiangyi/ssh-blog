
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


var photo = document.querySelectorAll(".photo");
	//产生不相同的6个随机数
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

		photo[i].src = "img/head" + num[i] + ".jpg";
			
	}



	function html2Escape(sHtml) {
		return sHtml.replace(/[<>&"]/g, function(c) {
			return {
				'<':'&lt;','>' : '&gt;',
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
						var id = $("#aid").val();
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
									url : rootPath
											+ "/index-article-detail-addcomments.ajax",
									type : "post",
									async : false,
									data : {
										mail : mail,
										username : username,
										cont : html2Escape(cont),
										id : id
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
												+ '<div class="comment-body"  >'
												+ '<div class="text"  style="word-break:break-all;">'
												+ '<p>'
												+ html2Escape(cont)
												+ '</p>'
												+ '</div>'
												+ '<p class="attribution">'
												+ ' by '
												+ '<a href="#non">'
												+ username
												+ '</a>'
												+ ' at '
												+ date
												+ '</p>'
												+ '</div>'
												+ '</article>';

										$("#sec").prepend(div);
				
										$("#commentsCount").text(parseInt($("#commentsCount").text())+1)
										$("input[type=reset]").trigger("click");
									},
									error : function(XMLHttpRequest,
											textStatus, errorThrown) {
										alert(XMLHttpRequest.status);
										alert(XMLHttpRequest.readyState);
										alert(textStatus);
									}
								});

					})
	$(".head-li").on("mouseover mouseout", function(event) {
		if (event.type == "mouseover") {
			//鼠标悬浮
			$(this).addClass("active")
		} else if (event.type == "mouseout") {
			//鼠标离开
			$(this).removeClass("active")
		}
	})
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
			
			









/*!
 * 仿百度打赏的博客打赏组件
 * Date: 2016-09-10 11:00
 * http://zhangge.net/5110.html
 * (c) 2013-2016 张戈博客保留所有权利.
 *
 * 给博客添加模仿百度打赏的打赏组件
 * 张戈博客基于百度打赏的原创功能，引用或转载请保留版权申明，谢谢合作！
 */
 

	var id = Date.now();
	
		document.writeln("<style id='STYLE_"+id+"'>@CHARSET \"UTF-8\";*{-webkit-tap-highlight-color:rgba(255,0,0,0)}.box-size{box-sizing:border-box;-moz-box-sizing:border-box;-webkit-box-sizing:border-box}.ds-hide{display:none}.ds-reward-stl{font-family:\"microsoft yahei\";text-align:center;background:#f1f1f1;padding:10px 0;color:#666;margin:20px auto;width:90%}#dsRewardBtn {padding: 0;margin: 0;background: #7ab951;;width: 50px;height: 50px;font-size: 16px;font-weight: 600;line-height: 43px;display: block;border: 4px solid #fff;border-radius: 40px;color: #FFF;}#dsRewardBtn span{display:inline-block;width:50px;height:50px;border-radius:100%;line-height:58px;color:#fff;font:400 25px/50px 'microsoft yahei';background:#FEC22C}#dsRewardBtn:hover{cursor:pointer}.ds-dialog{z-index:9999;width:100%;height:100%;position:fixed;top:0;left:0;border:1px solid #d9d9d9}.ds-dialog .ds-close-dialog{position:absolute;top:15px;right:20px;font:400 24px/24px Arial;width:20px;height:20px;text-align:center;padding:0;cursor:pointer;background:transparent;border:0;-webkit-appearance:none;font-weight:700;line-height:20px;opacity:.6;filter:alpha(opacity=20)}.ds-dialog .ds-close-dialog:hover{color:#000;text-decoration:none;cursor:pointer;opacity:.6;filter:alpha(opacity=40)}.ds-dialog-bg{position:absolute;opacity:.6;filter:alpha(opacity=30);background:#000;z-index:9999;left:0;top:0;width:100%;height:100%}.ds-dialog-content{font-family:'microsoft yahei';font-size:14px;background-color:#FFF;position:fixed;padding:0 20px;z-index:10000;overflow:hidden;border-radius:6px;-webkit-box-shadow:0 3px 7px rgba(0,0,0,.3);-moz-box-shadow:0 3px 7px rgba(0,0,0,.3);box-shadow:0 3px 7px rgba(0,0,0,.3);-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box}.ds-dialog-pc{width:390px;height:380px;top:50%;left:50%;margin:-190px 0 0 -195px}.ds-dialog-wx{width:90%;height:280px;top:50%;margin-top:-140px;margin-left:5%}.ds-dialog-content h5{text-align:left;font-size:15px;font-weight:700;margin:15px 0;color:#555}.ds-payment-way{text-align:left}.ds-payment-way label{cursor:pointer;font-weight:400;display:inline-block;font-size:14px;margin:0 15px 0 0;padding:0}.ds-payment-way input[type=radio]{vertical-align:middle;margin:-2px 5px 0 0}.ds-payment-img{margin:15px 0;text-align:center}p.ds-pay-info{font-size:15px;margin:0 0 10px}.ds-pay-money{font-size:14px;margin-top:10px}.ds-pay-money p{margin:0}.ds-pay-money .ds-pay-money-sum{margin-bottom:4px}.ds-payment-img img{margin:0 auto;width:185px;}.ds-payment-img #qrCode_1{display:none}.ds-payment-img .qrcode-border{margin:0 auto}.ds-payment-img .qrcode-tip{width:48.13px;position:relative;margin:0 auto;font-size:12px;font-weight:700;background:#fff;height:15px;line-height:15px;margin-top:-12px}#qrCode_0 .qrcode-tip{color:#3caf36}#qrCode_3 .qrcode-tip{color:#e10602}.ds-payment-img #qrCode_3{display:none}.ds-payment-img #qrCode_2{display:none}#qrCode_2 .qrcode-tip{color:#eb5f01}#qrCode_1 .qrcode-tip{color:#6699cc}.wx_qrcode_container{text-align:center}.wx_qrcode_container h2{font-size:17px}.wx_qrcode_container p{font-size:14px}.ds-reward-stl{text-align:left;background:#fff;padding:0;color:#666;margin:0;width:0}#dsRewardBtn span{position:absolute;left:115px;top:-7px;background:#7ab951;width:50px;height:50px;font-size:16px;font-weight:600;line-height:43px;border:4px solid #fff;border-radius:40px}.share-s a{margin-top:-25px} .ds-payment-img .qrcode-border{border-radius: 29.97px; width: 236.89px; height: 236.89px; padding: 18.05px; margin-top: 25.53px; } </style>");
	
	function write(){
	var content = "<div class=\"ds-dialog\" id='PAY_" + id + "'>" +
			"   <div class=\"ds-dialog-bg\" onclick=\"PaymentUtils.hide();\"></div>" +
			"   <div class=\"ds-dialog-content ds-dialog-pc \">" +
			"    <i class=\"ds-close-dialog\">&times;</i>" +
			"    <h5>选择打赏方式：</h5>" +
			"    <div class=\"ds-payment-way\">" +
			"     <label for=\"wechat\"><input type=\"radio\" id=\"wechat\" class=\"reward-radio\" value=\"0\" checked=\"checked\" name=\"reward-way\" />微信红包</label>" +
			"     <label for=\"qqqb\"><input type=\"radio\" id=\"qqqb\" class=\"reward-radio\" value=\"1\" name=\"reward-way\" />QQ钱包</label>" +
			"     <label for=\"alipay\"><input type=\"radio\" id=\"alipay\" class=\"reward-radio\" value=\"2\" name=\"reward-way\" />支付宝</label>" +
			"    </div>" +
			"    <div class=\"ds-payment-img\">" +
			"     <div class=\"qrcode-img qrCode_0\" id=\"qrCode_0\">" +
			"      <div class=\"qrcode-border box-size\" style=\"border: 9.02px solid rgb(60, 175, 54\">" +
			"       <img  class=\"qrcode-img qrCode_0\" id=\"qrCode_0\" src=\"img/wechat.jpg\" />" +
			"      </div>" +
			"      <p class=\"qrcode-tip\">打赏</p>" +
			"     </div>"

			+
			"     <div class=\"qrcode-img qrCode_1\" id=\"qrCode_1\">" +
			"      <div class=\"qrcode-border box-size\" style=\"border: 9.02px solid rgb(102, 153, 204\">" +
			"       <img  class=\"qrcode-img qrCode_1\" id=\"qrCode_1\" src=\"img/qqpay.png\" />" +
			"      </div>" +
			"      <p class=\"qrcode-tip\">打赏</p>" +
			"     </div>" +
			"     <div class=\"qrcode-img qrCode_2\" id=\"qrCode_2\">" +
			"      <div class=\"qrcode-border box-size\" style=\"border: 9.02px solid rgb(235, 95, 1\">" +
			"       <img  class=\"qrcode-img qrCode_2\" id=\"qrCode_2\" src=\"img/alipay.jpg\" />" +
			"      </div>" +
			"      <p class=\"qrcode-tip\">打赏</p>"

			+
			"    </div>" +
			"   </div>" +
			"  </div> ";
		$("body").append(content);
	}
$(function(){
	write();
	var $pay = $("#PAY_"+id).hide();
	$pay.find(".ds-payment-way").bind("click",function(){
                $pay.find(".qrcode-img").hide();
		$pay.find(".qrCode_"+$pay.find("input[name=reward-way]:checked").val()).show();
	  });
	 $pay.find(".ds-close-dialog").bind("click",function(){
		  $pay.hide();
	 });
  });
  var PaymentUtils = window['PaymentUtils']={};
  PaymentUtils.show=function(){
	  $("#PAY_"+id).show();
  }
  PaymentUtils.hide=function(){
	  $("#PAY_"+id).hide();
  }

	











		function jumpto(id){
		
    $("#"+id).animatescroll();
}


	function pre(id)
	{
	location="index-article-detail-"+id+".html";
	}
	
	
	function next(id)
	{
	location="index-article-detail-"+id+".html";
	}
	
	$(".topp").mouseover(function(){
	
	$(this).css("cursor","pointer")
	$(".topti").css("color","red")
	})
	
	
	$(".topp").mouseout(function(){
	$(".topti").css("color","#333333")
	})
	
	
	
	$(".downn").mouseover(function(){
	
	$(this).css("cursor","pointer")
	$(".downti").css("color","red")
	})
	
	
	$(".downn").mouseout(function(){
	$(".downti").css("color","#333333")
	})
	
	
	
	var timer;  
   
      $(window).scroll(function(){  
        clearInterval(timer);  
        var th=document.body.scrollTop;
        if(th>2400)
        {
        $(".test").css("display","block")
        }
        else{
        $(".test").css("display","none")
        }
        var topScroll=getScroll();  
        var topDiv="400px";  
        var top=topScroll+parseInt(topDiv);  
        timer=setInterval(function(){  
            //$(".test").css("top", top+"px");  
             $(".test").animate({"top":top},300);  
        },500)  
      })  
  
    function getScroll(){  
         var bodyTop = 0;    
         if (typeof window.pageYOffset != 'undefined') {    
             bodyTop = window.pageYOffset;    
         } else if (typeof document.compatMode != 'undefined' && document.compatMode != 'BackCompat') {    
             bodyTop = document.documentElement.scrollTop;    
         }    
         else if (typeof document.body != 'undefined') {    
             bodyTop = document.body.scrollTop;    
         }    
         return bodyTop  
    }  
    
    
    
    