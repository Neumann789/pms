<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% 
String   path   =   request.getContextPath();  
String   basePath   =   request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>支付运营系统</title>
<link rel="stylesheet" type="text/css" href="<%=basePath%>easyui-1.5.1/themes/gray/easyui.css">
<style type="text/css">
	body{
	    margin:0 auto;
	    text-align:center
	}
</style>
<script type="text/javascript" src="<%=basePath%>easyui-1.5.1/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath%>easyui-1.5.1/jquery.easyui.min.js"></script>
</head>
<body>
	<div class="easyui-panel"  style="width:400px" >
		<div style="padding:10px 60px 20px 60px">
	    <form id="ff" method="post">
	    	<table cellpadding="5">
	    		<tr>
	    			<td>Name:</td>
	    			<td><input class="easyui-textbox" type="text" name="name" data-options="required:true"></input></td>
	    		</tr>
	    		<tr>
	    			<td>Email:</td>
	    			<td><input class="easyui-textbox" type="text" name="email" data-options="required:true,validType:'email'"></input></td>
	    		</tr>
	    		<tr>
	    			<td>Subject:</td>
	    			<td><input class="easyui-textbox" type="text" name="subject" data-options="required:true"></input></td>
	    		</tr>
	    		<tr>
	    			<td>Message:</td>
	    			<td><input class="easyui-textbox" name="message" data-options="multiline:true" style="height:60px"></input></td>
	    		</tr>
	    		<tr>
	    			<td>Language:</td>
	    			<td>
	    				<select class="easyui-combobox" name="language">
	    				<option value="ar">Arabic</option>
	    				<option value="bg">Bulgarian</option>
	    				<option value="ca">Catalan</option>
	    				<option value="zh-cht">Chinese Traditional</option>
	    				</select>
					</td>
	    		</tr>
	    	</table>
	    </form>
	     <div style="text-align:center;padding:5px">
	    	<a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()">查询</a>
	    	<a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm()">重置</a>
	    </div>
	    </div>
	</div>
	<script>
		function loadLocal(){
			$('#ff').form('load',{
				name:'myname',
				email:'mymail@gmail.com',
				subject:'subject',
				message:'message',
				language:'en'
			});
		}
		function loadRemote(){
			$('#ff').form('load', 'form_data1.json');
		}
		function clearForm(){
			$('#ff').form('clear');
		}
		
		function submitForm(){
			$('#ff').form('submit',{
				onSubmit:function(){
					return $(this).form('enableValidation').form('validate');
				}
			});
		}
		function clearForm(){
			$('#ff').form('clear');
		}
	</script>
</body>
</html>