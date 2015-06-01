<%@ page language="java" contentType="text/html; charset=gb2312"%>
<%@ page import="com.mysql.jdbc.Driver"%>
<%@ page import="java.sql.*"%>
 <jsp:useBean id="connectDatabase" class="com.nefu.stumgr.bean.ConnectDatabase" />
 <%
 String cno=request.getParameter("cno");
 ResultSet rs=connectDatabase.exeQuery
		 ("select tno,tname,tage,tsex from teacher where tno in(select tno from teach where cno="+cno+")");
 %>
<html>
	<head>
		<title></title>
		<link rel="stylesheet" rev="stylesheet" href="../css/home.css" type="text/css">
		<link rel="stylesheet" rev="stylesheet" href="../css/myfont.css" type="text/css">
	</head>
	<body>
		<center>
		<img src="../images/top.jpg"><br>
		<jsp:include page="header.jsp"></jsp:include>
		<form action="setAllCourse.jsp" method="post" style="margin: 0;padding: 0;">
		</form>
		<table  border="0">
			   <tr>
		     		 <td height="40" colspan="4" align="center" bgcolor="#0000FF">
		     		 	<myfont>授课教师情况</myfont>
		     		 	<button type="button"  onClick="window.location.href='setAllCourse.jsp'">返回</button>
		     		 </td>
			   </tr> 
			  <tr>
				     <td width="100" height="40" align="center" bgcolor="#D9FFFF">教师编号</td>
				     <td width="400" align="center" bgcolor="#D9FFFF">教师姓名</td>
				     <td width="100" align="center" bgcolor="#D9FFFF">教师年龄</td>
				     <td width="100" align="center" bgcolor="#D9FFFF">教师性别</td>
			  </tr>
			  <%
			  while(rs.next())
			  {
			  %>
			  <tr>
				     <td width="100" height="40" align="center" bgcolor="#D9FFFF"><%=rs.getString("tno") %></td>
				     <td width="400" align="center" bgcolor="#D9FFFF"><%=rs.getString("tname") %></td>
				     <td width="100" align="center" bgcolor="#D9FFFF"><%=rs.getString("tage") %></td>
				     <td width="100" align="center" bgcolor="#D9FFFF"><%=rs.getString("tsex") %></td>
			  </tr>
			  <%
			  }
			  %>
		</table>
		</form>
	</body>
</html>