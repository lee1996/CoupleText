<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import="com.contract.*"  import ="java.net.URLDecoder" 
import= "java.net.URLEncoder" import="org.springframework.context.ApplicationContext"
import ="org.springframework.context.support.ClassPathXmlApplicationContext"
import="com.LoginAndRegist.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>管理项目</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<%
	String username=(String)request.getParameter("username");
	application.setAttribute("username", username);
	%>
	<style type="text/css">
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
	#add{
	float:right;
	padding-right:5%;
	padding-top:13px;;
	}
	.show{
	width:670px;
	margin-left:20%;
	margin-top:20px;
	border-collapse:collapse;
	font-size:20px;
	}
	</style>
	
  </head>
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
 	UserImpl useImpl=(UserImpl)ctx.getBean(UserImpl.class);
 	User use=useImpl.QuerySingleUser(user);
 	Set<ProjectManage> contracts=use.getProjectManages();
  	int count=0;
  %>
  <script type="text/javascript">
  function show(contract_id){
	  window.location.href='detail.jsp?'+contract_id;
  }
  </script>
  <body style="margin:0;">
    <div class="title">
    科研项目管理 
    </div>
   
    <table class="show" border="1" style="font-family:'宋体'">
    <tr>
    <td>序号</td>
    <td>项目编号</td>
    <td>合同编号</td>
    <td>详情</td>
    </tr>
    <%
    for(ProjectManage mp : contracts){
    	count++;
    %>
    	<tr>
    	<td><%=count %></td>
    	<td><%=mp.getProjectInfo().getProId() %></td>
    	<td><%=mp.getContractId() %></td>
    	<td><a href="javascript:" onclick="show('<%=mp.getContractId()%>')">详情</a></td>
    	</tr>
 <% 
    }
    %>
    </table>
  </body>
</html>