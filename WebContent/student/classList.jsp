<%@ page language="java" contentType="text/html; charset=gb2312"%>
<%@ page import="com.mysql.jdbc.Driver"%>
<%@ page import="java.sql.*"%>
<jsp:useBean id="connectDatabase" class="com.nefu.stumgr.bean.ConnectDatabase" />
<%
String sno=(String)session.getAttribute("user"); 
ResultSet rs=connectDatabase.exeQuery("select class from student where sno="+sno);
String className="";
while(rs.next())
	className=rs.getString("class");
%>
<html>
	<head>
		<title><%=className %>班级名单</title>
		<link rel="stylesheet" rev="stylesheet" href="../css/home.css" type="text/css">
		<style>
			myfont{color: #FFFFFF; font-size: 20}
		</style>
	</head>
	<body>
	 	<center>
 		<img src="../images/top.jpg"><br>
 		<jsp:include page="header.jsp"></jsp:include>
		<table  border="0">
			 <tr>
				 <td height="40" colspan="4" align="center" bgcolor="#0000FF">
				 	<myfont><%=className %> 班级名单</myfont>
				 </td>
			 </tr>
			 <tr>
			     <td height="40" width="180" align="center" bgcolor="#0000FF"><myfont>学号</myfont></td>
			     <td width="180" align="center" bgcolor="#0000FF"><myfont>姓名</myfont></td>
			     <td width="180" align="center" bgcolor="#0000FF"><myfont>年龄</myfont></td>
			     <td width="180" align="center" bgcolor="#0000FF"><myfont>性别</myfont></td>
			 </tr>
					<%
					rs=connectDatabase.exeQuery
					("select sno,sname,sage,ssex from student where class= "+
							"(select class from student where sno="+sno+")");
					while(rs.next())
					{ %> 
			  <tr>
			     <td height="40" align="center" bgcolor="#D9FFFF"><%=rs.getString("sno") %></td>
			     <td align="center" bgcolor="#D9FFFF"><%=rs.getString("sname") %></td>
			     <td align="center" bgcolor="#D9FFFF"><%=rs.getString("sage") %></td>
			     <td align="center" bgcolor="#D9FFFF"><%=rs.getString("ssex") %></td>
			  </tr>
				<% 
				    }
				rs.close();
				connectDatabase.close();
				%>
		</table>
	</body>
</html>