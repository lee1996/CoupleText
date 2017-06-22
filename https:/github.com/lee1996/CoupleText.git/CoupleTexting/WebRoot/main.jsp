<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page 
	import ="java.net.URLDecoder" 
	import= "java.net.URLEncoder"
	 import="org.springframework.context.ApplicationContext"
	 import="org.springframework.context.support.ClassPathXmlApplicationContext"
	 import="com.leet.pair.*"
%>
<%@ taglib prefix="s" uri="/struts-tags" %>
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
  
    <script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
	<link rel="Stylesheet" type="text/css" href="css/loginDialog.css" />	
	 <script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
	 <%
	 	Cookie[] cookies=request.getCookies();
	  	String user=null;
		for(Cookie cookie : cookies){
			if(URLDecoder.decode(cookie.getName(), "UTF-8").equals("username")){
				 user=URLDecoder.decode(cookie.getValue(), "UTF-8");
				 break;
			}
		}
		ApplicationContext ctx=new ClassPathXmlApplicationContext("applicationContext.xml");
		PairImpl pairImpl=ctx.getBean(PairImpl.class);
		boolean isExist=pairImpl.MorFExist(user);
	  %>
	<script type="text/javascript">
	$(function ($) {
		//弹出登录
		if(<%=isExist%>==true){
			$("#all").append("<li class='tooltipped' data-position='bottom' data-delay='50' data-tooltip='Ta'><a href='lover.jsp' ><i class='material-icons'>favorite</i></a></li>");
			$("#others").css("display","none");
			//$("#others").html="<li class='tooltipped' data-position='bottom' data-delay='50' data-tooltip='Ta'><a href='lover.jsp'><i class='material-icons'>favorite</i></a></li>";
		}else{
			$("#add").on('click', function () {
				$("body").append("<div id='mask'></div>");
				$("#mask").addClass("mask").fadeIn("slow");
				$("#LoginBox").fadeIn("slow");
			});
			
			$(".close_btn").hover(function () { $(this).css({ color: "#ee6e73"})}, function () { $(this).css({ color: "#999" }) }).on('click', function () {
				$("#LoginBox").fadeOut("fast");
				$("#mask").css({ display: 'none' });
			});
		}
		});
		</script>	
		<script type="text/javascript">
		$(document).ready(function(){
			$("#query").click(function(){
				var lovername=encodeURIComponent(JSON.stringify($("#ta").val()),"utf-8");
				
				var arglist={"lover":lovername};
	    			$.getJSON(
						"searchlover.action",
						arglist,
						function(data){
							console.log(data[0]);
							if(data[0]==null){
								confirm("无该对象!");
							}else if(data[0]=="11111"){
								alert("找不到哦");
							}else if(data[0]=="22222"){
								alert("人家已经有主了哦");
							}else{
								alert("已发送验证消息");
							}
						});
    	});	
    	});
		</script>
</head>
<body> 
<form action="searchlover" method="post" onkeydown="if(event.keyCode==13){return false;}">
	<div id="LoginBox">
	
        <div class="row">
        	<div class="col s4"></div>
            <div class="col s5 flow-text" style="padding-top:12px;color:#26a69a;">另一半用户名</div>
            <a href="javascript:void(0)" title="关闭窗口" class="close_btn" id="closeBtn">x</a>
        </div>
        <div class="row">
        <div class="col s12 input-field center-align">
        	<input type="text" name="lover" id="ta" class="validate" required style="width:70%;"/>
        	<label for_name="user">用户名</label>
        </div>
        </div>
        <div class="row">
        	<div class="col s12 center-align">
        	<button type="button" id="query" class="btn waves-effect waves-light" style="text-align:center;" >确　定</button>
        	</div>
        </div>
       <s:fielderror name="existerror"></s:fielderror>
      
    </div>
  </form>
	<ul id="dropdown1" class="dropdown-content">
    <li><a href="#!" id="add">添加另一半</a></li>
   
 	 </ul>
	<nav>
    <div class="nav-wrapper">
      <a href="#!" class="brand-logo" style="margin-left: 30px;"><i class="material-icons">textsms</i>CoupleText</a>
      <ul class="right hide-on-med-and-down" id="all">
     	 <li class="tooltipped" data-position="bottom" data-delay="50" data-tooltip="添加笔记"><a href="add.jsp" target="myframe"><i class="material-icons">add</i></a></li>
        <li class="tooltipped" data-position="bottom" data-delay="50" data-tooltip="搜索笔记"><a href="search.jsp" target="myframe"><i class="material-icons">search</i></a></li>
        <li class="tooltipped" data-position="bottom" data-delay="50" data-tooltip="全部笔记"><a href="person.jsp" target="myframe"><i class="material-icons">view_module</i></a></li>
      	<li id="others"><a class="dropdown-button" href="#!" data-activates="dropdown1">另一半<i class="material-icons right">favorite</i></a></li>
      </ul>
    </div>
  </nav><br/><br/>
</div>
<iframe src="person.jsp" name="myframe" style="width: 100%;height:450px;" frameborder="no"></iframe>

</body>
</html>