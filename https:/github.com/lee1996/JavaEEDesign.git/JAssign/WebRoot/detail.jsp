<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import=" java.util.Date" 
import ="java.net.URLDecoder" 
import= "java.net.URLEncoder"  
import="org.springframework.context.ApplicationContext"
import ="org.springframework.context.support.ClassPathXmlApplicationContext"
import="com.contract.*"
import="com.company.*"
import="com.LoginAndRegist.*"
import="com.manage.*"
import="com.project.*"
import ="java.util.Set"
%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'detail.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<style type="text/css">
.addbox {
	width: 1000px;
	font-size: 19px;
	margin-left: 5%;
	line-height: 200%;
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
<%
	String con_id = request.getQueryString();
	if(con_id==null||con_id.length()==0){
		con_id=session.getAttribute("contract_id").toString();
	}else{
		session.setAttribute("contract_id", con_id);
	}
	ApplicationContext ctx=new ClassPathXmlApplicationContext("applicationContext.xml");
	ContractImpl conImpl=(ContractImpl)ctx.getBean(ContractImpl.class);
	ProjectManage proMan=conImpl.QueryContract(con_id);
	ProjectInfo proInfo=proMan.getProjectInfo();
	Set<Company> companies=proInfo.getCompanies();
	String pro_id=proInfo.getProId();
	String pro_name=proInfo.getProName();
	String pro_property=proInfo.getProProperty();
	String pro_type=proInfo.getProType();
	double pro_cost=proInfo.getProCost();
	String pro_state=proInfo.getProState();
	Date pro_start_time=proInfo.getProStartTime();
	Date pro_finish_time=proInfo.getProFinishTime();
	double pro_rest_cost=proInfo.getProRestCost();
	int len=companies.size();
	String com_id="",com_name="",com_property="",con_name="",con_number="",con_email="";
	String com_id_two="",com_name_two="",com_property_two="",con_name_two="",con_number_two="",con_email_two="";
		int i=0;
		for(Company company : companies){
			if(i==0){
			i++;
			com_id=company.getComId();
			com_name=company.getComName();
			com_property=company.getComProperty();
			con_name=company.getContactName();
			con_number=company.getContactNumber();
			con_email=company.getContactEmail();
			}else{
			com_id_two=company.getComId();
			com_name_two=company.getComName();
			com_property_two=company.getComProperty();
			con_name_two=company.getContactName();
			con_number_two=company.getContactNumber();
			con_email_two=company.getContactEmail();
			
			}
		}	
	
	
	
	%>
	<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
	
<script type="text/javascript">
	window.onload = function() {
		var c_name = location.search.substring(1, location.search.length);
		if (document.cookie.length > 0) {
			c_start = document.cookie.indexOf(c_name + "=")
			if (c_start != -1) {
				c_start = c_start + c_name.length + 1
				c_end = document.cookie.indexOf(";", c_start)
				if (c_end == -1)
					c_end = document.cookie.length
				var com_count= unescape(document.cookie.substring(c_start, c_end));
				if(com_count=="2"){
					document.getElementById("research").style.display="block";
					var div = document.getElementById("research_two");
					div.style.display = "block";
					document.getElementById("keyan").style.display="block";
					document.getElementById("showInfo").style.display="none";
				}else if(com_count=="1"){
					var div = document.getElementById("research");
					div.style.display = "block";
					document.getElementById("keyan").style.display="block";
				}
			}
		}
		for(var i=0;i<document.getElementById("pp").options.length;i++){ 
			if(document.getElementById("pp").options[i].value==="<%=pro_property%>"){ 
				document.getElementById("pp").options[i].selected=true; 
				} 
		}
		for(var i=0;i<document.getElementById("pt").options.length;i++){ 
			if(document.getElementById("pt").options[i].value==="<%=pro_type%>"){ 
				document.getElementById("pt").options[i].selected=true; 
				} 
		}  
		for(var i=0;i<document.getElementById("cp").options.length;i++){ 
			if(document.getElementById("cp").options[i].value==="<%=com_property%>"){ 
				document.getElementById("cp").options[i].selected=true; 
				} 
		}  
		for(var i=0;i<document.getElementById("cpt").options.length;i++){ 
			if(document.getElementById("cpt").options[i].value==="<%=com_property_two%>"){ 
				document.getElementById("cpt").options[i].selected=true; 
				} 
		}  
	}
</script>
<script>
function changeActionToUpdate(){
	var actname=document.myform.attributes["action"].value;
	if(actname=="del"){
		document.myform.action="updateProject";
	}
}
function changeActionToDelete(){
	var actname=document.myform.attributes["action"].value;
	if(actname=="updateProject"){
		document.myform.action="del";
	}
}
function showUpdate(){
	document.getElementById("savebtn").style.display="inline";
	document.getElementById("changebtn").style.display="none";
	if(document.getElementById("research_two").style.display=="block"){
		document.getElementById("showInfo").style.display="none";
	}else{
		document.getElementById("showInfo").style.display="block";
	}
}

function showTwoCompany(){
	document.getElementById("keyan").style.display="block";
	if(document.getElementById("research").style.display=="none"){
		document.getElementById("research").style.display="inline";
	}else{
		document.getElementById("research_two").style.display="inline";
		document.getElementById("showInfo").style.display="none";
	}
}

</script>
<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>

</head>
<body>
	
	<div class="title">
	科研项目详情
	</div><br/>
	<span style="font-size:28px;margin-left:45px;">项目信息</span>
	<br>
	<br>
	<form  method="post"  action="del"  class="addbox" id="myform" name="myform">
		<div style="float:left;">
		<table  style="line-height:200%;">
		<tr>
			<td>用户名：</td>
			<td><input type="text" name="username" 
				style="width:250px;height:30px;font-size:17px"  value=<%=user%> disabled="disabled"></td>
		</tr>
		<tr>
			<td>项目编号：</td>
			<td><input type="text" name="project_id"
				style="width:250px;height:30px;font-size:17px"  value=<%out.print(pro_id);%>  required="required"></td>
		</tr>
		<tr>
			<td>项目名称：</td>
			<td><input type="text" name="project_name"
				style="width:250px;height:30px;font-size:17px" value=<%out.print(pro_name);%>  required="required"></td>
		</tr>
		<tr>
			<td>项目性质：</td>
			<td><select id="pp" style="width:250px;height:30px;font-size:15px"
				name="project_property" >
				<option value="国家863">国家863</option>
				<option value="国家973">国家973</option>
				<option value="国家自然科学基金">国家自然科学基金</option>
				<option value="横向等">横向等</option>
			</select> </td>
			</tr>
			<!--  -->
			<tr>
			<td>项目类型：</td>
			 <td><select id="pt" name="project_type"
				style="width:250px;height:30px;font-size:15px">
				<option value="软件技术">软件技术</option>
				<option value="规范设计">规范设计</option>
				<option value="计算机应用">计算机应用</option>
			</select> </td>
			</tr>
			<!--  <-->
			<tr>
			<td>项目总费用：</td>
			<td><input type="text" name="project_cost" onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9-]+/,'');}).call(this)" onblur="this.v();" 
				style="width:250px;height:30px;font-size:17px" value=<%out.print(pro_cost);%>  required="required">单位：千元</td>
			</tr>
				</table>
		</div>
		<div style="float:right;">
		<table  style="line-height:200%;">
		<tr>
			<td>项目状态：</td>
			<td><input  type="text" name="project_state"
				style="width:250px;height:30px;font-size:17px" value=<%out.print(pro_state);%>  required="required"></td>
		</tr>
		<tr>
			<td>开始日期：</td>
			<td><input type="text" name="project_start_time"  id="start_time"
				style="width:250px;height:30px;font-size:17px"  onfocus="WdatePicker();"  value=<%out.print(pro_start_time);%>  required="required"></td>
		</tr>
		<tr>
			<td>结题日期：</td>
			<td><input type="datetime" name="project_finish_time"
				style="width:250px;height:30px;font-size:17px" onclick="WdatePicker();"  value=<%out.print(pro_finish_time);%>  required="required"></td>
		</tr>
		<tr>
			<td>费用余额：</td>
			<td><input onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9-]+/,'');}).call(this)" onblur="this.v();" 
				type="text" name="project_rest_cost"
				style="width:250px;height:30px;font-size:17px"  value=<%out.print(pro_rest_cost);%>  required="required"></td>
		</tr>
		<tr>
				<td>合同编号：</td>
				<td><input type="text" name="contract_id"
				style="width:250px;height:30px;font-size:17px" value=<%out.print(con_id);%>  required="required"></td>
		</tr>
		</table>
		</div>
		<div style="clear: both;padding-top:30px;display: none;" id="keyan" >
			<span style="font-size:28px;" >科研单位</span><br><br>
		</div>
		<div id="research" style="display:none;clear:both;">
			<div style="float:left;">
			<table style="line-height:200%;">
			<tr>
				<td>单位编号：</td>
				<td><input type="text" name="company_id"
					style="width:250px;height:30px;font-size:17px" value=<%out.print(com_id);%> ></td>
			</tr>
			<tr>
				<td>单位名称：</td>
				<td><input  type="text" name="company_name"
					style="width:250px;height:30px;font-size:17px" value=<%out.print(com_name);%> ></td>
			</tr>
			<tr>
				<td>单位性质： </td>
				<td><select id="cp" name="company_property"
					style="width:250px;height:30px;font-size:15px">
					<option value="高校">高校</option>
					<option value="研究所">研究所</option>
					<option value="企业">企业</option>
				</select> </td>
			</tr>
			<!--  -->
				</table>
				<br><br>
			</div>
			<div style="float:right;">
			<table style="line-height:200%;">
				<tr>
				<td>联系人：</td>
				<td><input type="text" name="contact_name"
					style="width:250px;height:30px;font-size:17px" value=<%out.print(con_name);%> ></td>
				</tr>
				<tr>
				<td>电话号码：</td>
				<td><input type="text" name="contact_number"
					style="width:250px;height:30px;font-size:17px" value=<%out.print(con_number);%> ></td>
				</tr>
				<tr>
				<td>电子信箱：</td>
				<td><input type="text" name="contact_email"
					style="width:250px;height:30px;font-size:17px" value=<%out.print(con_email);%> ></td>
				</tr>
					</table><br><br>	
			</div>
		</div>
		<div id="showInfo" style="clear: both;margin-top:15px;display:none;">如果另有公司合作,请<span id="showTwo" onclick="showTwoCompany()" style="color:#6666ff;cursor:pointer;">点击展开</span></div>
		<div id="research_two" style="display:none;">
			<div style="float:left;">
			<table style="line-height:200%;">
			<tr>
				<td>单位编号：</td>
				<td><input type="text" name="company_id_two"
					style="width:250px;height:30px;font-size:17px" 
					value=<% out.print(com_id_two);%> ></td>
			</tr>
			<tr>
				<td>单位名称：</td>
				<td><input  type="text" name="company_name_two"
					style="width:250px;height:30px;font-size:17px" value=<%out.print(com_name_two);%> ></td>
			</tr>
			<tr>
				<td>单位性质： </td>
				<td><select id="cpt" name="company_property_two"
					style="width:250px;height:30px;font-size:15px">
					<option value="高校">高校</option>
					<option value="研究所">研究所</option>
					<option value="企业">企业</option>
				</select> </td>
			</tr>
			<!--  -->
				</table>
				<br><br>
			</div>
			<div style="float:right;">
			<table style="line-height:200%;">
				<tr>
				<td>联系人：</td>
				<td><input type="text" name="contact_name_two"
					style="width:250px;height:30px;font-size:17px" value=<%out.print(con_name_two);%> ></td>
				</tr>
				<tr>
				<td>电话号码：</td>
				<td><input type="text" name="contact_number_two"
					style="width:250px;height:30px;font-size:17px" value=<%out.print(con_number_two);%> ></td>
				</tr>
				<tr>
				<td>电子信箱：</td>
				<td><input type="text" name="contact_email_two"
					style="width:250px;height:30px;font-size:17px" value=<%out.print(con_email_two);%> ></td>
				</tr>
					</table><br><br>	
			</div>
		</div>
		<div style="clear:both;" ></div>
		<s:fielderror name="error"></s:fielderror>
		<input onclick="changeActionToUpdate()" id="savebtn" type="submit" style="background:transparent;color:#000;font-size:25px;margin:auto;width:100px;height:50px;display:none;" value="保存">
		<input onclick="showUpdate()" type="button" id="changebtn" style="background:transparent;color:#000;font-size:25px;margin:auto;width:100px;height:50px;" value="修改">
		<input onclick="changeActionToDelete()" type="submit" style="background:transparent;color:#000;font-size:25px;margin:auto;width:100px;height:50px;margin-top:20px;" value="删除">
	</form>
</body>
</html>