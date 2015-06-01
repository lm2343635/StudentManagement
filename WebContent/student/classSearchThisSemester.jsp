<%@ page language="java" contentType="text/html; charset=gb2312"%>
<%@ page import="com.mysql.jdbc.Driver"%>
<%@ page import="java.sql.*"%>
<jsp:useBean id="connectDatabase" class="com.nefu.stumgr.bean.ConnectDatabase" />

<html>
	<head>
		<title>选课查询</title>
		<link rel="stylesheet" rev="stylesheet" href="../css/home.css" type="text/css">
		<link rel="stylesheet" rev="stylesheet" href="../css/myfont.css" type="text/css">
		<link rel="stylesheet" rev="stylesheet" href="../css/hover.css" type="text/css">
	</head>
	<body>
	 	<center>
 		<img src="../images/top.jpg"><br>
 		<jsp:include page="header.jsp"></jsp:include>
 		<table  border="0" style="border-spacing:0">
		   <tr>
			  <td width="405" height="40" align="center" bgcolor="#009933" class="block">
			  	 <a href="classSearchThisSemester.jsp"><myfont>查看本学期课程</myfont></a>     
			  </td>
			  <td width="1" height="40" align="center" bgcolor="#FFFFFF" class="block"></td>
			  <td width="405" align="center" bgcolor="#0000FF" class="block">
			 	 <a href="classSearchAllSemester.jsp"><myfont>查看所有学期课程</myfont></a>     
			  </td>
			  <tr>
		  	 	<td colspan="3" width="800" height="8" align="center"  bgcolor="#009933"></td>
	   	   	  </tr>
		   </tr>   		
		</table>
 		<jsp:include page="classSearchSemesterObligatory.jsp"/>
 		<jsp:include page="classSearchSemesterElectives.jsp"/>
	</body>
</html>