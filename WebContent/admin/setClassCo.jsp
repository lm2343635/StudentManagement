<%@ page language="java" contentType="text/html; charset=gb2312"%>
<%@ page import="com.mysql.jdbc.Driver"%>
<%@ page import="java.sql.*"%>
 <jsp:useBean id="connectDatabase" class="com.nefu.stumgr.bean.ConnectDatabase" />
<%
String cono=request.getParameter("cono");
ResultSet rs=connectDatabase.exeQuery("select coname from college where cono="+cono);	
String coname="";
while(rs.next())
	coname= rs.getString("coname");
%>
<html>
	<head>
		<title><%=coname%>课程设置</title>
		<link rel="stylesheet" rev="stylesheet" href="../css/home.css" type="text/css">
		<link rel="stylesheet" rev="stylesheet" href="../css/myfont.css" type="text/css">
	</head>
	<body>
		<center>
		<img src="../images/top.jpg"><br>
		<jsp:include page="header.jsp"></jsp:include>
		<table width="750"  border="0">
			   <tr>
				     <td height="40" colspan="5" align="center" bgcolor="#0000FF">
				     	<myfont><%=coname%></myfont>
				     	<button type="button"  onClick="window.location.href='setClass.jsp'">返回</button>
				     </td>
			  </tr> 
			  <tr>
				     <td width="150" height="40" align="center" bgcolor="#D9FFFF">专业编号</td>
				     <td width="600" align="center" bgcolor="#D9FFFF">专业名称</td>
			  </tr>
		<%
		 rs=connectDatabase.exeQuery("select dno,dname from department where cono="+cono);	
		while(rs.next())
		{%>
			  <tr>
				     <td width="150" height="40" align="center" bgcolor="#D9FFFF"><%=rs.getString("dno") %></td>
				     <td width="600" align="center" bgcolor="#D9FFFF">
				     	<a href="setClassDe.jsp?dno=<%=rs.getString("dno")%>&cono=<%=cono %>"><%=rs.getString("dname")%></a>
				     </td>
			  </tr>
		<%
		}
		%>
		</table>
	</body>
</html>