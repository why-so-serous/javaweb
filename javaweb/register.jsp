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
		<title>Register</title>
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
			<form class="form-signin" action="register" method="POST">
				<h2 class="form-signin-heading">你好,未来</h2>
				<label for="inputEmail" class="sr-only">用户名</label>
     		    <input type="text" name="user" class="form-control" placeholder="用户名" required autofocus>
			    <label for="inputPassword" class="sr-only">密码</label>
				<input type="password" name="passwd" class="form-control" placeholder="密码" required>
				<button class="btn btn-lg btn-primary btn-block" type="submit">登录</button>

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