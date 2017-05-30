<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>主界面测试</title>
	<meta charset="utf-8">
	<link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
     <!--Import materialize.css-->
    <link type="text/css" rel="stylesheet" href="css/materialize.min.css"  media="screen,projection"/>
      	<!--Let browser know website is optimized for mobile-->
    <meta name="viewport" content="width=device-width,initial-scale=1.0"/>
    <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
    <script type="text/javascript" src="js/materialize.min.js"></script>
   <script type="text/javascript">
      function prom(){
        var name=prompt("请输入对方的用户名:","");
        var pwd=prompt("请输入对方的密码:","");
        alert("用户名是:"+name+"密码是:"+pwd);
      }
    </script>
</head>
<body>
<div>
	<ul id="dropdown1" class="dropdown-content">
    <li><a href="#!" onclick="prom()">添加另一半</a></li>
    <li class="divider"></li>
    <li><a href="lover.jsp">我的另一半</a></li>
 	 </ul>
	<nav>
    <div class="nav-wrapper">
      <a href="#!" class="brand-logo" style="margin-left: 30px;"><i class="material-icons">textsms</i>CoupleText</a>
      <ul class="right hide-on-med-and-down">
     	 <li class="tooltipped" data-position="bottom" data-delay="50" data-tooltip="添加笔记"><a href="add.jsp" target="myframe"><i class="material-icons">add</i></a></li>
        <li class="tooltipped" data-position="bottom" data-delay="50" data-tooltip="搜索笔记"><a href="search.jsp" target="myframe"><i class="material-icons">search</i></a></li>
        <li class="tooltipped" data-position="bottom" data-delay="50" data-tooltip="全部笔记"><a href="person.jsp" target="myframe"><i class="material-icons">view_module</i></a></li>
       <li><a class="dropdown-button" href="#!" data-activates="dropdown1">另一半<i class="material-icons right">favorite</i></a></li>
      </ul>
    </div>
  </nav><br/><br/>
</div>
<iframe src="detail.jsp" name="myframe" style="width: 100%;height:450px;" frameborder="no"></iframe>

</body>
</html>