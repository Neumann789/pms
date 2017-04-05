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
<script type="text/javascript" src="<%=basePath%>easyui-1.5.1/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath%>easyui-1.5.1/jquery.easyui.min.js"></script>
<style type="text/css">
body {
	font: 12px/20px "微软雅黑", "宋体", Arial, sans-serif, Verdana, Tahoma;
	padding: 0;
	margin: 0;
}
a:link {
 text-decoration: none;
}
a:visited {
 text-decoration: none;
}
a:hover {
 text-decoration: underline;
}
a:active {
 text-decoration: none;
}
.cs-north {
	height:60px;background:#B3DFDA;
}
.cs-north-bg {
	width: 100%;
	height: 100%;
	background: url(<%=basePath%>easyui-1.5.1/themes/gray/images/header_bg.png) repeat-x;
}
.cs-north-logo {
	height: 40px;
	padding: 15px 0px 0px 5px;
	color:#fff;font-size:22px;font-weight:bold;text-decoration:none
}
.cs-west {
	width:200px;padding:0px;border-left:1px solid #99BBE8;
}
.cs-south {
	height:25px;background:url('<%=basePath%>easyui-1.5.1/themes/gray/images/panel_title.gif') repeat-x;padding:0px;text-align:center;
}
.cs-navi-tab {
	padding: 5px;
}
.cs-tab-menu {
	width:120px;
}
.cs-home-remark {
	padding: 10px;
}
li
{
list-style-type:none;
}
</style>
<script type="text/javascript">
function addTab(title, url){
	if ($('#tabs').tabs('exists', title)){
		$('#tabs').tabs('select', title);//选中并刷新
		var currTab = $('#tabs').tabs('getSelected');
		var url = $(currTab.panel('options').content).attr('src');
		if(url != undefined && currTab.panel('options').title != 'Home') {
			$('#tabs').tabs('update',{
				tab:currTab,
				options:{
					content:createFrame(url)
				}
			})
		}
	} else {
		var content = createFrame(url);
		$('#tabs').tabs('add',{
			title:title,
			content:content,
			closable:true
		});
	}
	tabClose();
}
function createFrame(url) {
	var s = '<iframe scrolling="auto" frameborder="0"  src="'+url+'" style="width:100%;height:100%;"></iframe>';
	return s;
}
		
function tabClose() {
	/*双击关闭TAB选项卡*/
	$(".tabs-inner").dblclick(function(){
		var subtitle = $(this).children(".tabs-closable").text();
		$('#tabs').tabs('close',subtitle);
	})
	/*为选项卡绑定右键*/
	$(".tabs-inner").bind('contextmenu',function(e){
		$('#mm').menu('show', {
			left: e.pageX,
			top: e.pageY
		});

		var subtitle =$(this).children(".tabs-closable").text();

		$('#mm').data("currtab",subtitle);
		$('#tabs').tabs('select',subtitle);
		return false;
	});
}		
//绑定右键菜单事件
function tabCloseEven() {
	//刷新
	$('#mm-tabupdate').click(function(){
		var currTab = $('#tabs').tabs('getSelected');
		var url = $(currTab.panel('options').content).attr('src');
		if(url != undefined && currTab.panel('options').title != 'Home') {
			$('#tabs').tabs('update',{
				tab:currTab,
				options:{
					content:createFrame(url)
				}
			})
		}
	})
	//关闭当前
	$('#mm-tabclose').click(function(){
		var currtab_title = $('#mm').data("currtab");
		$('#tabs').tabs('close',currtab_title);
	})
	//全部关闭
	$('#mm-tabcloseall').click(function(){
		$('.tabs-inner span').each(function(i,n){
			var t = $(n).text();
			if(t != 'Home') {
				$('#tabs').tabs('close',t);
			}
		});
	});
	//关闭除当前之外的TAB
	$('#mm-tabcloseother').click(function(){
		var prevall = $('.tabs-selected').prevAll();
		var nextall = $('.tabs-selected').nextAll();		
		if(prevall.length>0){
			prevall.each(function(i,n){
				var t=$('a:eq(0) span',$(n)).text();
				if(t != 'Home') {
					$('#tabs').tabs('close',t);
				}
			});
		}
		if(nextall.length>0) {
			nextall.each(function(i,n){
				var t=$('a:eq(0) span',$(n)).text();
				if(t != 'Home') {
					$('#tabs').tabs('close',t);
				}
			});
		}
		return false;
	});
	//关闭当前右侧的TAB
	$('#mm-tabcloseright').click(function(){
		var nextall = $('.tabs-selected').nextAll();
		if(nextall.length==0){
			//msgShow('系统提示','后边没有啦~~','error');
			alert('后边没有啦~~');
			return false;
		}
		nextall.each(function(i,n){
			var t=$('a:eq(0) span',$(n)).text();
			$('#tabs').tabs('close',t);
		});
		return false;
	});
	//关闭当前左侧的TAB
	$('#mm-tabcloseleft').click(function(){
		var prevall = $('.tabs-selected').prevAll();
		if(prevall.length==0){
			alert('到头了，前边没有啦~~');
			return false;
		}
		prevall.each(function(i,n){
			var t=$('a:eq(0) span',$(n)).text();
			$('#tabs').tabs('close',t);
		});
		return false;
	});

	//退出
	$("#mm-exit").click(function(){
		$('#mm').menu('hide');
	})
}

