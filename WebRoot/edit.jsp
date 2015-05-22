<%@ page language="java"  import="java.util.*,java.sql.*" pageEncoding="UTF-8"%>
<%! 
String classname;
%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
request.setCharacterEncoding("UTF-8");
classname=request.getParameter("classname");
Connection con=null;
Statement stm=null;
ResultSet rs=null;
try{
Class.forName("com.mysql.jdbc.Driver");
}catch(Exception e){
 out.print(e);
}
String sql="select * from physical_data where classname="+"'"+classname+"'";
String URI="jdbc:mysql://localhost/student";
try{
con=DriverManager.getConnection(URI,"root","root");
stm=con.createStatement();
rs=stm.executeQuery(sql);
}catch(SQLException e){
out.print(e);
}
 %>
<html>
<head>
<script type="text/javascript" src="<%=basePath %>js/huanhang.js"></script>
<script type="text/javascript" src="<%=basePath %>js/checkform.js"></script>
</head>
 <body  background="Imgsrc/2.jpg">
     <form action="" method=post name=formname>
 请输入要录入的班级：<input type="text" name="classname"><input type="submit" name="Sumbit"  value="提交">
</form>
<FORM action="helpEdit" method=post name=form >
<input id="Button1" type="button" value="返回首页" 
        onclick="window.location.href='Second.jsp'" />
<input type="submit" name="Sumbit"  value="提交">
<input type="reset" name="Sumbit1"  value="清空"></br>
<table id="tt" >  
  <tr>  
      <td  width="50">学          号</td>
      <td  width="50">班          级</td>   
      <td  width="50">姓          名</td>  
      <td  width="50">身          高</td>  
      <td  width="50">体          重</td>  
      <td  width="50">肺  活  量</td>  
      <td  width="100">跑步50米</td>  
      <td  width="100">立定跳远</td>  
      <td  width="100">坐位体前屈</td>  
      <td  width="100">跑800米/1000米</td>  
      <td  width="100">引体向上/仰卧起坐每分</td>  
</tr> 
                                                       
<%
int i=0;
while(rs.next()){
%>
<tr>
 <%String stu=String.valueOf(i);%>
 <td><input type="text" style="width:100;" name="<%=stu%>" value=<%=rs.getString("stunumber")%>></td>
 <td><input type="text" style="width:100;" value=<%=rs.getString("classname")%>></td>
 <td><input type="text" style="width:100;" value=<%=rs.getString("name")%>></td>
 <%for(int j=0;j<8;j++){
 String tem=String.valueOf(i)+"_"+String.valueOf(j);
 %>
<td><input type="text"  id="<%=tem%>" name="<%=tem%>"  value="<%=rs.getString(j+4)%>" style="width:115;" onkeypress="return handleEnter(this, event)" onblur="clur(<%=j%>,'<%=tem%>')"></td>
<%
}%>
</tr>
<% 
i++;
}%> 
<tr><td><input type="hidden"  name="sum" value="<%=i%>"/></td><td><input type="hidden"  name="classname" value="<%=classname%>"/></td></tr>                                                                                                 
<%
  con.close();
  rs.close();
%> 
</table>  
</FORM>
</body>
</html>