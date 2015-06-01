<%@ page language="java" contentType="text/html; charset=gb2312"%>
<%@ page import="com.mysql.jdbc.Driver"%>
<%@ page import="java.sql.*"%>

<html>
	 <head>
	  <title>用户</title>
		  <link rel="stylesheet" rev="stylesheet" href="../css/imgChange.css" type="text/css">
		  <script src="../javascript/clock.js"></script>
		  <link rel="stylesheet" rev="stylesheet" href="../css/home.css" type="text/css">   
	 </head>
 	 <body onLoad="webClock()">
		<center>
		<img src="../images/top.jpg"><br>
		<jsp:include page="../teacher/header.jsp"/>
		<jsp:include page="../teacher/showTeacherInfo.jsp"/>
		<form name="clock"  style="display: inline;"> </form>
        <a href="modifyTeacherInfo.jsp">修改个人信息</a>&nbsp;
        <a href="../public/modifyPassword.html">修改密码</a><br> <br>  
        <jsp:include page="../public/newsBlock.jsp"/>
 </body>
</html>
