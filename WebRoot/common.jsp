<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<script type="text/javascript" src="<%=basePath %>js/EasyUI/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath %>js/EasyUI/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=basePath %>js/EasyUI/locale/easyui-lang-zh_CN.js"></script>

<link rel="stylesheet" type="text/css" href="<%=basePath %>js/EasyUI/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="<%=basePath %>js/EasyUI/themes/icon.css">
<script type="text/javascript">
	var basePath = "<%=basePath %>";
	function getRequestPath(path){
		return basePath+path;
	}
</script>

