<%@ page contentType="text/html;charset=gb2312" language="java"  import="java.util.*,java.sql.*" %>
<html>
 <head>
<center>
 <body   background="Imgsrc/2.jpg" >
  </body>
<form name="form1" method="post" action="checkresult.jsp">
<TABLE border="1"  align="center" width="408" height="182">
    <TR>
      <TD colspan="2" align="center"><font size="6"><strong><font face="楷体">班级体育成绩查询</font></strong></font></TD>
    </TR>
    <TR>
      <TD>选择要查寻关键字：</TD>
      <TD><SELECT name="selname">
        <OPTION>--请选择类别--</OPTION>
        <OPTION value="name">姓名</OPTION>
        <OPTION value="stunumber">学号</OPTION>
        <OPTION value="classname">班级</OPTION>
      </SELECT></TD>
    </TR> 
    <TR>
      <TD>输入要查寻关键字：</TD>
      <TD><input type="text" name="keyname" value=""></TD>
    </TR> 
    <tr>
    <td><div align="center"><input type="submit" name="g" value="查询"></td>
    <td><div align="center"><input type="reset" name="b" value="取消"></td>
    </tr>
  </TABLE>                                                                    
</form>
 </center>
  </head>
</html>