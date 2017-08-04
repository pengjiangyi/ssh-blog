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
	photo[i].src=rootPath+"/img/head"+ num[i]+".jpg";
	}
	
	

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