<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import ="java.net.URLDecoder" 
import= "java.net.URLEncoder" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>科研项目管理</title>
	<style type="text/css">
		body{
			margin:0px;
		}
		.topline{	
			width: 100%;
			height: 48px;
			background-color: #528B8B;
			position: relative;
		}
		.topimg{
			margin-top: 12px;
			margin-left: 10px;
			position: absolute;
		}
		.left{
			width: 20%;
			height:520px;
			position: absolute;
			background-color: #f0f6f6;
		}
		.right{
			width: 80%;
			height: 520px;
			right: 0px;
			position: absolute;
			/*background-color: green;*/
		}
		#headicon{
			width: 85px;
			height: 85px;
			margin: 0 auto;
			margin-top: 25px;
			background-color: #fff;
			border-radius: 85px;
			border:solid 1px #2E8B57;
		}
		.username{
			color: #000;
			margin-left: 23%;
			margin-top: 20px;
			font-size:19px;
			
		}
	    .personcolumn{
	    	
			margin-top: 40px;
			font-weight: 650;
			color: #545454;
	    }
	    .infotext{
	    	margin-top: 10px;
	    	padding-left: 10%;
	    	width: 80%;
	    	height: 34px;
	    	line-height: 34px;
	    	cursor: pointer;
	    }
	    .infotext:hover{
	    	color: #2277da;
	    	background-color: #d5e2ef;
	    }
	    a:hover{
	    	color: #2277da;
	    }
	     .infotext:FOCUS{
	    	background-color: #d5e2ef;
	    }
	   /* a:FOCUS{
	    	color: #2277da;
	    }*/
	    a{
	    	color:#000;
	    }
	   
	</style>
	<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
	<script>
	function changeCss(obj){ 
		var alist=document.getElementsByTagName("a");
		
		
		for(var i =0;i < alist.length;i++){ 
			alist[i].style.color = "#000"; 
			
		} 
		obj.style.color = "#2277da"; 
		
	} 
	</script>
</head>
<body>
<div class="topline">
	<img src="img/research.png" alt="default" class="topimg" />
	<div class="topimg" style="padding-left: 25px;color: #fff;font-size: 18px;">科研项目管理</div>
</div>
<div style="position: relative;">
	<div class="left">
		<div id="headicon">
			<img src="img/user.png" alt="user" style="margin-left: 12px;margin-top: 8px;" />
		</div>
		<div class="username">
			<p>this is for manage</p>
		</div>
		<div class="personcolumn">
			<div class="infotext" id="personInfo"><a href="personInfo.jsp" target="frame" style="text-decoration: none;" onclick="changeCss(this)">账号信息</a></div>
			<div class="infotext" id="projectManage" ><a href="manage.jsp" target="frame" style="text-decoration: none;color:#2277da;" onclick="changeCss(this)">项目管理</a></div>
			<div class="infotext" id="projectAdd" ><a href="add.jsp" target="frame" style="text-decoration: none;" onclick="changeCss(this)">项目添加</a></div>
			<div class="infotext" id="projectSearch" ><a href="search.jsp" target="frame" style="text-decoration: none;" onclick="changeCss(this)">项目查找</a></div>
			<div class="infotext" id="projectSearch" ><a href="login.jsp"  style="text-decoration: none;" onclick="changeCss(this)">登出系统</a></div>
		</div>
	</div>
	<iframe class="right" src="manage.jsp" name="frame" ></iframe>
		
	</div>
</div>
</body>
</html>