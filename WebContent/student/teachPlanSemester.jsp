<%@ page language="java" contentType="text/html; charset=gb2312"%>
<%@ page import="com.mysql.jdbc.Driver"%>
<%@ page import="java.sql.*"%>
 <jsp:useBean id="connectDatabase" class="com.nefu.stumgr.bean.ConnectDatabase" />
<%
String semester=request.getParameter("semester");
String sno=(String)session.getAttribute("user");
String dno="";
ResultSet rs=connectDatabase.exeQuery("select dno from department where dname in (select department from student where sno="+sno+")");
while(rs.next())
	dno=rs.getString("dno");
rs=connectDatabase.exeQuery("select cname,property,tname,ccredit from teach,course,teacher "+
		"where dno="+dno+" and semester="+semester+" and teach.cno=course.cno and teach.tno=teacher.tno");
%>
<html>
	<head>
		<title>第<%=semester %>学期教学计划</title>
		<link rel="stylesheet" rev="stylesheet" href="../css/home.css" type="text/css">
		<link rel="stylesheet" rev="stylesheet" href="../css/myfont.css" type="text/css">
	</head>
	<body>
		<center>
		<img src="../images/top.jpg"><br>
		<jsp:include page="header.jsp"></jsp:include>
		<table width="750"  border="0">
		   <tr>
			     <td height="40" colspan="4" align="center" bgcolor="#0000FF">
			     	<myfont>第<%=semester %>学期教学计划</myfont>
			     	<button type="button"  onClick="window.location.href='teachPlan.jsp'">返回</button>
			     </td>
		  </tr> 
		  <tr>
			     <td width="300" height="40"  align="center" bgcolor="#D9FFFF">课程名</td>
			     <td width="250" height="40"  align="center" bgcolor="#D9FFFF">课程性质</td>
			     <td width="100" height="40" align="center" bgcolor="#D9FFFF">学分</td>
			     <td width="150" height="40" align="center" bgcolor="#D9FFFF">授课教师</td>
		  </tr> 
		  <%
		  while(rs.next())
		  {
		  %>
		  <tr>
			     <td height="40"  align="center" bgcolor="#D9FFFF"><%=rs.getString("cname") %></td>
			     <td height="40"  align="center" bgcolor="#D9FFFF"><%=rs.getString("property") %></td>
			     <td height="40" align="center" bgcolor="#D9FFFF"><%=rs.getString("ccredit") %></td>
			     <td height="40" align="center" bgcolor="#D9FFFF"><%=rs.getString("tname") %></td>
		  </tr> 
		  <%
		  }
		  %>
		</table>
	</body>
</html>