$(function() {
	tabCloseEven();
	$('.cs-navi-tab').click(function() {
		var $this = $(this);
		var href = $this.attr('src');
		var title = $this.text();
		addTab(title, href);
	});
});
</script>
</head>
<body class="easyui-layout">
	<div region="north" border="true" class="cs-north">
		<div class="cs-north-bg"><div class="cs-north-logo">支付运营系统</div></div>
	</div>
	<div region="west" border="true" split="true" title="功能列表" class="cs-west">
		<div class="easyui-accordion" fit="true" border="false">
				
				<div title="查询交易列表" align="justify">
					<li><a href="javascript:void(0);" src="<%=basePath%>pageForward?pageForward=search/searchFxoData" class="cs-navi-tab">流出批量流水查询</a></li>
					<li><a href="javascript:void(0);" src="<%=basePath%>pageForward?pageForward=search/searchFxiData" class="cs-navi-tab">流入批量流水查询</a></li>
				</div>
				
				<!-- <div title="刷新缓存" align="justify">
					<li><a href="javascript:void(0);" src="demo/draggable.html" class="cs-navi-tab">front刷新缓存</a></li>
					<li><a href="javascript:void(0);" src="demo/easyloader.html" class="cs-navi-tab">fmd刷新缓存</a></li>
					<li><a href="javascript:void(0);" src="demo/droppable.html" class="cs-navi-tab">carbin刷新缓存</a></li>
					<li><a href="javascript:void(0);" src="demo/droppable.html" class="cs-navi-tab">paycore刷新缓存</a></li>
					<li><a href="javascript:void(0);" src="demo/droppable.html" class="cs-navi-tab">fxi刷新缓存</a></li>
					<li><a href="javascript:void(0);" src="demo/droppable.html" class="cs-navi-tab">fxo刷新缓存</a></li>
					<li><a href="javascript:void(0);" src="demo/droppable.html" class="cs-navi-tab">fir刷新缓存</a></li>
					<li><a href="javascript:void(0);" src="demo/droppable.html" class="cs-navi-tab">bcm刷新缓存</a></li>
					<li><a href="javascript:void(0);" src="demo/droppable.html" class="cs-navi-tab">ccdc刷新缓存</a></li>
					<li><a href="javascript:void(0);" src="demo/droppable.html" class="cs-navi-tab">mgw刷新缓存</a></li>
				</div> -->
		</div>
	</div>
	<div id="mainPanle" region="center" border="true" border="false">
		 <div id="tabs" class="easyui-tabs"  fit="true" border="false" >
                <div title="Home">
				<div class="cs-home-remark">
					<h1>支付运营系统</h1> <br>
					制作：支付网关组 <br>
					内容：主要集成支付网关一下运营功能<br>
				</div>
				</div>
        </div>
	</div>

	<div region="south" border="false" class="cs-south">fanghuabao@zillionfortune.com</div>
	
	<div id="mm" class="easyui-menu cs-tab-menu">
		<div id="mm-tabupdate">刷新</div>
		<div class="menu-sep"></div>
		<div id="mm-tabclose">关闭</div>
		<div id="mm-tabcloseother">关闭其他</div>
		<div id="mm-tabcloseall">关闭全部</div>
	</div>
</body>
</html>