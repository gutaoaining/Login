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
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
	<link rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css"/>
	<link rel="stylesheet" type="text/css" href="easyui/themes/icon.css"/>
	<script type="text/javascript" src="easyui/jquery.min.js"></script>
	<script type="text/javascript" src="easyui/locale/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
<script language="javascript">
	function printme(){
	document.body.innerHTML=document.getElementById('div').innerHTML;
	window.print();
	}
	
</script>
</head>
 <body  background="Imgsrc/2.jpg"  >
  <input id="Button1" type="button" value="打印" 
        onclick="javascript:printme()" />
  <input id="Button1" type="button" value="返回首页" 
        onclick="window.location.href='Firstpage.jsp'" />
    <input id="Button1" type="button" value="导出excel" 
        onclick="window.location.href='index1.jsp?exportToExcel=YES'" />
    
  </body>
  <center>
<div id="div"> 
<table id="tt" class="easyui-datagrid" data-options="pageSize:30" style="width:1500;height:auto;">  
    <thead> 
        <tr>  
        <th data-options="field:'classid',width:50">班级编号</th> 
        <th data-options="field:'class',width:100">班级名称</th> 
        <th data-options="field:'studentnum',width:100">学籍号</th>
        <th data-options="field:'nationalid',width:100">民族代码</th>
        <th data-options="field:'name',width:100">姓          名</th>  
        <th data-options="field:'sex',width:50">性          别</th>  
       <th data-options="field:'birthday',width:50">生  日</th>
        <th data-options="field:'adress',width:350">家庭住址</th> 
        <th data-options="field:'height',width:50">身          高</th>  
        <th data-options="field:'weight',width:50">体          重</th>  
        <th data-options="field:'VitalCapacity',width:50">肺  活  量6</th>  
        <th data-options="field:'run50',width:50">跑步50米</th>  
        <th data-options="field:'StandJump',width:50">立定跳远</th>  
        <th data-options="field:'SitReach',width:50">坐位体前屈</th>  
        <th data-options="field:'run800or1000',width:100">跑800米/1000米</th>  
        <th data-options="field:'situporChinning',width:100">引体向上/仰卧起坐每分</th>    
        </tr>                            
    </thead>                             
    <tbody>    
    <% 
while(rs.next()){

%> 
     <tr>   
     <td ><%=rs.getString("class_id")%></td> 
      <td ><%=rs.getString("class_name")%></td>
       <td ><%=rs.getString("stunumber")%></td>
        <td ><%=rs.getString("nationalid")%></td>
     <td><%=rs.getString("stuname")%></td>
     <td ><%=rs.getString("sex")%></td>
     <td ><%=rs.getString("birthday")%></td>
     <td ><%=rs.getString("stu_adress")%></td>  
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
%>
  </tbody> 
<%con.close();%>                                                               
                              
</table>
</div>  
</center>
</html>