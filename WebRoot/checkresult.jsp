<%@ page contentType="text/html" language="java"  import="java.util.*,java.sql.*" pageEncoding="gb2312"%>
<html>
 <head>
<%
request.setCharacterEncoding("gb2312");
String selname=request.getParameter("selname");
System.out.println(selname);
String keyname=request.getParameter("keyname");
System.out.println(keyname);
if((selname.equals("--请选择类别--"))||(keyname.equals(""))){
%>
<jsp:forward page="tablecheck.jsp"/>
<%}
Connection con=null;
Statement stm=null;
ResultSet rs=null;
try{
Class.forName("com.mysql.jdbc.Driver");
}catch(Exception e){
 out.print(e);
}
try{
String URI="jdbc:mysql://localhost/student";
con=DriverManager.getConnection(URI,"root","root");
stm=con.createStatement();
if(selname.equals("name")){
rs=stm.executeQuery("select * from physical_data where"+" "+selname+" like"+" '"+keyname+"%'");
System.out.println("select * from physical_data where"+" "+selname+" like"+" '"+keyname+"%'");
}else{
rs=stm.executeQuery("select * from physical_data where"+" "+selname+"="+"'"+keyname+"'");
}
}catch(SQLException e){
out.print(e);
}
 %>
 <script language="javascript">
	function printme(){
	document.body.innerHTML=document.getElementById('div').innerHTML;
	window.print();
	}
	</script>
</head>
 <body   background="Imgsrc/2.jpg" >
  </body>
<br><font size=16>数据库中查询到的记录：</font>
<form name="form">
 <input id="Button1" type="button" value="返回首页" 
        onclick="window.location.href='Second.jsp'" />
        <input id="Button1" type="button" value="录入界面" 
    onclick="window.location.href='edit.jsp'" />
<input id="Button1" type="button" value="打印" 
        onclick="javascript:printme()" />
</form>
<form name="form1" method="post" action="">
<center>
<div id="div">
   <TABLE border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse" id="result" align="center" >
   <tr>
      <td  width="100">学          号</td>  
      <td  width="100">班          级</td>  
      <td  width="100">姓          名</td>  
      <td  width="100">身          高</td>  
      <td  width="100">体          重</td>  
      <td  width="100">肺  活  量6</td>  
      <td  width="100">跑步50米</td>  
      <td  width="100">立定跳远</td>  
      <td  width="100">坐位体前屈</td>  
      <td  width="100">跑800米/1000米</td>  
      <td  width="100">引体向上/仰卧起坐每分</td>   
        </tr>
<% 
while(rs.next()){
%> 
<tr>                           
<td><%=rs.getString("stunumber")%></td>
<td><%=rs.getString("classname")%></td>
<td ><%=rs.getString("name")%></td>
<td ><%=rs.getString("height")%></td>
<td ><%=rs.getString("weight")%></td>
<td ><%=rs.getString("VitalCapacity")%></td>
<td ><%=rs.getString("run50")%></td>
<td ><%=rs.getString("StandJump")%></td>
<td ><%=rs.getString("SitReach")%></td>
<td ><%=rs.getString("run800or1000")%></td>
<td ><%=rs.getString("situporChinning")%></td> 
 </tr>        
<%
}
con.close();%>    
</TABLE> 
</div>  
 </center>                                                                           
</form>
</html>