<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="gb2312"%>
<%
request.setCharacterEncoding("gb2312");
Connection conn=null;
ResultSet rs=null;
PreparedStatement pstmt=null;
String sql="INSERT INTO physical_data VALUES(?,?,?,?,?,?,?,?,?,?,?)";
try{
Class.forName("com.mysql.jdbc.Driver");
}catch(Exception e){
 out.print(e);
}
try{
String URI="jdbc:mysql://localhost/student";
conn=DriverManager.getConnection(URI,"root","root");
pstmt=conn.prepareStatement(sql);
for(int i=0;i<20;i++){
  for(int j=0;j<11;j++){
  String tem1=String.valueOf(i)+String.valueOf(0);
  if(request.getParameter(tem1)!=null&&request.getParameter(tem1)!=""){
  String tem=String.valueOf(i)+String.valueOf(j);
  pstmt.setString(j+1,request.getParameter(tem));
  }else{
     continue;
  }
 }
  pstmt.addBatch();
}
int trmp[]=pstmt.executeBatch();
System.out.println("更新了"+trmp.length+"条数据。。");
pstmt.close();
conn.close();
}catch(SQLException e){
out.print(e);
}
out.println("<script>alert('录入成功！');window.location.href='EditData.jsp';</script>");
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'Main.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  <body>
  </body>
</html>
