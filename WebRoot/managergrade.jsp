<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@include file="common.jsp" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">   
    <title>Index</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<script type="text/javascript" src="<%=basePath %>js/managergrade.js"></script>
  </head>
  <body>  
  <!-- 主界面 -->
   
  <div id="listToolBar" style="background-color:silver;padding-bottom:5px;height:auto;">
   <input type="text" name="keyword" id="keyword"/>
   <input type="button" name="commit" id="commit" value="搜索班级"/><br>
  	<a href="javascript:;" name="add" id="add" class="easyui-linkbutton" 
  		data-options="iconCls:'icon-add'" plain="true">添加记录</a>
  	<a href="javascript:;" name="edit" id="edit" class="easyui-linkbutton" 
  		data-options="iconCls:'icon-edit'" plain="true">修改记录</a>
  	<a href="javascript:;" name="del" id="del" class="easyui-linkbutton" 
  		data-options="iconCls:'icon-remove'" plain="true">删除记录</a>
  	<a href="Firstpage.jsp" name="return" id="return" class="easyui-linkbutton" 
  		data-options="iconCls:'icon-redo'" plain="true">返回主页</a>
  </div>
  <div id="listGrid" class="easyui-datagrid" fit="true"  style="width:312px;height:380px;"
  	data-options="singleSelect:true,toolbar:'#listToolBar',striped:true,rownumbers:true "></div>
  	<div id="listInput" class="easyui-window"
			data-options="modal:true,closed:true,collapsible:false,maximizable:false,minimizable:false" >
			<form id="listForm" border="0" align="center">
				<div class="easyui-panel cursom_panle" style="width: 290px">
					<a id="listSave" href="javascript:;" class="easyui-linkbutton" plain="true" 
						data-options="iconCls:'icon-save'">保存</a>
					<a href="javascript:;" class="easyui-linkbutton" plain="true" 
						data-options="iconCls:'icon-undo'" onclick="$('#listInput').window('close', true)">退出</a>
				</div>
				<table >
					<tr>
						<td>学号</td>
						<td>
							<input type="text" name="stunumber" id="stunumber">
						</td>
					</tr>
					<tr>
						<td>班级</td>
						<td><input type="text" name="classname" id="classname" >
						</td>
					</tr>
					<tr>
						<td>姓名</td>
						<td>
							<input type="text" name="name" id="name">
						</td>
					</tr>
					<tr>
						<td>身高</td>
						<td>
							<input type="text" name="height" id="height">
						</td>
					</tr>
					<tr>
						<td>体重</td>
						<td>
							<input type="text" name="weight" id="weight">
						</td>
					</tr>
					<tr>
						<td>肺活量</td>
						<td>
							<input type="text" name="VitalCapacity" id="VitalCapacity">
						</td>
					</tr>
					<tr>
						<td>50米跑</td>
						<td>
							<input type="text" name="run50" id="run50">
						</td>
					</tr>
					<tr>
						<td>立定跳远</td>
						<td>
							<input type="text" name="StandJump" id="StandJump">
						</td>
					</tr>
					<tr>
						<td>坐位体前屈</td>
						<td>
							<input type="text" name="SitReach" id="SitReach">
						</td>
					</tr>
					<tr>
						<td>800/1000米跑</td>
						<td>
							<input type="text" name="run800or1000" id="run800or1000">
						</td>
					</tr>
					<tr>
						<td>引体向上/仰卧起坐</td>
						<td>
							<input type="text" name="situporChinning" id="situporChinning">
						</td>
					</tr>
				</table>
			</form>
		</div>	
  </body>
</html>