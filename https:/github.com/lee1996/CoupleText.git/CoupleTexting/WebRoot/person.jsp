<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import="com.leet.note.*"
	import="com.leet.user.*" 
	import="org.springframework.context.ApplicationContext"
	import="org.springframework.context.support.ClassPathXmlApplicationContext" 
	import ="java.net.URLDecoder" 
	import= "java.net.URLEncoder"
	import="java.text.SimpleDateFormat"
	
	%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   <title>个人信息</title>
	<meta charset="utf-8">
	<link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
     <!--Import materialize.css-->
    <link type="text/css" rel="stylesheet" href="css/materialize.min.css"  media="screen,projection"/>
      	<!--Let browser know website is optimized for mobile-->
    <meta name="viewport" content="width=device-width,initial-scale=1.0"/>
    <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
    <script type="text/javascript" src="js/materialize.min.js"></script>
   
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
    	NoteImpl noteImpl=ctx.getBean(NoteImpl.class);
    	UserImpl userImpl=ctx.getBean(UserImpl.class);
    	User users=userImpl.querySingleUser(user);
    	Set<Note> notes=users.getNotes();
    	SimpleDateFormat simple=new SimpleDateFormat("yyyy-MM-dd");
    	
    		
     %>
</head>
<body>
<div class="row" id="top">
	<div class="col s1"></div>
        <div class="col s3">
          <div class="card" style="width: 300px;">
            <div class="card-image" style="width: 300px;height: 200px;">
              <img src="img/user.jpg">
              <span class="card-title" id="username"><%=user %></span>
            </div>
            <div class="card-content">
              <p> I love you not because I need you, I need you because I love you. <br>不是因为需要你所以爱你，是因为爱你所以需要你。
             </p>
            </div>
          </div>
     	</div>
     	
     	<div class="col s7" >
     		<div class="divider"></div>
     		<p class="flow-text">笔记</p>
     		<p><%out.print(notes.size());%>条笔记</p>
     		<div class="divider"></div>
        <div class="collection" id="collection"><!-- #26a69a -->
         
          <% for(Note note : notes){ %>
          	<a href="detail.jsp?title=<%=note.getTitle()%>" class="collection-item"><%out.print(note.getTitle()); %>
          	<span class="badge" style="font-size:10px;"><%out.print(simple.format(note.getDate())); %>
          	</span></a>
          <% }%>
        </div>
     	</div>
 </div>
  <div class="fixed-action-btn  click-to-toggle">
    <a class="btn-floating btn-large red tooltipped waves-effect waves-light" data-position="left" data-delay="50" data-tooltip="回到顶部" href="#top"><i class="material-icons large">publish</i></a>
  </div>
  <br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
</body>
</html>