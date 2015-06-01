<%@ page language="java" contentType="text/html; charset=gb2312"%>
<%@ page import="com.mysql.jdbc.Driver"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.nefu.stumgr.util.*"%>
<html>
	<head>
		<link rel="stylesheet" rev="stylesheet" href="../css/home.css" type="text/css">
		<link rel="stylesheet" rev="stylesheet" href="../css/myfont.css" type="text/css">
	</head>
	<body>
	 	<center>
 		<img src="../images/top.jpg"><br>
 		<jsp:include page="header.jsp"></jsp:include>
 		<%
 		//获取时间
 		int semester=Integer.parseInt(request.getParameter("semester"));
 		String sno=(String)session.getAttribute("user");
 		Semester s=new Semester();
 		int nowSemester=s.getSemester(sno);
 		if(nowSemester<semester)
 		{
 			%>
 			<img src="../images/sorry.jpg" width="50" height="50">
 			对不起，现在是第<%=nowSemester%>学期，第<%=semester%>学期还未开课！
 			<a href="classSearchAllSemester.jsp">返回</a>
 			<%	
 		}
 		else
 		{
 		%>
 		<jsp:include page="classSearchSemesterObligatory.jsp"/>
 		<jsp:include page="classSearchSemesterElectives.jsp"/>
 		<%
 		}
 		%>
	</body>
</html>