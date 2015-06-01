<%@ page language="java" contentType="text/html; charset=gb2312"%>
<%@ page import="com.mysql.jdbc.Driver"%>
<%@ page import="java.sql.*"%>
 <jsp:useBean id="connectDatabase" class="com.nefu.stumgr.bean.ConnectDatabase" />
 <%
 String cono=request.getParameter("cono");
String dno=request.getParameter("dno");
ResultSet rs=connectDatabase.exeQuery("select dname from department where dno="+dno);	
String dname="";
while(rs.next())
	dname= rs.getString("dname");
%>
<html>
	<head>
		<title><%=dname%>专业详情</title>
		<link rel="stylesheet" rev="stylesheet" href="../css/home.css" type="text/css">
			<style type="text/css">
		        myfont
		        {
		        	color: white;
		        }
	        </style>
	</head>
	<body>
		<center>
		<img src="../images/top.jpg"><br>
		<jsp:include page="header.jsp"></jsp:include>
		<table  border="0">
 				 <td height="40" colspan="4" align="center" bgcolor="#0000FF">
 				 	<myfont><%=dname%>专业详情	</myfont>
 				 	<button type="button"  onClick="window.location.href='department.jsp?cono=<%=cono%>'">返回</button>
 				 </td>
				 <tr>
				     <td height="30" width="200" align="center" bgcolor="#0000FF"><myfont>学号</myfont></td>
				     <td width="200" align="center" bgcolor="#0000FF"><myfont>姓名</myfont></td>
				     <td width="200" align="center" bgcolor="#0000FF"><myfont>年龄</myfont></td>
				     <td width="200" align="center" bgcolor="#0000FF"><myfont>性别</myfont></td>
				   </tr>
						<%
						rs=connectDatabase.exeQuery
						("select sno,sname,sage,ssex from student "+
						 "where department=(select dname from department where dno="+dno+")");
						while(rs.next())
						{ %> 
				   <tr>
				     <td height="30" align="center" bgcolor="#D9FFFF"><%=rs.getString("sno") %></td>
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