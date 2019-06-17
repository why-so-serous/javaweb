<%@ page contentType ="text/html; charset=utf-8" session="true" language="java" import="java.lang.*,java.util.*,java.io.*,java.net.*"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="zh-CN">
	<head>
	    <meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="description" content="">
	    <meta name="author" content="">
		<title>Demo App</title>
		<!-- Bootstrap core CSS -->
	    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

	    <!-- Custom styles for this template -->
	    <link href="css/signin.css" rel="stylesheet">
		<link href="css/sticky-footer.css" rel="stylesheet">
	   <![endif]-->
	</head>

	<script>
	!(function(window, document) {
		function GVerify(options) { //创建一个图形验证码对象，接收options对象为参数
			this.options = { //默认options参数值
				id: "", //容器Id
				canvasId: "verifyCanvas", //canvas的ID
				width: "300", //默认canvas宽度
				height: "45", //默认canvas高度
				type: "blend", //图形验证码默认类型blend:数字字母混合类型、number:纯数字、letter:纯字母
				code: ""
			}

			if(Object.prototype.toString.call(options) == "[object Object]"){//判断传入参数类型
				for(var i in options) { //根据传入的参数，修改默认参数值
					this.options[i] = options[i];
				}
			}else{
				this.options.id = options;
			}

			this.options.numArr = "0,1,2,3,4,5,6,7,8,9".split(",");
			this.options.letterArr = getAllLetter();

			this._init();
			this.refresh();
		}

		GVerify.prototype = {
			/**版本号**/
			version: '1.0.0',

			/**初始化方法**/
			_init: function() {
				var con = document.getElementById(this.options.id);
				var canvas = document.createElement("canvas");
				this.options.width = con.offsetWidth > 0 ? con.offsetWidth : "300";
				this.options.height = con.offsetHeight > 0 ? con.offsetHeight : "45";
				canvas.id = this.options.canvasId;
				canvas.width = this.options.width;
				canvas.height = this.options.height;
				canvas.style.cursor = "pointer";
				canvas.innerHTML = "您的浏览器版本不支持canvas";
				con.appendChild(canvas);
				var parent = this;
				canvas.onclick = function(){
					parent.refresh();
				}
			},

			/**生成验证码**/
			refresh: function() {
				this.options.code = "";
				var canvas = document.getElementById(this.options.canvasId);
				if(canvas.getContext) {
					var ctx = canvas.getContext('2d');
				}else{
					return;
				}

				ctx.textBaseline = "middle";

				ctx.fillStyle = randomColor(180, 240);
				ctx.fillRect(0, 0, this.options.width, this.options.height);

				if(this.options.type == "blend") { //判断验证码类型
					var txtArr = this.options.numArr.concat(this.options.letterArr);
				} else if(this.options.type == "number") {
					var txtArr = this.options.numArr;
				} else {
					var txtArr = this.options.letterArr;
				}

				for(var i = 1; i <= 4; i++) {
					var txt = txtArr[randomNum(0, txtArr.length)];
					this.options.code += txt;
					ctx.font = randomNum(this.options.height/2, this.options.height) + 'px SimHei'; //随机生成字体大小
					ctx.fillStyle = randomColor(50, 160); //随机生成字体颜色        
					ctx.shadowOffsetX = randomNum(-3, 3);
					ctx.shadowOffsetY = randomNum(-3, 3);
					ctx.shadowBlur = randomNum(-3, 3);
					ctx.shadowColor = "rgba(0, 0, 0, 0.3)";
					var x = this.options.width / 5 * i;
					var y = this.options.height / 2;
					var deg = randomNum(-30, 30);
					/**设置旋转角度和坐标原点**/
					ctx.translate(x, y);
					ctx.rotate(deg * Math.PI / 180);
					ctx.fillText(txt, 0, 0);
					/**恢复旋转角度和坐标原点**/
					ctx.rotate(-deg * Math.PI / 180);
					ctx.translate(-x, -y);
				}
				/**绘制干扰线**/
				for(var i = 0; i < 4; i++) {
					ctx.strokeStyle = randomColor(40, 180);
					ctx.beginPath();
					ctx.moveTo(randomNum(0, this.options.width), randomNum(0, this.options.height));
					ctx.lineTo(randomNum(0, this.options.width), randomNum(0, this.options.height));
					ctx.stroke();
				}
				/**绘制干扰点**/
				for(var i = 0; i < this.options.width/4; i++) {
					ctx.fillStyle = randomColor(0, 255);
					ctx.beginPath();
					ctx.arc(randomNum(0, this.options.width), randomNum(0, this.options.height), 1, 0, 2 * Math.PI);
					ctx.fill();
				}
			},

			/**验证验证码**/
			validate: function(code){
				var code = code.toLowerCase();
				var v_code = this.options.code.toLowerCase();
				console.log(v_code);
				if(code == v_code){
					return true;
				}else{
					this.refresh();
					return false;
				}
			}
		}
		/**生成字母数组**/
		function getAllLetter() {
			var letterStr = "a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z,A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z";
			return letterStr.split(",");
		}
		/**生成一个随机数**/
		function randomNum(min, max) {
			return Math.floor(Math.random() * (max - min) + min);
		}
		/**生成一个随机色**/
		function randomColor(min, max) {
			var r = randomNum(min, max);
			var g = randomNum(min, max);
			var b = randomNum(min, max);
			return "rgb(" + r + "," + g + "," + b + ")";
		}
		window.GVerify = GVerify;
	})(window, document);
	</script>


	<body style="background:url(./icon/22.jpg);background-repeat:no-repeat;background-attachment:fixed;background-size:cover;">
		<!--center-->
		<div class="container">
			<form class="form-signin" action="login" method="post">
				<h2 class="form-signin-heading">你好,世界</h2>
				<label for="inputEmail" class="sr-only">用户名</label>
     		    <input type="text" name="user" class="form-control" placeholder="用户名" required autofocus>
			    <label for="inputPassword" class="sr-only">密码</label>
				<input type="password" name="passwd" class="form-control" placeholder="密码" required>
				
				
				<input class="form-control" type="text" id="verification" placeholder="验证码" required autofocus>
				<%--<div style="border-radius:5em;">	--%>
				<div>
					<span id="v_container" style="width: 300px;height: 60px;margin-top:6px;border-radius:4em;"></span> 				
				</div>
				


				<div class="checkbox">
					<label>
						<input type="checkbox" value="remember-me"> 记住我
					</label>
				</div>
				<button class="btn btn-lg btn-primary btn-block" type="submit" id="submit">登录</button>
				<%-- <a href="./register.jsp" class="btn btn-lg btn-primary btn-block" >注册</a> --%>
				


				<p style="text-align:center;font-weight=normal">温馨提示:测试效果的账号名为xyq,密码为123456<p>

				<%
					String ip = request.getHeader("x-forwarded-for");
					if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)){
						ip = request.getHeader("Proxy-Client-IP");
					}
					if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)){
						ip = request.getHeader("WL-Proxy-Client-IP");
					}
					if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)){  
						ip = request.getHeader("X-Real-IP");
					}
					if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)){
						ip = request.getRemoteAddr();
					}
				%>


	　			<%
					URL url = new URL("http://ip.taobao.com/service/getIpInfo.php?ip=" + ip);
					HttpURLConnection urlConn = (HttpURLConnection)url.openConnection();
					InputStream res = urlConn.getInputStream();
					Scanner scanner = new Scanner(res);
					String urlContent = "";
					while (scanner.hasNextLine()) {
						urlContent += (String)scanner.nextLine();
					}	
			 

					String[] temp = urlContent.split(","); 
					String region = (temp[5].split(":"))[1].replaceAll("\"", ""); 
					String country = ""; 
					String area = ""; 
					String city = ""; 
					String county = ""; 
					String isp = ""; 
					for (int i = 1; i <= temp.length; i++) { 
						switch (i) { 
							case 1: 
								country = (temp[i+1].split(":"))[1].replaceAll("\"", ""); 
							break;
							case 3: 
								area = (temp[i].split(":"))[1].replaceAll("\"", ""); 
							break;
							case 4: 
							    region = (temp[i].split(":"))[1].replaceAll("\"", "");    
							break;  
							case 5: 
						    	city = (temp[i].split(":"))[1].replaceAll("\"", ""); 
							break;  
							case 6: 
							    county = (temp[i].split(":"))[1].replaceAll("\"", ""); 
							break; 
							case 7: 
							    isp = (temp[i].split(":"))[1].replaceAll("\"", ""); 
							break; 
						}
					}
				%> 
				<%
					String aip = InetAddress.getLocalHost().getHostAddress();
				%> 
				<div style="text-align:center">
				<p class="lead">                                                     
         	       <%
            	            out.print("Welcome "+ip+"<br>");
							out.println(country+"|"+region+"|"+city+"|"+isp+"<br><br>");
                   %>
				   <%="Your server's ip is "+aip%>

	            </p>
				</div>

			</form>
			</div> <!-- /container --> 
			<!-- /center-->
		<br>
	    <footer class="footer">
		    <div class="container">
				<p class="text-muted">我也是有底线的.@xyq</p>
			</div>
	    </footer>

	</body>

    <script>
        var verifyCode = new GVerify("v_container");
        document.getElementById("submit").onclick = function(){
            var res = verifyCode.validate(document.getElementById("verification").value);
            if(res){
            	return true;
            }else{
                alert("验证码输入错误！");
                return false;
            }
        }
    </script>

</html>
