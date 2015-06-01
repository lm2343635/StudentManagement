<%@ page language="java" contentType="text/html; charset=gb2312"%>
<%@ page import="com.mysql.jdbc.Driver"%>
<%@ page import="java.sql.*"%>
<jsp:useBean id="connectDatabase" class="com.nefu.stumgr.bean.ConnectDatabase" />
<html>
 	<head>
 		<link rel="stylesheet" rev="stylesheet" href="../css/home.css" type="text/css">
        <link rel="stylesheet" rev="stylesheet" href="../css/imgChange.css" type="text/css">
        <script src="../javascript/clock.js"></script>
 	</head>
 	<body onLoad="webClock()">
	 	<center>
		<img src="../images/top.jpg"><br>
		<jsp:include page="header.jsp"/>
		<jsp:include page="../admin/showAdminInfo.jsp"/>&nbsp;
		<form name="clock"  style="display: inline;"> </form>&nbsp;
		<a href="../admin/modifyAdminInfo.jsp">修改信息</a>&nbsp;
		<a href="../publicmodifyPassword.html">修改密码</a><br>
		<jsp:include page="../public/newsBlock.jsp"/>
 	</body>
</html>
