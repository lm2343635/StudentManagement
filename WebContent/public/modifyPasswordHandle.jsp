<%@ page language="java" contentType="text/html; charset=gb2312"%>
<%@ page import="com.mysql.jdbc.Driver"%>
<%@ page import="java.sql.*"%>
 <jsp:useBean id="connectDatabase" class="com.nefu.stumgr.bean.ConnectDatabase" />
 <html>
 <head>
 	<title>�޸�����</title>
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
		�޸�����ɹ������μ������룺<%=password %>
		<%
        connectDatabase.close();
	}
	else
	{
		%>������������벻һ�£�<a href="modifyPassword.html">������д����</a><%
	}
}
else
{
	%>�������������<a href="modifyPassword.html">������д����</a><%
}
%>
<br>
<a href="loginHandle.jsp">������ҳ��</a>
</body>
</html>