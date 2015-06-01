<%@ page language="java" contentType="text/html; charset=gb2312"%>
<%@ page import="com.mysql.jdbc.Driver"%>
<%@ page import="java.sql.*"%>
 <jsp:useBean id="connectDatabase" class="com.nefu.stumgr.bean.ConnectDatabase" />
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
		<form action="modifyAdminInfoHandle.jsp">
		<table  border="0">
			<tr>
			  <td  height="40"  colspan="4" align="center" bgcolor="#0000FF" ><myfont>信息维护</myfont></td>
		   </tr>   
		   	<%
		   	String ano=(String)session.getAttribute("user");
			ResultSet rs=connectDatabase.exeQuery("select * from admin where ano="+ano);	
			while(rs.next())
			{%>
		   <tr>
			     <td width="100" height="40" align="center" bgcolor="#D9FFFF">管理员编号</td>
			     <td width="300" height="40" align="center" bgcolor="#D9FFFF"><%=rs.getString("ano") %></td>
			     <td width="100" height="40" align="center" bgcolor="#D9FFFF">管理员名称</td>
			     <td width="300" height="40" align="center" bgcolor="#D9FFFF"><%=rs.getString("aname") %></td>
		   </tr>
			<%		
			}
			%>
			<tr>
			  <td  height="40"  colspan="4" align="center" bgcolor="#D9FFFF" >
			  	修改管理员名称&nbsp;&nbsp;&nbsp;&nbsp;
			  	<input type="text" name="aname"/>&nbsp;&nbsp;&nbsp;&nbsp;
			  	<input type="hidden" name="ano" value="<%=ano%>"/>
			  	<input type="submit"/>&nbsp;&nbsp;
			  	<input type="reset"/>
			  </td>
		   </tr> 
		</table>
		</form>
	</body>
</html>