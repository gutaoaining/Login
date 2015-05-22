<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'Firstpage.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  <center>
  <body background="Imgsrc/2.jpg">
    <input id="Button1" type="button" value="条件查询届面" 
    onclick="window.location.href='tablecheck.jsp'" />
    <input id="Button1" type="button" value="总体查询界面" 
    onclick="window.location.href='index.jsp'" />
     <input id="Button1" type="button" value="录入界面" 
    onclick="window.location.href='edit.jsp'" />
  </body>
  </center>
</html>
