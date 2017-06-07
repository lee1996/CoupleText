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
    
   <title>男生注册</title>
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
	<form method="post" action="maleRegist">
	<div class="card-panel hoverable" style="width: 300px;height: 540px;margin-left: 39%;">
		<h4 class="flow-text" style="color: #17abe3;">Boy</h4>
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
				name="password" class="validate" required minlength="6"/>
				<label for="password">密码</label>
			</div>
		</div>
		<div class="row">
			<div class="col s12 input-field">
			<i class="material-icons prefix">verified_user</i>
				<input type="password" id="password"
				name="pwdAgain" class="validate" required/>
				<label for="password">确认密码</label>
			</div>
		</div>
		<div class="row">
			<div class="col s12 input-field">
			<i class="material-icons prefix">email</i>
				<input type="text" id="email"
				name="email" class="validate" required/>
				<label for="password">邮箱</label>
			</div>
		</div>
		<button class="waves-effect waves-light btn" type="submit" style="width: 200px;height: 40px;">注 册</button>
		<input type="text" value="male" name="gender" style="visibility: hidden;">
	</div>
	<s:fielderror name="registError"></s:fielderror>
	</form>
</div>
</body>
</html>
