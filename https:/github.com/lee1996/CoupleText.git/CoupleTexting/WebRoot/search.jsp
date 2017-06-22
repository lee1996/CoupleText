<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>搜索</title>
	<link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
     <!--Import materialize.css-->
    <link type="text/css" rel="stylesheet" href="css/materialize.min.css"  media="screen,projection"/>
      	<!--Let browser know website is optimized for mobile-->
    <meta name="viewport" content="width=device-width,initial-scale=1.0"/>
    <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
    <script type="text/javascript" src="js/materialize.min.js"></script>
    <script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript">
    	$(document).ready(function(){
    	$("#query").click(function(){
    				var searchtitle=encodeURIComponent(JSON.stringify($("#search").val()),"utf-8");
	    			console.log(searchtitle);
	    			var arglist={"title":searchtitle};
	    			$.getJSON(
						"search.action",
						arglist,
						function(data){
							if(data.length==0){
								confirm("无对应笔记记录!");
							}else{
								var content="";
								var i=0;
								for(;i<data.length;i++){
									content+="<a class='collection-item' href='detail.jsp?title="+data[i]+"'>"+data[i]+"</a>";
									//content="<a href='#' class='collection-item'>nihao</a>";
								}
								document.getElementById("collection").innerHTML=content;
								$("#collection").css("visibility","visible");
							}
						});
    	});	
    	});
    </script>
</head>
<body>
<a href="person.jsp" class="btn-flat waves-effect waves-teal tooltipped" style="width: 80px;border:solid 1px #e0e0e0;" data-position="bottom" data-delay="50" data-tooltip="回到主页面"><i class="material-icons right">keyboard_return</i></a>
<div class="row">
<div class="col s2"></div>
<div class="col s8">
<nav>
    <div class="nav-wrapper">
    
      <form method="post" action="search" onkeydown="if(event.keyCode==13){return false;}">
        <div class="input-field">
          <input id="search" type="search" required placeholder="输入你想查找的笔记名">
          <label class="label-icon" for="search"><i class="material-icons">search</i></label>
          <i class="material-icons">close</i>  
        </div>
      </form>
      <div  class="collection" id="collection" style="visibility: hidden;">
   	</div>
    </div>
  </nav>
  </div>
  <div class="col s2">
  <button type="button" class="btn waves-effect waves-light"  style="height:63px;text-align:center;" id="query">搜　索</button>
  </div>
  
 </div>
 
</body>
</html>