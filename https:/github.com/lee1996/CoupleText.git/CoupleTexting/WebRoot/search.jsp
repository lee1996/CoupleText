<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>搜索</title>
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
<div class="row">
<div class="col s2"></div>
<div class="col s8">
<nav>
    <div class="nav-wrapper">
      <form>
        <div class="input-field">
          <input id="search" type="search" required placeholder="输入你想查找的笔记名">
          <label class="label-icon" for="search"><i class="material-icons">search</i></label>
          <i class="material-icons">close</i>
        </div>
      </form>
    </div>
  </nav>
  </div>
 </div>
</body>
</html>