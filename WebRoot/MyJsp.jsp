<%@ page contentType="text/html;charset=gb2312" language="java"  import="java.util.*,java.sql.*" %>
<html>
<head>
<center>
 <body   background="Imgsrc/123.jpg" >
  <font size="20" color="red"> 登录界面 <br>
  </body>
<form  method="post" action="helpLogin">
<table width="300" border="0" cellspacing="0" background="Imgsrc/b.jpg">
<tr>
<td width="100"><span class="stylel">用户账号：</span></td>
<td width="110"><input name="name" type="text" size="20"></td>
</tr>
<tr>
<td width="100"><span class="stylel">用户密码：</span></td>
<td width="110"><input name="pass" type="password"" size="20"></td>
</tr>
<tr>
<td width="100"><span class="stylel">选择用户：</span></td>
<td width="110"><select name="user" >
<option value="管理员">管理员</option>
<option value="普通用户">普通用户</option>
</td>
</tr>
<tr>
<td><div align="center">
    <input type="submit" name="Sumbit" style="height:20px;width:50px;background:gray" value="登录">
    </div></td>
<td><div align="center">
    <input type="reset" name="Sumbit1" style="height:20px;width:50px;background:gray" value="取消">
</div></td>
</tr>
</table>
</form>
</center>
</head>
</html>
