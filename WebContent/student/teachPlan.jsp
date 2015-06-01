<%@ page language="java" contentType="text/html; charset=gb2312"%>
<%@ page import="com.mysql.jdbc.Driver"%>
<%@ page import="java.sql.*"%>
 <jsp:useBean id="connectDatabase" class="com.nefu.stumgr.bean.ConnectDatabase" />

<html>
	<head>
		<title>教学计划</title>
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
				     	<myfont>教学计划</myfont>
				     </td>
			  </tr> 
			  <%
			  for(int i=1;i<=4;i++)
			  {
			  %>
			  <tr>
				     <td width="250" height="40" align="center" bgcolor="#D9FFFF">第<%=i %>学年</td>
				     <td width="250" align="center" bgcolor="#D9FFFF">
				     	<a href="teachPlanSemester.jsp?semester=<%=2*i-1 %>">第<%=2*i-1 %>学期</a>
				     </td>
				     <td width="250" align="center" bgcolor="#D9FFFF">
				    	 <a href="teachPlanSemester.jsp?semester=<%=2*i %>">第<%=2*i %>学期</a>
				     </td>
			  </tr>			  
			  <%   
			  }
			  %>

		</table>
	</body>
</html>