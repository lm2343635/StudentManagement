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
		<title>��<%=semester %>ѧ�ڽ�ѧ�ƻ�</title>
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
			     	<myfont>��<%=semester %>ѧ�ڽ�ѧ�ƻ�</myfont>
			     	<button type="button"  onClick="window.location.href='teachPlan.jsp'">����</button>
			     </td>
		  </tr> 
		  <tr>
			     <td width="300" height="40"  align="center" bgcolor="#D9FFFF">�γ���</td>
			     <td width="250" height="40"  align="center" bgcolor="#D9FFFF">�γ�����</td>
			     <td width="100" height="40" align="center" bgcolor="#D9FFFF">ѧ��</td>
			     <td width="150" height="40" align="center" bgcolor="#D9FFFF">�ڿν�ʦ</td>
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