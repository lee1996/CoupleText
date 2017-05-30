<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>添加</title>
	<meta charset="utf-8">
	<link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
     <!--Import materialize.css-->
    <link type="text/css" rel="stylesheet" href="css/materialize.min.css"  media="screen,projection"/>
      	<!--Let browser know website is optimized for mobile-->
    <meta name="viewport" content="width=device-width,initial-scale=1.0"/>
    <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
    <script type="text/javascript" src="js/materialize.min.js"></script>
</head>
<body>
<a href="person.jsp" class="btn-flat waves-effect waves-teal tooltipped" style="width: 80px;border:solid 1px #e0e0e0;" data-position="bottom" data-delay="50" data-tooltip="回到主页面"><i class="material-icons right">keyboard_return</i></a>
<form method="post" action="addNote">
<div class="row">
<div class="col s1"></div>
<div class="col s10">
<h2 class="flow-text">写下你的记录</h2>
<div class="input-field">
	
	<input type="text" id="title" name="title" class="validate" data-length="20" required maxlength="20"　>
	<label for="title">标题</label>
</div>
</div>
</div>
<div class="row">
	<div class="col s1">
	</div>
	<div class="col s10 input-field">
		<textarea id="content" class="materialize-textarea" name="content" data-length="1500" maxlength="1500" required></textarea>
		<label for="content">输入你想记录的事情...</label>
	</div>
</div>
<div class="row">
	<div class="col s1"></div>
	<div class="col s10">
	<button class="btn waves-effect waves-light" type="submit">保 存</button>
	</div>
</div>
</form>
</body>
</html>