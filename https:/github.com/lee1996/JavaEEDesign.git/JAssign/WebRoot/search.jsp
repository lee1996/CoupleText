<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'search.jsp' starting page</title>
    
	<style type="text/css" media="screen">
      body {
        /*background-color: #f1f1f1;*/
        margin: 0;
      }
      body,
      input,
      button {
        font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
      }
      .container { margin: 30px auto 40px auto; width: 800px; text-align: center; }

      a { color: #4183c4; text-decoration: none; font-weight: bold; }
      a:hover { text-decoration: underline; }

      h3 { color: #666; }
      ul { list-style: none; padding: 25px 0; }
      li {
        display: inline;
        margin: 10px 50px 10px 0px;
      }
      input[type=text],
      input[type=password] {
        font-size: 13px;
        min-height: 32px;
        margin: 0;
        padding: 7px 8px;
        outline: none;
        color: #333;
        background-color: #fff;
        background-repeat: no-repeat;
        background-position: right center;
        border: 1px solid #ccc;
        border-radius: 3px;
        box-shadow: inset 0 1px 2px rgba(0,0,0,0.075);
        -moz-box-sizing: border-box;
        box-sizing: border-box;
        transition: all 0.15s ease-in;
        -webkit-transition: all 0.15s ease-in 0;
        vertical-align: middle;
      }
      .button {
        position: relative;
        display: inline-block;
        margin: 0;
        padding: 8px 15px;
        font-size: 13px;
        font-weight: bold;
        color: #333;
        text-shadow: 0 1px 0 rgba(255,255,255,0.9);
        white-space: nowrap;
        background-color: #eaeaea;
        background-image: -moz-linear-gradient(#fafafa, #eaeaea);
        background-image: -webkit-linear-gradient(#fafafa, #eaeaea);
        background-image: linear-gradient(#fafafa, #eaeaea);
        background-repeat: repeat-x;
        border-radius: 3px;
        border: 1px solid #ddd;
        border-bottom-color: #c5c5c5;
        box-shadow: 0 1px 3px rgba(0,0,0,.05);
        vertical-align: middle;
        cursor: pointer;
        -moz-box-sizing: border-box;
        box-sizing: border-box;
        -webkit-touch-callout: none;
        -webkit-user-select: none;
        -khtml-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
        -webkit-appearance: none;
      }
      .button:hover,
      .button:active {
        background-position: 0 -15px;
        border-color: #ccc #ccc #b5b5b5;
      }
      .button:active {
        background-color: #dadada;
        border-color: #b5b5b5;
        background-image: none;
        box-shadow: inset 0 3px 5px rgba(0,0,0,.15);
      }
      .button:focus,
      input[type=text]:focus,
      input[type=password]:focus {
        outline: none;
        border-color: #51a7e8;
        box-shadow: inset 0 1px 2px rgba(0,0,0,.075), 0 0 5px rgba(81,167,232,.5);
      }
     
      label[for=search] {
        display: block;
        text-align: left;
      }
      #search label {
        font-weight: 200;
        padding: 5px 0;
      }
      #search input[type=text] {
        font-size: 18px;
        width: 705px;
      }
      #search .button {
        padding: 10px;
        width: 90px;
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

    </style>
  

<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#query").click(function(){
		var tex=document.getElementById("content").value;
		var arglist={"con_id":tex};
		$.getJSON(
			"search.action",
			arglist,
			function(data){
				if(data.length==0){
					confirm("无对应项目合同!");
				}else{
					var content="";
					for(var i=0;i<data.length;i++){
						content=content+"<tr>"+"<td>"+data[i]+"</td>"+"<td>"+"<a href='detail.jsp?"+data[i]+"'>"+"详情"+"</a>"+"</tr>";
					}
					document.getElementById("result").innerHTML=content;
				}
			});
	});
});
</script>

<style type="text/css">
.show{
	width:600px;
	margin-left:15%;
	margin-top:20px;
	border-collapse:collapse;
	font-size:20px;
	}
</style>
</head>
<body>
<div class="title">
	项目查找
</div>
<form action="search" method="post">
<div class="container">
  <div id="search">
    <input type="text" name="con_id" id="content" placeholder="根据合同编号查找"/>
    <input class="button" type="button" value="Search"  id="query"/>
  </div>
</div>
</form>
<p style="margin-left:15px;">符合查找条件的如下:</p>
<div style="margin-left:60px;">
 <table class="show" border="1" style="font-family:'宋体'">
    <tr>
   
    <td>合同编号</td>
    <td>详情</td>
    </tr> 
    <tbody id="result">
    
    </tbody> 
</table>
</div>


</body>
</html>