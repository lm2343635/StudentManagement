<%@ page language="java" contentType="text/html; charset=gb2312"%>
<%@ page import="com.mysql.jdbc.Driver"%>
<%@ page import="java.sql.*"%>
<html>
	<head>
		<title>��ʼѡ��</title>
		<link rel="stylesheet" rev="stylesheet" href="../css/home.css" type="text/css">
		<link rel="stylesheet" rev="stylesheet" href="../css/myfont.css" type="text/css">
	</head>
	<body>
	 	<center>
 		<img src="../images/top.jpg"><br>
 		<jsp:include page="header.jsp"></jsp:include>
		<table width="750"  border="0">
			   <tr>
				     <td height="40" colspan="3" align="center" bgcolor="#0000FF">
				     	<myfont>��ʼѡ��</myfont>
				     </td>
			  </tr> 
			  <%
			  for(int i=1;i<=4;i++)
			  {
			  %>
			  <tr>
				     <td width="250" height="40" align="center" bgcolor="#D9FFFF">��<%=i %>ѧ��</td>
				     <td width="250" align="center" bgcolor="#D9FFFF">
				     	<a href="selectClassSemester.jsp?semester=<%=2*i-1 %>">��<%=2*i-1 %>ѧ��</a>
				     </td>
				     <td width="250" align="center" bgcolor="#D9FFFF">
				    	 <a href="selectClassSemester.jsp?semester=<%=2*i %>">��<%=2*i %>ѧ��</a>
				     </td>
			  </tr>			  
			  <%   
			  }
			  %>
		</table>
	</body>
</html>