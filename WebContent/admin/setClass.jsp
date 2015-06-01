<%@ page language="java" contentType="text/html; charset=gb2312"%>
<%@ page import="com.mysql.jdbc.Driver"%>
<%@ page import="java.sql.*"%>
 <jsp:useBean id="connectDatabase" class="com.nefu.stumgr.bean.ConnectDatabase" />
<html>
	<head>
		<title>课程设置</title>
		<link rel="stylesheet" rev="stylesheet" href="../css/myfont.css" type="text/css">
		<link rel="stylesheet" rev="stylesheet" href="../css/home.css" type="text/css">
	</head>
	<body>
		<center>
		<img src="../images/top.jpg"><br>
		<jsp:include page="header.jsp"></jsp:include>
		<table  border="0">
		   <tr>
			     <td height="40" width="700" align="center" bgcolor="#0000FF"><myfont>设置院系课程</myfont>
			     	 <button type="button"  onClick="window.location.href='setAllCourse.jsp'">点击设置所有课程</button>
			     </td> 
		   </tr> 
		</table>
		<table  border="0">
		   <tr>
			     <td width="200" height="40" align="center" bgcolor="#D9FFFF">院系编号</td>
			     <td width="500" align="center" bgcolor="#D9FFFF">院系名称</td>
		   </tr>
			<%
			ResultSet rs=connectDatabase.exeQuery("select * from college");	
			while(rs.next())
			{%>
				  <tr>
					     <td height="40" align="center" bgcolor="#D9FFFF"><%=rs.getString("cono") %></td>
					     <td  align="center" bgcolor="#D9FFFF">
					     	<a href="setClassCo.jsp?cono=<%=rs.getString("cono")%>"><%=rs.getString("coname")%></a>
					     </td>
				  </tr>
			<%
			}
			%>
		</table>
	</body>
</html>