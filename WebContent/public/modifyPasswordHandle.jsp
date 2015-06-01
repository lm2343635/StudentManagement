<%@ page language="java" contentType="text/html; charset=gb2312"%>
<%@ page import="com.mysql.jdbc.Driver"%>
<%@ page import="java.sql.*"%>
 <jsp:useBean id="connectDatabase" class="com.nefu.stumgr.bean.ConnectDatabase" />
 <html>
 <head>
 	<title>修改密码</title>
 </head>
 <body>
 <center>
 <img src="images/top.jpg"><br>
<%
request.setCharacterEncoding("GBK");
String OldPassword=request.getParameter("oldPassword");
String password=request.getParameter("password");
String ConfirmPassword=request.getParameter("ConfirmPassword");
String user=(String)session.getAttribute("user");
String inputPassword=(String)session.getAttribute("password");
if(OldPassword.equals(inputPassword))
{
	if(password.equals(ConfirmPassword))
	{
		connectDatabase.exeUpdate("update login set password='"+password+"' where user='"+user+"'");
		%>
		修改密码成功，请牢记新密码：<%=password %>
		<%
        connectDatabase.close();
	}
	else
	{
		%>两次输入的密码不一致，<a href="modifyPassword.html">重新填写密码</a><%
	}
}
else
{
	%>旧密码输入错误，<a href="modifyPassword.html">重新填写密码</a><%
}
%>
<br>
<a href="loginHandle.jsp">返回主页面</a>
</body>
</html>