<%@ page language="java"  import="java.util.*,java.sql.*" pageEncoding="gb2312"%>
<html>
  <head>
<%
request.setCharacterEncoding("UTF-8");
//String name=request.getParameter("classname");
String sql="select * from physical_data";
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
rs=stm.executeQuery(sql);
}catch(SQLException e){
out.print(e);
}
 %>
 </head>
 <body>
  <input id="Button1" type="button" value="录入界面" 
    onclick="window.location.href='edit.jsp'" />
<table id="tb" class="common1" cellpadding="5" cellspacing="1" align="center">   
        <tr>  
          <td data-options="field:'stunumber',width:100">学          号</th>  
            <td data-options="field:'name',width:100">班          级</th>  
            <td data-options="field:'classid',width:100">姓          名</th>  
            <td data-options="field:'class',width:100">身          高</th>  
            <td data-options="field:'sex',width:100">体          重</th>  
            <td data-options="field:'sources',width:100">肺  活  量</th>  
             <td data-options="field:'birthday',width:100">跑步50米</th>  
            <td data-options="field:'stureo',width:100">立定跳远</th>  
            <td data-options="field:'perid',width:150">坐位体前屈</th>  
            <td data-options="field:'adress',width:150">跑800米/1000米</th> 
            <td data-options="field:'adress',width:150">引体向上/仰卧起坐每分</th> 
        </tr>                                                   
    <% 
while(rs.next()){
%> 
<tr>                             
<td align="center" nowrap ><%=rs.getString("stunumber")%></td>
<td align="center" nowrap ><%=rs.getString("classname")%></td>
<td align="center" nowrap ><%=rs.getString("name")%></td>
<td align="center" nowrap ><%=rs.getFloat("height")%></td>
<td align="center" nowrap ><%=rs.getFloat("weight")%></td>
<td align="center" nowrap ><%=rs.getString("VitalCapacity")%></td>
<td align="center" nowrap ><%=rs.getFloat("run50")%></td>
<td align="center" nowrap ><%=rs.getString("StandJump")%></td>
<td align="center" nowrap ><%=rs.getString("SitReach")%></td>
<td align="center" nowrap ><%=rs.getString("run800or1000")%></td> 
<td align="center" nowrap ><%=rs.getString("situporChinning")%></td>   
</tr>  
<%
}
con.close();
%>                                                               
                              
</table> 
</body>
</html>
