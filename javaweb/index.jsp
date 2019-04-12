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
	<body style="background:url(./icon/22.jpg);background-repeat:no-repeat;background-attachment:fixed;background-size:cover;">
		<!--center-->
		<div class="container">
			<form class="form-signin" action="login" method="post">
				<h2 class="form-signin-heading">你好,世界</h2>
				<label for="inputEmail" class="sr-only">用户名</label>
     		    <input type="text" name="user" class="form-control" placeholder="用户名" required autofocus>
			    <label for="inputPassword" class="sr-only">密码</label>
				<input type="password" name="passwd" class="form-control" placeholder="密码" required>
				<div class="checkbox">
					<label>
						<input type="checkbox" value="remember-me"> 记住我
					</label>
				</div>
				<button class="btn btn-lg btn-primary btn-block" type="submit">登录</button>
				<a href="./register.jsp" class="btn btn-lg btn-primary btn-block" >注册</a>


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
</html>
