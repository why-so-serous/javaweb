<%@ page contentType ="text/html; charset=utf-8" session="true" language="java" import="java.lang.*,java.util.*,java.io.*,java.net.*"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>Demo App</title>
	</head>
	<body style="background:url(./icon/11.jpg);background-repeat:no-repeat;background-attachment:fixed;background-size:cover;">
		<center>
		<div style="background:url(./icon/1.jpg);padding:30;width:30%;margin-top:5em;">
			<form action="login" method="post">
				用户： <input type="text" name="user"> <p>
				密码： <input type="password" name="passwd">  <p>
				<input type="submit" value=" 登 录 ">
			</form>
			<p> <a href="http://47.106.32.3:8080/demo/register.jsp" target="_blank">注册</a></p>
			<p>温馨提示:测试效果的账号名为xyq,密码为123456<p>

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
				out.print("Welcome "+ip);
			%>		
			
			<br>			

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

			out.println(country+"|"+region+"|"+city+"|"+isp);  

			%>
			<br>

			<%
				String aip = InetAddress.getLocalHost().getHostAddress();
			%>

			<%="Your server's ip is "+aip%>
		</div>
		</center>
		<br>

	</body>
</html>
