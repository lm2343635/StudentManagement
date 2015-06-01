<%@ page language="java" contentType="text/html; charset=gb2312"%>
<%@ page import="com.mysql.jdbc.Driver"%>
<%@ page import="java.sql.*"%>
 <jsp:useBean id="connectDatabase" class="com.nefu.stumgr.bean.ConnectDatabase" />

<html>
	<head>
		<title>院系设置</title>
		<link rel="stylesheet" rev="stylesheet" href="../css/home.css" type="text/css">
		<link rel="stylesheet" rev="stylesheet" href="../css/myfont.css" type="text/css">
	</head>
	<body>
	<center>
	<img src="../images/top.jpg"><br>
	<jsp:include page="header.jsp"></jsp:include>
	<form action="addCollege.jsp" method="post" >
	<table width="850"  border="0">
	   <tr>
		     <td height="40" colspan="3" align="center" bgcolor="#0000FF"><myfont>院系设置信息</myfont></td>
	   </tr> 
	   <tr>
		     <td width="150" height="40" align="center" bgcolor="#D9FFFF">院系编号</td>
		     <td width="600" align="center" bgcolor="#D9FFFF">院系名称</td>
		     <td width="100" align="center" bgcolor="#D9FFFF">选择</td>
	   </tr>
		<%
		ResultSet rs=connectDatabase.exeQuery("select * from college");	
		while(rs.next())
		{%>
			  <tr>
				     <td width="150" height="40" align="center" bgcolor="#D9FFFF"><%=rs.getString("cono") %></td>
				     <td width="600" align="center" bgcolor="#D9FFFF">
				     	<a href="department.jsp?cono=<%=rs.getString("cono")%>"><%=rs.getString("coname")%></a>
				     </td>
				     <td width="100" align="center" bgcolor="#D9FFFF">
				     	<a href="deleteCollege.jsp?cono=<%=rs.getString("cono")%>">删除</a>		
				     </td>
			  </tr>
		<%
		}
		%>
	   <tr>
		     <td height="40" colspan="3" align="center" bgcolor="#0000FF"><myfont>新增学院</myfont></td>
	   </tr> 
	   <tr>
		     <td width="300" height="40" align="center" bgcolor="#D9FFFF">
		     	学院编号<input type="text" name="cono"/>		
		     </td>
		     <td width="350" align="center" bgcolor="#D9FFFF">
		     	学院名称<input type="text" name="coname"/>		
		     </td>
		     <td width="200" align="center" bgcolor="#D9FFFF">
		        <input type="submit" value="新增"/>
	  			<input type="reset" value="重置"/>		
		     </td>
	   </tr>
	</table>
	</form>
	</body>
</html>