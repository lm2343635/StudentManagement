<%@ page language="java" contentType="text/html; charset=gb2312"%>
<%@ page import="com.mysql.jdbc.Driver"%>
<%@ page import="java.sql.*"%>
 <jsp:useBean id="connectDatabase" class="com.nefu.stumgr.bean.ConnectDatabase" />
 <%
String cono=request.getParameter("cono");
ResultSet rs=connectDatabase.exeQuery("select coname from college where cono="+cono);	
String coname="";
while(rs.next())
	coname= rs.getString("coname");
%>
<html>
	<head>
		<title><%=coname%>רҵ����</title>
		<link rel="stylesheet" rev="stylesheet" href="../css/home.css" type="text/css">
		<link rel="stylesheet" rev="stylesheet" href="../css/myfont.css" type="text/css">
	</head>
	<body>
		<center>
		<img src="../images/top.jpg"><br>
		<jsp:include page="header.jsp"></jsp:include>
	    <form action="addDepartment.jsp?cono=<%=cono %>" method="post" >
		<table width="850"  border="0">
		   <tr>
			     <td height="40" colspan="5" align="center" bgcolor="#0000FF">
			     	<myfont><%=coname%>רҵ����</myfont>
			     </td>
		  </tr> 
		  <tr>
			     <td width="150" height="40" align="center" bgcolor="#D9FFFF">רҵ���</td>
			     <td width="600" align="center" bgcolor="#D9FFFF">רҵ����</td>
			     <td width="100" align="center" bgcolor="#D9FFFF">ѡ��</td>
		  </tr>
	<%
	 rs=connectDatabase.exeQuery("select dno,dname from department where cono="+cono);	
	while(rs.next())
	{%>
		  <tr>
			     <td width="150" height="40" align="center" bgcolor="#D9FFFF"><%=rs.getString("dno") %></td>
			     <td width="600" align="center" bgcolor="#D9FFFF">
			     	<a href="departmentInfo.jsp?dno=<%=rs.getString("dno")%>&cono=<%=cono %>"><%=rs.getString("dname")%></a>
			     </td>
			     <td width="100" align="center" bgcolor="#D9FFFF">
			     	<a href="deleteDepartment.jsp?dno=<%=rs.getString("dno")%>&cono=<%=cono%>">ɾ��</a>		
			     </td>
		  </tr>
	<%
	}
	%>
		   <tr>
			     <td height="40" colspan="5" align="center" bgcolor="#0000FF"><myfont>����ϵ</myfont></td>
		   </tr> 
		   <tr>
			     <td width="300" height="40" align="center" bgcolor="#D9FFFF">
			     	ϵ���<input type="text" name="dno"/>		
			     </td>
			     <td width="350" align="center" bgcolor="#D9FFFF">
			     	ϵ����<input type="text" name="dname"/>		
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