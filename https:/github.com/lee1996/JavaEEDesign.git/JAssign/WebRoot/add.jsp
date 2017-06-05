<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%@ page import ="java.net.URLDecoder" 
import= "java.net.URLEncoder"  %>
<%@ taglib prefix="s"  uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>添加项目</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<style type="text/css">
.addbox {
	width: 1000px;
	font-size: 19px;
	margin-left: 4%;
	line-height: 200%;
}
#save{
text-align:center;
width:100px;
height:50px;
background:#f00;
line-height:50px;
color:#fff;
margin:auto;
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
#showcon:hover{
color:#EE6A50;
}
</style>
 <%
	Cookie[] cookies=request.getCookies();
  	String user=null;
	for(Cookie cookie : cookies){
		if(URLDecoder.decode(cookie.getName(), "UTF-8").equals("username")){
			 user=URLDecoder.decode(cookie.getValue(), "UTF-8");
			 break;
		}
	}
%>
<script type="text/javascript">
function add(){
var div_two=document.getElementById("research_two");
div_two.style.display='block';
var show=document.getElementById("show");
show.style.display='none';
}
</script>
<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#showcon").click(function(){
			$("#company").fadeToggle();
		});
	});
</script>
</head>

<body style="margin:0;">
	<div class="title">
	科研项目添加
	</div>
	<form  method="post"  action="add"  class="addbox">
		<p style="font-size:28px;">项目信息</p>
		<div style="float:left;">
		<table  style="line-height:200%;">
		<tr>
			<td>用户名：</td>
			<td><input type="text" name="username"
				style="width:250px;height:30px;font-size:17px;"   value=<%=user %> disabled="disabled"></td>
		</tr>
		<tr>
			<td>项目编号：</td>
			<td><input type="text" name="project_id"
				style="width:250px;height:30px;font-size:17px" required="required"></td>
		</tr>
		<tr>
			<td>项目名称：</td>
			<td><input type="text" name="project_name"
				style="width:250px;height:30px;font-size:17px" required="required"></td>
		</tr>
		<tr>
			<td>项目性质：</td>
			<td><select style="width:250px;height:30px;font-size:15px"
				name="project_property">
				<option value="国家863">国家863</option>
				<option value="国家973">国家973</option>
				<option value="国家自然科学基金">国家自然科学基金</option>
				<option value="横向等">横向等</option>
			</select> </td>
			</tr>
			<!--  <input type="text" name=“project_property”
				style="width:250px;height:30px;font-size:17px">-->
			<tr>
			 <td>项目类型：</td>
			 <td><select name="project_type"
				style="width:250px;height:30px;font-size:15px">
				<option value="软件技术">软件技术</option>
				<option value="规范设计">规范设计</option>
				<option value="计算机应用">计算机应用</option>
			</select> </td>
			</tr>
			<!--  <input type="text" name=“project_type”
				style="width:250px;height:30px;font-size:17px">-->
			<tr>
			<td>项目总费用：</td>
			<td><input type="text" name="project_cost" onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9-]+/,'');}).call(this)" onblur="this.v();" 
				style="width:250px;height:30px;font-size:17px" required="required">单位：千元</td>
			</tr>
				</table>
		</div>
		<div style="float:right;">
		<table  style="line-height:200%;">
		<tr>
			<td>项目状态：</td>
			<td><input  type="text" name="project_state"
				style="width:250px;height:30px;font-size:17px" required="required"></td>
		</tr>
		<tr>
			<td>开始日期：</td>
			<td><input type="text" name="project_start_time"  id="start_time"
				style="width:250px;height:30px;font-size:17px"  onfocus="WdatePicker();" required="required"></td>
		</tr>
		<tr>
			<td>结题日期：</td>
			<td><input type="datetime" name="project_finish_time"
				style="width:250px;height:30px;font-size:17px" onclick="WdatePicker();" required="required"></td>
		</tr>
		<tr>
			<td>费用余额：</td>
			<td><input  onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9-]+/,'');}).call(this)" onblur="this.v();" 
				type="text" name="project_rest_cost"
				style="width:250px;height:30px;font-size:17px" required="required"></td>
		</tr>
		<tr>
				<td>合同编号：</td>
				<td><input type="text" name="contract_id"
				style="width:250px;height:30px;font-size:17px" required="required"></td>
		</tr>
		</table>
		</div>
		<div  style="clear:both;padding-top:10px;font-size:28px;padding-top:20px;">
			<span id="showcon" style="cursor:pointer;" title="点击展开">合作单位</span>
		</div>
		<div id="company" style="display:none;margin-top:26px;">
		<div id="research">
			<div style="float:left;">
			<table style="line-height:200%;">
			<tr>
				<td>单位编号：</td>
				<td><input type="text" name="company_id"
					style="width:250px;height:30px;font-size:17px"></td>
			</tr>
			<tr>
				<td>单位名称：</td>
				<td><input  type="text" name="company_name"
					style="width:250px;height:30px;font-size:17px"></td>
			</tr>
			<tr>
				<td>单位性质： </td>
				<td><select name="company_property"
					style="width:250px;height:30px;font-size:15px">
					<option value="高校">高校</option>
					<option value="研究所">研究所</option>
					<option value="企业">企业</option>
				</select> </td>
			</tr>
			<!-- <input type="text" name=“company_property”
				style="width:250px;height:30px;font-size:17px"> -->
				</table>
				<br><br>
			</div>
			<div style="float:right;">
			<table style="line-height:200%;">
				<tr>
				<td>联系人：</td>
				<td><input type="text" name="contact_name"
					style="width:250px;height:30px;font-size:17px"></td>
				</tr>
				<tr>
				<td>电话号码：</td>
				<td><input type="text" name="contact_number"
					style="width:250px;height:30px;font-size:17px"></td>
				</tr>
				<tr>
				<td>电子信箱：</td>
				<td><input type="text" name="contact_email"
					style="width:250px;height:30px;font-size:17px"></td>
				</tr>
					</table><br><br>	
			</div>
		</div>
		<div id="next"></div>
		<div id="research_two" style="display:none;">
			<div style="float:left;">
			<table style="line-height:200%;">
			<tr>
				<td>单位编号：</td>
				<td><input type="text" name="company_id_two"
					style="width:250px;height:30px;font-size:17px"></td>
			</tr>
			<tr>
				<td>单位名称：</td>
				<td><input  type="text" name="company_name_two"
					style="width:250px;height:30px;font-size:17px"></td>
			</tr>
			<tr>
				<td>单位性质： </td>
				<td><select name="company_property_two"
					style="width:250px;height:30px;font-size:15px">
					<option value="高校">高校</option>
					<option value="研究所">研究所</option>
					<option value="企业">企业</option>
				</select> </td>
			</tr>
			<!-- <input type="text" name=“company_property”
				style="width:250px;height:30px;font-size:17px"> -->
				</table>
				<br><br>
			</div>
			<div style="float:right;">
			<table style="line-height:200%;">
				<tr>
				<td>联系人：</td>
				<td><input type="text" name="contact_name_two"
					style="width:250px;height:30px;font-size:17px"></td>
				</tr>
				<tr>
				<td>电话号码：</td>
				<td><input type="text" name="contact_number_two"
					style="width:250px;height:30px;font-size:17px"></td>
				</tr>
				<tr>
				<td>电子信箱：</td>
				<td><input type="text" name="contact_email_two"
					style="width:250px;height:30px;font-size:17px"></td>
				</tr>
					</table><br><br>	
			</div>
		</div>
		<div style="clear:both;"></div>
		<div  id="show">
		若还有其他科研单位，请点击<input type="button"  style="font-size:20px;width:75px;height:40px;background:#fff;;border-radius:12px;" onclick="add()" value="添加"> 
		</div><br>
		</div>
		<s:fielderror name="error"></s:fielderror>
		<input type="submit" style="background:#CFCFCF;color:white;font-size:25px;margin:auto;width:200px;height:60px;border-radius:9px;margin-left:400px;" value="保  存">
	</form>
</body>
</html>