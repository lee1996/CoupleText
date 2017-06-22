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
	 import="com.leet.user.*"
	 import="com.leet.note.*"
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   <title>lover</title>
	<meta charset="utf-8">
	<link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
     <!--Import materialize.css-->
    <link type="text/css" rel="stylesheet" href="css/materialize.min.css"  media="screen,projection"/>
      	<!--Let browser know website is optimized for mobile-->
    <meta name="viewport" content="width=device-width,initial-scale=1.0"/>
    <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
    <script type="text/javascript" src="js/materialize.min.js"></script>
    <script type="text/javascript">
    	$(document).ready(function(){
      		$(".carousel").carousel();
   		 });
    </script>
    
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
		String lover=pairImpl.lovername(user);
		UserImpl userImpl=ctx.getBean(UserImpl.class);
		User users=userImpl.querySingleUser(lover);
		Set<Note> notes=users.getNotes();
		%>
</head>
<body>
<nav>
    <div class="nav-wrapper">
      <a href="#!" class="brand-logo center">CoupleText</a>
      <ul class=" hide-on-med-and-down left">
        <li><a href="main.jsp"><i class="material-icons left">keyboard_return</i>返回</a></li>
      </ul>
      <ul class=" hide-on-med-and-down right">
        <li><a href="#!" class="flow-text"><%=lover %></a></li>
      </ul>
    </div>
  </nav><br/>

  <div class="left-align flow-text" style="color:#ff8a80;margin-left: 20px;">
  	Ta有如下记录:
  </div>
  <div id="content" style="margin-top: -20px;">
 <div class="carousel" style="width: 100%;height: 600px;">
   <!--   <a class="carousel-item" href="#one!" style="width: 400px;height: 300px;">
    <div class="card">
		    <div class="card-image waves-effect waves-block waves-light">
		      <img class="activator" src="img/office.jpg">
		    </div>
		    <div class="card-content">
		      <span class="card-title activator grey-text text-darken-4">Card Title one<i class="material-icons right">more_vert</i></span>
		    </div>
		    <div class="card-reveal">
		      <span class="card-title grey-text text-darken-4">Card Title<i class="material-icons right">close</i></span>
		      <p>Here is some more information about this product that is only revealed once clicked on.Here is some more information about this product that is only revealed once clicked on.Here is some more information about this product that is only revealed once clicked on.Here is some more information about this product that is only revealed once clicked on.Here is some more information about this product that is only revealed once clicked on.Here is some more information about this product that is only revealed once clicked on.Here is some more information about this product that is only revealed once clicked on.Here is some more information about this product that is only revealed once clicked on.Here is some more information about this product that is only revealed once clicked on.Here is some more information about this product that is only revealed once clicked on.Here is some more information about this product that is only revealed once clicked on.Here is some more information about this product that is only revealed once clicked on.</p>
   			 </div>
  	</div></a>
  
     <a class="carousel-item" href="#one!" style="width: 400px;height: 300px;">
    <div class="card">
		    <div class="card-image waves-effect waves-block waves-light">
		      <img class="activator" src="img/office.jpg">
		    </div>
		    <div class="card-content">
		      <span class="card-title activator grey-text text-darken-4">Card Title two<i class="material-icons right">more_vert</i></span>
		    </div>
		    <div class="card-reveal">
		      <span class="card-title grey-text text-darken-4">Card Title<i class="material-icons right">close</i></span>
		      <p>Here is some more information about this product that is only revealed once clicked on.Here is some more information about this product that is only revealed once clicked on.Here is some more information about this product that is only revealed once clicked on.Here is some more information about this product that is only revealed once clicked on.Here is some more information about this product that is only revealed once clicked on.Here is some more information about this product that is only revealed once clicked on.Here is some more information about this product that is only revealed once clicked on.Here is some more information about this product that is only revealed once clicked on.Here is some more information about this product that is only revealed once clicked on.Here is some more information about this product that is only revealed once clicked on.Here is some more information about this product that is only revealed once clicked on.Here is some more information about this product that is only revealed once clicked on.</p>
   			 </div>
  	</div></a>

  	 <a class="carousel-item" href="#one!" style="width: 400px;height: 300px;">
    <div class="card">
		    <div class="card-image waves-effect waves-block waves-light">
		      <img class="activator" src="img/office.jpg">
		    </div>
		    <div class="card-content">
		      <span class="card-title activator grey-text text-darken-4">标题<i class="material-icons right">more_vert</i></span>
		    </div>
		    <div class="card-reveal">
		      <span class="card-title grey-text text-darken-4">Card Title<i class="material-icons right">close</i></span>
		      <p>Here is some more information about this product that is only revealed once clicked on.Here is some more information about this product that is only revealed once clicked on.Here is some more information about this product that is only revealed once clicked on.Here is some more information about this product that is only revealed once clicked on.Here is some more information about this product that is only revealed once clicked on.Here is some more information about this product that is only revealed once clicked on.Here is some more information about this product that is only revealed once clicked on.Here is some more information about this product that is only revealed once clicked on.Here is some more information about this product that is only revealed once clicked on.Here is some more information about this product that is only revealed once clicked on.Here is some more information about this product that is only revealed once clicked on.Here is some more information about this product that is only revealed once clicked on.</p>
   			 </div>
  	</div></a>-->
  	
  	<%
  		for(Note note : notes){%>
  			 <a class="carousel-item" href="#one!" style="width: 400px;height: 300px;">
    <div class="card">
		    <div class="card-image waves-effect waves-block waves-light">
		      <img class="activator" src="img/office.jpg">
		    </div>
		    <div class="card-content">
		      <span class="card-title activator grey-text text-darken-4"><%out.print(note.getTitle()); %><i class="material-icons right">more_vert</i></span>
		    </div>
		    <div class="card-reveal">
		      <span class="card-title grey-text text-darken-4"><%=note.getTitle() %><i class="material-icons right">close</i></span>
		      <p><%=note.getContent() %></p></div>
  	</div></a>
  		<%}
  	 %>
 </div>

</body>
</html>