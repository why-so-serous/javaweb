<%@ page contentType ="text/html; charset=utf-8" session="true" %>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>Demo App</title>
	</head>
	<body>
		<center>
		<div style="background-color:#ddd;padding:30;width:30%;margin-top:5em">
			<form action="login" method="post">
				用户： <input type="text" name="user"> <p>
				密码： <input type="password" name="passwd">  <p>
				<input type="submit" value=" 登 录 ">
			</form>
			<p> <a href="http://47.106.32.3:8080/demo/register.jsp" target="_blank">注册</a></p>
			<p>温馨提示:测试效果的账号名为xyq,密码为123456<p>

		</div>
		</center>
	</body>
</html>
