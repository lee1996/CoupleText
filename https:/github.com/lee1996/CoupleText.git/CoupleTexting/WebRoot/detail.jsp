<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page
	 import="org.springframework.context.ApplicationContext"
	 import="org.springframework.context.support.ClassPathXmlApplicationContext" 
	 import="com.leet.note.*"
	 import ="java.net.URLDecoder"
	 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<title>详情页</title>
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
    		$("#edit").click(function(){
    			$("#title").removeAttr("readonly");
    			$("#content").removeAttr("readonly");
    		});
    		
    		$("#update").click(function(){
    		
    			$("form").attr("action","update");
    			
    		});
    		$("#delete").click(function(){
    			if(confirm("确定删除吗？")){
    				$("form").attr("action","delete");
    			}else{
    				return false;
    			}
    			
    		});
    	});
    </script>
    <%
    
    	String title=URLDecoder.decode((request.getQueryString().substring(6, request.getQueryString().length())),"utf-8");
    	ApplicationContext ctx=new ClassPathXmlApplicationContext("applicationContext.xml");
    	String content=null;
    	int note_id=0;
    	NoteImpl noteImpl=ctx.getBean(NoteImpl.class);
    	List<Note> list=noteImpl.queryNote(title);
    	for(Note notes : list){
    		if(notes.getTitle().equals(title)){
    			content=notes.getContent();
    			note_id=notes.getNoteId();
    			break;
    		}	
    	}	
     %>
     
</head>
<body>
<form method="post" action="#">
<div style="margin-left:15%;width: 70%;height: 500px;border: solid 1px #e0e0e0;"><br/>
	<div class="row">
		<div class="col s7">
			<a href="person.jsp" class="btn-flat waves-effect waves-teal tooltipped" style="width: 80px;border:solid 1px #e0e0e0;margin-left: 20px;" data-position="bottom" data-delay="50" data-tooltip="回到主页面"><i class="material-icons right">keyboard_return</i></a>
		</div>
		<div class="col s1.6">
			<a class="btn waves-effect waves-light" id="edit">编 辑</a>
			
		</div>
		<div class="col s1.6">
			<button id="update" type="submit" class="btn waves-light waves-effect
			">保 存</button>
		</div>
		
		<div class="col s1.6">
			<button id="delete" type="submit" class="btn waves-light waves-effect
			" style="background-color:red;">删 除</button>
		</div>
	</div>
	<div class="row" style="margin-left: 20px;">
		<div class="col s12 input-field">
			<input type="text" name="title" id="title" maxlength="20" required  data-length="20" class="validate" value="<%out.print(title);%>" readonly>
			<label for="title">标题</label>
		</div>
	</div>
	
	<div class="row" style="margin-left: 20px;">
		<div class="col s12 input-field">
			<textarea type="text" name="content" id="content" maxlength="1500" required data-length="1500" class="materialize-textarea" readonly><%out.print(content); %></textarea>
			<label for="content">内容</label>
		</div>
	</div>
	<input type="text" name="note_id" value="<%=note_id%>" style="visibility: hidden;"/>
</div>
</form>
</body>
</html>