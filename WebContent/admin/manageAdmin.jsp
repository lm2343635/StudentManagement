<%@ page language="java" contentType="text/html; charset=gb2312"%>
<%@ page import="com.mysql.jdbc.Driver"%>
<%@ page import="java.sql.*"%>
 <jsp:useBean id="connectDatabase" class="com.nefu.stumgr.bean.ConnectDatabase" />
<html>
	<head>
		<title>�������Ա</title>
		<link rel="stylesheet" rev="stylesheet" href="../css/home.css" type="text/css">
		<link rel="stylesheet" rev="stylesheet" href="../css/myfont.css" type="text/css">
	</head>
	<body>
		<center>
		<img src="../images/top.jpg"><br>
		<jsp:include page="header.jsp"></jsp:include>
		<form action="addAdmin.jsp" method="post" >
		<table width="850"  border="0">
		   <tr>
			     <td height="40" colspan="3" align="center" bgcolor="#0000FF"><myfont>�������Ա</myfont></td>
		   </tr> 
		   <tr>
			     <td width="150" height="40" align="center" bgcolor="#D9FFFF">����Ա���</td>
			     <td width="600" align="center" bgcolor="#D9FFFF">����Ա����</td>
			     <td width="100" align="center" bgcolor="#D9FFFF">ѡ��</td>
		   </tr>
			<%
			ResultSet rs=connectDatabase.exeQuery("select * from admin");	
			while(rs.next())
			{%>
				  <tr>
					     <td width="150" height="40" align="center" bgcolor="#D9FFFF"><%=rs.getString("ano") %></td>
					     <td width="600" align="center" bgcolor="#D9FFFF"><%=rs.getString("aname")%></td>
					     <td width="100" align="center" bgcolor="#D9FFFF">
					     	<a href="deleteAdmin.jsp?ano=<%=rs.getString("ano")%>">ɾ��</a>		
					     </td>
				  </tr>
			<%
			}
			%>
		   <tr>
			     <td height="40" colspan="3" align="center" bgcolor="#0000FF"><myfont>��������Ա</myfont></td>
		   </tr> 
		   <tr>
			     <td width="300" height="40" align="center" bgcolor="#D9FFFF">
			     	����Ա���<input type="text" name="ano"/>		
			     </td>
			     <td width="350" align="center" bgcolor="#D9FFFF">
			     	����Ա����<input type="text" name="aname"/>		
			     </td>
			     <td width="200" align="center" bgcolor="#D9FFFF">
			        <input type="submit" value="����"/>
		  			<input type="reset" value="����"/>		
			     </td>
		   </tr>
		</table>
		</form>
	</body>
</html>