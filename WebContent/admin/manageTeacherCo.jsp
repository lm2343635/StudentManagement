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
		<title><%=coname%>�����ʦ</title>
		<link rel="stylesheet" rev="stylesheet" href="../css/home.css" type="text/css">
		<link rel="stylesheet" rev="stylesheet" href="../css/myfont.css" type="text/css">
	</head>
	<body>
		<center>
		<img src="../images/top.jpg"><br>
		<jsp:include page="header.jsp"></jsp:include>
		<form action="addTeacher.jsp?cono=<%=cono %>" method="post" >
		<table width="750"  border="0">
			   <tr>
				     <td height="40" colspan="3" align="center" bgcolor="#0000FF"><myfont>������ʦ</myfont></td>
			   </tr> 
			   <tr>
				     <td width="250" height="40" align="center" bgcolor="#D9FFFF">
				     	��ʦ���<input type="text" name="tno"/>		
				     </td>
				     <td width="250" align="center" bgcolor="#D9FFFF">
				     	��ʦ����<input type="text" name="tname"/>		
				     </td>
				     <td width="250" align="center" bgcolor="#D9FFFF">
				        <input type="submit" value="����"/>
			  			<input type="reset" value="����"/>		
			  			<input type="hidden" name="coname"  value="<%=coname %>"/>		
				     </td>
			   </tr>
			   <tr>
				     <td height="40" colspan="5" align="center" bgcolor="#0000FF">
				     	<myfont><%=coname%>-�����ʦ</myfont>
				     	<button type="button"  onClick="window.location.href='manageTeacher.jsp'">����</button>
				     </td>
			  </tr> 
			   <tr>
				     <td height="40" align="center" bgcolor="#D9FFFF">��ʦ���</td>
				     <td align="center" bgcolor="#D9FFFF">��ʦ����</td>
				     <td align="center" bgcolor="#D9FFFF">ѡ��</td>
			   </tr>
				<%
				rs=connectDatabase.exeQuery("select tno,tname from teacher where college='"+coname+"'");	
				while(rs.next())
				{%>
					  <tr>
						     <td height="40" align="center" bgcolor="#D9FFFF"><%=rs.getString("tno") %></td>
						     <td align="center" bgcolor="#D9FFFF"><%=rs.getString("tname")%></td>
						     <td align="center" bgcolor="#D9FFFF">
						     	<a href="deleteTeacher.jsp?tno=<%=rs.getString("tno")%>&cono=<%=cono%>">ɾ��</a>		
						     </td>
					  </tr>
				<%
				}
				%>
		</table>
		</form>
	</body>
</html>