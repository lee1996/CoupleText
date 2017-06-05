<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import ="java.net.URLDecoder" 
import= "java.net.URLEncoder" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
 <%
	Cookie[] cookies=request.getCookies();
  	String user=null,pwd=null;
	for(Cookie cookie : cookies){
		if(URLDecoder.decode(cookie.getName(), "UTF-8").equals("username")){
			 user=URLDecoder.decode(cookie.getValue(), "UTF-8");	 
		}
		if(URLDecoder.decode(cookie.getName(), "UTF-8").equals("password")){
			 pwd=URLDecoder.decode(cookie.getValue(), "UTF-8");
		}
	}
	session.setAttribute("username", user);
%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'personInfo.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<style type="text/css">
	.personbox{
		width:350px;
		height:350px;
		margin:0 auto;
		margin-top:50px;
		font-size:40px;
		font-family:"微软雅黑";
		padding-top:40px;
		padding-left:20px;
		border-radius:6px;
	}
	.title{
		width:100%;
		height:100px;
		font-family:'微软雅黑';
		font-size:38px;
		color:#fff;
		text-align:center;
		background-color:#bfbfbf;
		line-height:100px;
	}
	.changebtn{
		border-radius:10px;
		margin-top:30px;
		width:150px;
		height:40px;
		background-color:transparent;
		font-size:20px;
		margin-left:80px;
	}
	input{
	border-radius:8px;
	width:180px;
	height:35px;
	}
	</style>
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#changebutton").click(function(){
		$("#change").fadeToggle();
		$("#save").fadeToggle();
		$("#changebutton").toggle();
	});
});
</script>

  </head>
  
  <body style="margin:0px;">
  <div class="title">
  	个人信息
  </div>
   <div class="personbox">
   <form action="update" method="post">
   	<table style="font-size:20px;border-collapse:separate; border-spacing:0px 10px;text-align:center;">
   		<tr>
   		<td>用户名:</td>
   		<td><input type="text" name="username" value="<%=user%>" style="padding-left:15px;font-size:20px;" disabled="disabled"/></td>
   		</tr>
   		<tr>
   		<td>密码:</td>
   		<td><input type="text" name="password" value="<%=pwd%>" style="padding-left:15px;font-size:20px;" disabled="disabled"/></td>
   		</tr>
   		</table>
   		<table style="font-size:20px; border-spacing:0px 10px;text-align:center;display:none;" id="change" >
   		<tr>
   		<td>新密码:</td>
   		<td><input type="password" name="pwdupdate" required="required" style="padding-left:15px;font-size:20px;"/></td>
   		</tr>
   		<tr>
   		</tr>
   		</table>
   		<input class="changebtn" id="changebutton" type="button" value="修 改"/>
   		<input class="changebtn" id="save" type="submit" value="保 存" style="display:none;"/>
   		<s:fielderror name="pwd"/>
   		</form>
   </div>
  </body>
</html>
