<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>welcome</title>
        <meta name="description" content="Examples for creative website header animations using Canvas and JavaScript" />
        <meta name="keywords" content="header, canvas, animated, creative, inspiration, javascript" />
        <meta name="author" content="Codrops" />
        <link rel="stylesheet" type="text/css" href="css/normalize.css" />
        <link rel="stylesheet" type="text/css" href="css/component.css" />
        <script type="text/javascript">
        function malelogin(){
        window.location.href="malelogin.jsp";
        }
        function femalelogin(){
        window.location.href="femalelogin.jsp";
        }
        </script>
  </head>
  
  <body>
   <div class="container demo-3">
			<div class="content">
                <div id="large-header" class="large-header">
                    <canvas id="demo-canvas"></canvas>
                   <div class="main-title">
                   <p style="font-size: 30px;">男生向左   女生向右</p>
                   	<img src="img/welcomemale.png" alt="male" style="cursor: pointer;" title="男生登录" onclick="malelogin()"/>&nbsp;&nbsp;&nbsp;
                   	<img src="img/welcomefemale.png" alt="female" style="cursor: pointer;" title="女生登录" onclick="femalelogin()" />
                   </div> 

                </div>
                
            </div>
		</div>     
        <script src="js/TweenLite.min.js"></script>
        <script src="js/EasePack.min.js"></script>
        <script src="js/rAF.js"></script>
        <script src="js/demo-3.js"></script>
        <script src="http://www.yyyweb.com/demo/common/jquery.min.js"></script>
  </body>
</html>
