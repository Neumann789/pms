<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>支付运营系统</title>
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>easyui-1.5.1/themes/gray/easyui.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>easyui-1.5.1/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>easyui-1.5.1/themes/color.css">
<style type="text/css">
table td{
	text-align:right;
}
</style>
<script type="text/javascript"
	src="<%=basePath%>easyui-1.5.1/jquery.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>easyui-1.5.1/jquery.easyui.min.js"></script>
<script type="text/javascript">
Date.prototype.format = function(format){ 
	var o = { 
	"M+" : this.getMonth()+1, //month 
	"d+" : this.getDate(), //day 
	"h+" : this.getHours(), //hour 
	"m+" : this.getMinutes(), //minute 
	"s+" : this.getSeconds(), //second 
	"q+" : Math.floor((this.getMonth()+3)/3), //quarter 
	"S" : this.getMilliseconds() //millisecond 
	} 

	if(/(y+)/.test(format)) { 
	format = format.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length)); 
	} 

	for(var k in o) { 
	if(new RegExp("("+ k +")").test(format)) { 
	format = format.replace(RegExp.$1, RegExp.$1.length==1 ? o[k] : ("00"+ o[k]).substr((""+ o[k]).length)); 
	} 
	} 
	return format; 
	} 

	function doSearch() {
		$('#tt').datagrid('load', {
			memberId : $('#memberId').val(),
			payId : $('#payId').val(),
			mobile : $('#mobile').val(),
			status : $('#status').val(),
			beginTime : $('#beginTime').val(),
			endTime : $('#endTime').val()
		});
	}
	
	function doReset() {
		
		$('#tbForm')[0].reset();
		
	}
	
    
    function timeFormatter(value,row){  
        var unixTimestamp = new Date(value);  
        //return unixTimestamp.toLocaleString(); 
        return unixTimestamp.format("yyyy-MM-dd hh:mm:ss");
    }  
    
    function payStatusFormatter(value,row){
    	if(value=='U'){
    		return '初始';
    	}else if(value=='P'){
    		return '处理中';
    	}else if(value=='S'){
    		return '成功';
    	}else if(value=='M'){
    		return '短信验证';
    	}
    	
    	return value;
    	
    }
</script>
</head>
<body>
	<div align="center">
		<div id="tb" style="padding: 3px" align="center">
		<form id="tbForm">
		<table>
			<tr>
				<td>
					<span>会员编号:</span> 
					<input id="memberId" style="line-height: 22px; border: 1px solid #ccc">
				</td>
				<td></td>
				<td>
					<span>支付流水:</span> 
			 		<input id="payId" style="line-height: 22px; border: 1px solid #ccc"> 
				</td>
			</tr>
			<tr>
				<td>
					 <span>手机号:</span> 
					 <input id="mobile" style="line-height: 22px; border: 1px solid #ccc">
				</td>
				<td></td>
				<td>
					<span>支付状态:</span> 
			 		<select id="status" class="easyui-combobox" style="line-height: 22px;width: 150px; border: 1px solid #ccc">
						<option value="">&nbsp;&nbsp;</option>
						<option value="U">初始</option>
						<option value="P">处理中</option>
						<option value="S">成功</option>
						<option value="M">短信验证</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>
					 <span>开始时间:</span> 
					 <input id="beginTime" class="easyui-datetimebox" style="line-height: 22px; border: 1px solid #ccc">
				</td>
				<td></td>
				<td>
					 <span>结束时间:</span> 
					 <input id="endTime" class="easyui-datetimebox"  style="line-height: 22px; border: 1px solid #ccc"> 
				</td>
			</tr>
			<tr height="22px">
			</tr>
			<tr>
				<td>
				</td>
				<td>
					<a href="#" class="easyui-linkbutton c8"  plain="true" onclick="doSearch()">Search</a>
					<span>&nbsp;&nbsp;</span>
				    <a href="#" class="easyui-linkbutton c8"  plain="true" onclick="doReset()">Reset</a>
				</td>
				<td>
				</td>
			</tr>
		</table>
		</form>
		</div>

		<table id="tt" class="easyui-datagrid"
			style="width: 1400px; height: 750px" url="<%=basePath%>search/searchFxiData.json"
			toolbar="#tb" title="查询" iconCls="icon-save" rownumbers="true" pagination="true">
			<thead>
				<tr>
					<th field="payId" width="130" align="center">支付流水</th>
					<th field="memberName" width="100" align="center">客户姓名</th>
					<th field="mobile" width="100" align="center">手机号</th>
					<th field="goodsName" width="100" align="center">商品名称</th>
					<th field="payStatus"  formatter="payStatusFormatter" width="100" align="center">支付状态</th>
					<th field="memberId" width="100" align="center">会员编号</th>
					<th field="bankRspCode" width="100" align="center">银行返回码</th>
					<th field="bankRspMsg" width="100" align="center">银行返回信息</th>
					<th field="rspCode" width="100" align="center">内部返回码</th>
					<th field="rspMsg" width="100" align="center">内部返回信息</th>
					<th field="acctNo" width="130" align="center">卡索引号</th>
					<th field="idCard" width="130" align="center">证件号</th>
					<th field="createTime" formatter="timeFormatter" width="130" align="center">创建时间</th>
				</tr>
			</thead>
		</table>

	</div>
</body>
</html>