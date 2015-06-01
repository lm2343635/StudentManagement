<%@ page language="java" contentType="text/html; charset=gb2312"%>
<%@ page import="com.mysql.jdbc.Driver"%>
<%@ page import="java.sql.*"%>
<html>
	<head>
		<title>查看所有学期课程</title>
		<link rel="stylesheet" rev="stylesheet" href="../css/home.css" type="text/css">
		<link rel="stylesheet" rev="stylesheet" href="../css/myfont.css" type="text/css">
		<link rel="stylesheet" rev="stylesheet" href="../css/hover.css" type="text/css">
	</head>
	<body>
	 	<center>
 		<img src="../images/top.jpg"><br>
 		<jsp:include page="header.jsp"/>
 	    <table  border="0" style="border-spacing:0">
		   <tr>
			  <td width="405" height="40" align="center" bgcolor="#0000FF" class="block">
			  	 <a href="classSearchThisSemester.jsp"><myfont>查看本学期课程</myfont></a>     
			  </td>
			  <td width="1" height="40" align="center" bgcolor="#FFFFFF" class="block"></td>
			  <td width="405" align="center" bgcolor="#009933" class="block">
			 	 <a href="classSearchAllSemester.jsp"><myfont>查看所有学期课程</myfont></a>     
			  </td>
		   </tr>   
		   <tr>
		  	 <td colspan="7" width="800" height="8" align="center"  bgcolor="#009933"></td>
	   	   </tr>		
		</table>
		<table border="0">
			  <%
			  for(int i=1;i<=4;i++)
			  {
			  %>
			  <tr>
				     <td width="270" height="40" align="center" bgcolor="#D9FFFF">第<%=i %>学年</td>
				     <td width="270" align="center" bgcolor="#D9FFFF">
				     	<a href="classSearchSemester.jsp?semester=<%=2*i-1 %>">第<%=2*i-1 %>学期</a>
				     </td>
				     <td width="270" align="center" bgcolor="#D9FFFF">
				    	 <a href="classSearchSemester.jsp?semester=<%=2*i %>">第<%=2*i %>学期</a>
				     </td>
			  </tr>			  
			  <%   
			  }
			  %>
		</table>
	</body>
</html>