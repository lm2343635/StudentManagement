<%@ page language="java" contentType="text/html; charset=gb2312"%>
<%@ page import="com.mysql.jdbc.Driver"%>
<%@ page import="java.sql.*"%>
<jsp:useBean id="connectDatabase" class="com.nefu.stumgr.bean.ConnectDatabase" />
<%
request.setCharacterEncoding("gb2312");
String dno=request.getParameter("dno");
String cono=request.getParameter("cono");
String semester=request.getParameter("semester");
String grade=request.getParameter("grade");
String add="insert into sc(sno,cno,tno) select sno,cno,tno from teach,student "+
		"where sno like '"+grade+"%' and dno="+dno+" and semester="+semester+" "+
		"and (property='公共基础课' or property='专业课' or property='专业基础课') "+
		"and department=(select dname from department where dno="+dno+")";

//response.sendRedirect("../admin/setClassSemester.jsp?dno="+dno+"&cono="+cono+"&semester="+semester);
%>

<html>
	<head>
		<title>添加必修课</title>
		<link rel="stylesheet" rev="stylesheet" href="../css/home.css" type="text/css">
		<link rel="stylesheet" rev="stylesheet" href="../css/myfont.css" type="text/css">
	</head>
	<body>
		<center>
		<img src="../images/top.jpg"><br>
		<jsp:include page="header.jsp"></jsp:include>
		<%
		try
		{
			connectDatabase.exeUpdate(add);
			out.print("添加成功");
		}
		catch(Exception e)
		{
			out.print("添加失败");
		}
		%>
		<a href="../admin/setClassSemester.jsp?dno=<%=dno %>&cono=<%=cono %>&semester=<%=semester %>">返回</a>
	</body>
</html>