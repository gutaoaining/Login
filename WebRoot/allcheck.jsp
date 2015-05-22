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
	<script type="text/javascript" src="<%=basePath %>js/check.js"></script>
  </head>
  <body>  
  <!-- 主界面 -->
  <div id="listToolBar" style="background-color:silver;padding-bottom:5px;height:auto;">
    <input type="text" name="keyword" id="keyword"/>
    <input type="button" name="commit" id="commit" value="提交"/><br>
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
						<td>姓名</td>
						<td><input type="text" name="stuname" id="stuname" >
						</td>
					</tr>
					<tr>
						<td>班级编号</td>
						<td>
							<input type="text" name="class_id" id="class_id">
						</td>
					</tr>
					<tr>
						<td>班级名称</td>
						<td>
							<input type="text" name="class_name" id="class_name">
						</td>
					</tr>
					
					<tr>
						<td>名族编号</td>
						<td>
							<input type="text" name="nationalid" id="nationalid">
						</td>
					</tr>
					<tr>
						<td>性别</td>
						<td>
							<input type="text" name="sex" id="sex">
						</td>
					</tr>
					<tr>
						<td>生源</td>
						<td>
							<input type="text" name="stu_sources" id="stu_sources">
						</td>
					</tr>
					<tr>
						<td>出生日期</td>
						<td>
							<input type="text" name="birthday" id="birthday">
						</td>
					</tr>
					<tr>
						<td>年级编号</td>
						<td>
							<input type="text" name="stu_enr" id="stu_enr">
						</td>
					</tr>
					<tr>
						<td>身份证号</td>
						<td>
							<input type="text" name="per_id" id="per_id">
						</td>
					</tr>
					<tr>
						<td>家庭住址</td>
						<td>
							<input type="text" name="stu_adress" id="stu_adress">
						</td>
					</tr>
				</table>
			</form>
		</div>	
  </body>
</html>
