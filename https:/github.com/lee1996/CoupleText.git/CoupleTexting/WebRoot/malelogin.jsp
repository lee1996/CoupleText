<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="s"  uri="/struts-tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
   <title>男生登录</title>
	<link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
     <!--Import materialize.css-->
    <link type="text/css" rel="stylesheet" href="css/materialize.min.css"  media="screen,projection"/>
      	<!--Let browser know website is optimized for mobile-->
    <meta name="viewport" content="width=device-width,initial-scale=1.0"/>
    <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
    <script type="text/javascript" src="js/materialize.min.js"></script>
</head>
<body>
<div class="center-align" style="margin-top: 40px;">
	<img src="img/male.png">
	<form method="post" action="maleLogin">
	<div class="card-panel hoverable" style="width: 300px;height: 420px;margin-left: 39%;">
		<h4 style="color:#17abe3;">boy</h4><h5>start here</h5>
		<br/>
		<div class="row">
			<div class="col s12 input-field">
				<i class="material-icons prefix">account_circle</i>
				<input type="text" id="username"
				name="username" class="validate" required />
				<label for="username">用户名</label>

			</div>
		</div>
		<div class="row">
			<div class="col s12 input-field">
			<i class="material-icons prefix">lock_outline</i>
				<input type="password" id="password"
				name="password" class="validate" required/>
				<label for="password">密码</label>
			</div>
		</div>
		<button class="waves-effect waves-light btn" type="submit" style="width: 200px;height: 40px;">登 录</button>
		<input type="text" value="male" name="gender" style="visibility: hidden;">
	</div>
	<s:fielderror name="loginError"></s:fielderror>
	</form>
	<div style="width: 300px;height: 20px;margin-left: 39%;">
		没有账号?<a href="maleregist.jsp">前往注册</a>
	</div>
</div>
</body>
</html>