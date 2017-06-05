<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <meta name="viewport" content="width=device-width">
	<title>登录</title>
	<link rel="stylesheet" href="css/style.css">
	<link rel="stylesheet" href="css/fort.css">
	<link rel="stylesheet" href="http://dreamsky.github.io/main/blog/common/init.css">
	<style>
	.top-banner {
  background-color: #333;
}
.nav {
	margin-bottom: 30px;
}
.nav li.current a{
	background-color: #009DFF;
	color: #fff;
	padding: 10px;
}
.nav a {
	margin: 5px;
	color: #333;
	text-decoration: none;
}
body{
	background-image: url("img/back.jpg");
	background-repeat: no-repeat;
}
</style>
<script src="js/fort.js"></script>
</head>
<body>
<div class="form-wrapper" >
  <div class="top"><div class="colors"></div></div>
	<form name="form" action="login" method="post">
		<div class="form">
			<div class="form-item">
				<p style="font-size: 35px;padding-bottom: 10px;">科 研 项 目 管 理</p>
			</div> 
			<div class="form-item">
				<input type="text" name="username" required="required" placeholder="Username" autocomplete="off">
			</div>
			<div class="form-item">
				<input type="password" name="password" required="required" placeholder="Password" autocomplete="off">
			</div>
			<div class="button-panel">
     <input type="submit" class="button" title="Sign In" value="登录">
   </div>
    <div style="margin-top: 10px;margin-left: 200px;">没有账号?<a href="regist.jsp" style="text-decoration: none;">前去注册</a></div>
	</div>
	<s:fielderror name="error"/>
	
</form>
</div>
<div class="footer-banner" style="width:728px; margin:200px auto 0"></div>
<script>
    flash();
</script>
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<!-- <script src="http://dreamsky.github.io/main/blog/common/init.js"></script> -->
</body>
</html>
