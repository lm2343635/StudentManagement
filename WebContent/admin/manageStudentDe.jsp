<%@ page language="java" contentType="text/html; charset=gb2312"%>
<%@ page import="com.mysql.jdbc.Driver"%>
<%@ page import="java.sql.*"%>
 <jsp:useBean id="connectDatabase" class="com.nefu.stumgr.bean.ConnectDatabase" />
 <%
String dno=request.getParameter("dno");
String cono=request.getParameter("cono");
ResultSet rs=connectDatabase.exeQuery("select dname from department where dno="+dno);	
String dname="";
while(rs.next())
	dname= rs.getString("dname");
rs=connectDatabase.exeQuery("select coname from college where cono="+cono);	
String coname="";
while(rs.next())
	coname= rs.getString("coname");
%>
<html>
	<head>
		<title><%=dname %>����ѧ��</title>
		<link rel="stylesheet" rev="stylesheet" href="../css/home.css" type="text/css">
		<link rel="stylesheet" rev="stylesheet" href="../css/myfont.css" type="text/css">
	</head>
	<body>
		<center>
		<img src="../images/top.jpg"><br>
		<jsp:include page="header.jsp"></jsp:include>
		<form action="addStudent.jsp?cono=<%=cono %>&dno=<%=dno %>" method="post" >
		<table width="750"  border="0">
			   <tr>
				     <td height="40" colspan="3" align="center" bgcolor="#0000FF"><myfont>����ѧ��</myfont></td>
			   </tr> 
			   <tr>
				     <td width="275" height="40" align="center" bgcolor="#D9FFFF">
				     	ѧ��ѧ��<input type="text" name="sno"/>		
				     </td>
				     <td width="275" align="center" bgcolor="#D9FFFF">
				     	ѧ������<input type="text" name="sname"/>		
				     </td>
				     <td width="200" align="center" bgcolor="#D9FFFF">
				        <input type="submit" value="����"/>
			  			<input type="reset" value="����"/>		
			  			<input type="hidden" name="dname"  value="<%=dname %>"/>	
			  			<input type="hidden" name="coname"  value="<%=coname %>"/>		
				     </td>
			   </tr>
			   <tr>
				     <td height="40" colspan="3" align="center" bgcolor="#0000FF">
				     	<myfont><%=dname%>-����ѧ��</myfont>
				     	<button type="button"  onClick="window.location.href='manageStudentCo.jsp?cono=<%=cono%>'">����</button>
				     </td>
			  </tr> 
			   <tr>
				     <td height="40" align="center" bgcolor="#D9FFFF">ѧ�����</td>
				     <td align="center"  bgcolor="#D9FFFF">ѧ������</td>
				     <td align="center" bgcolor="#D9FFFF">ѡ��</td>
			   </tr>
				<%
				rs=connectDatabase.exeQuery("select sno,sname from student where department='"+dname+"'");	
				while(rs.next())
				{%>
					  <tr>
						     <td height="40" align="center" bgcolor="#D9FFFF"><%=rs.getString("sno") %></td>
						     <td align="center" bgcolor="#D9FFFF"><%=rs.getString("sname")%></td>
						     <td align="center" bgcolor="#D9FFFF">
						     	<a href="deleteStudent.jsp?sno=<%=rs.getString("sno")%>&cono=<%=cono%>&dno=<%=dno%>">ɾ��</a>		
						     </td>
					  </tr>
				<%
				}
				%>
		</table>
		</form>
	</body>
</html>