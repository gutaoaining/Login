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
rs=stm.executeQuery("select *from tb_students,physical_data where tb_students.stunumber=physical_data.stunumber");
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
    <a href="index1.jsp?exportToExcel=YES">Export to Excel</a>
    <%
        }
    %>
<table id="tb" class="common1" cellpadding="5" cellspacing="1" align="center">   
        <tr>  
        <td class=formtitle align="center" nowrap style="width:13%">班级编号</td> 
        <td class=formtitle align="center" nowrap style="width:13%">班级名称</td> 
        <td class=formtitle align="center" nowrap style="width:13%">学籍号</td>
        <td class=formtitle align="center" nowrap style="width:13%">民族代码</td>
        <td class=formtitle align="center" nowrap style="width:13%">姓          名</td>  
        <td class=formtitle align="center" nowrap style="width:13%">性          别</td>  
        <td class=formtitle align="center" nowrap style="width:13%">生   日</td> 
        <td class=formtitle align="center" nowrap style="width:13%">家庭住址</td> 
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
     <td align="center" nowrap style="width:13%"><%=rs.getString("class_id")%></td> 
     <td align="center" nowrap style="width:13%"><%=rs.getString("class_name")%></td>
     <td align="center" nowrap style="width:13%"><%=rs.getString("stunumber")%></td>
     <td align="center" nowrap style="width:13%"><%=rs.getString("nationalid")%></td>
     <td align="center" nowrap style="width:13%"><%=rs.getString("stuname")%></td>
     <td align="center" nowrap style="width:13%"><%=rs.getString("sex")%></td>
     <td align="center" nowrap style="width:13%"><%=rs.getString("birthday")%></td>
     <td align="center" nowrap style="width:13%"><%=rs.getString("stu_adress")%></td>  
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