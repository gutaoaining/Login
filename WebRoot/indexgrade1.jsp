<%@ page language="java"  import="java.util.*,java.sql.*" pageEncoding="gb2312"%>
<html>
  <head>
<%
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
rs=stm.executeQuery("select *from physical_data");
}catch(SQLException e){
out.print(e);
}
 %>
 </head>
 <body>
<%
        String exportToExcel = request.getParameter("exportToExcel");
        if (exportToExcel != null && exportToExcel.toString().equalsIgnoreCase("YES")) {
            response.setContentType("application/vnd.ms-excel");
            response.setHeader("Content-Disposition", "inline; filename="
                    + "excel.xls");
 
        }
    %>
     <%
        if (exportToExcel == null) {
    %>
    <a href="indexgrade1.jsp?exportToExcel=YES">Export to Excel</a>
    <%
        }
    %>
<table id="tb" class="common1" cellpadding="5" cellspacing="1" align="center">   
        <tr>  
            <td class=formtitle align="center" nowrap style="width:13%">学          号</td> 
             <td class=formtitle align="center" nowrap style="width:13%">班   级 </td>   
            <td class=formtitle align="center" nowrap style="width:13%">姓          名</td>  
            <td class=formtitle align="center" nowrap style="width:13%">身          高</td>  
            <td class=formtitle align="center" nowrap style="width:13%">体          重</td>  
            <td class=formtitle align="center" nowrap style="width:13%">肺  活  量</td>  
            <td class=formtitle align="center" nowrap style="width:13%">跑步50米</td>  
            <td class=formtitle align="center" nowrap style="width:13%">立定跳远</td>  
            <td class=formtitle align="center" nowrap style="width:13%">坐位体前屈</td>  
            <td class=formtitle align="center" nowrap style="width:13%">跑800米/1000米</td>  
            <td class=formtitle align="center" nowrap style="width:13%">引体向上/仰卧起坐每分</td>  
        </tr>                                                   
    <% 
while(rs.next()){

%> 
<tr>                             
<td align="center" nowrap style="width:13%"><%=rs.getString("stunumber")%></td>
<td align="center" nowrap style="width:13%"><%=rs.getString("classname")%></td>
<td align="center" nowrap style="width:13%"><%=rs.getString("name")%></td>
<td align="center" nowrap style="width:13%"><%=rs.getString("height")%></td>
<td align="center" nowrap style="width:13%"><%=rs.getString("weight")%></td>
<td align="center" nowrap style="width:13%"><%=rs.getString("VitalCapacity")%></td>
<td align="center" nowrap style="width:13%"><%=rs.getString("run50")%></td>
<td align="center" nowrap style="width:13%"><%=rs.getString("StandJump")%></td>
<td align="center" nowrap style="width:13%"><%=rs.getString("SitReach")%></td>
<td align="center" nowrap style="width:13%"><%=rs.getString("run800or1000")%></td>
<td align="center" nowrap style="width:13%"><%=rs.getString("situporChinning")%></td>   
</tr>  
<%
}
con.close();
%>                                                               
                              
</table> 
</body>
</html>