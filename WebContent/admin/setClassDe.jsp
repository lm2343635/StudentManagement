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
%>
<html>
	<head>
		<title><%=dname %>�γ�����</title>
		<link rel="stylesheet" rev="stylesheet" href="../css/home.css" type="text/css">
		<link rel="stylesheet" rev="stylesheet" href="../css/myfont.css" type="text/css">
	</head>
	<body>
		<center>
		<img src="../images/top.jpg"><br>
		<jsp:include page="header.jsp"></jsp:include>
		<table width="750"  border="0">
			   <tr>
				     <td height="40" colspan="3" align="center" bgcolor="#0000FF">
				     	<myfont><%=dname%>�γ�����</myfont>
				     	<button type="button"  onClick="window.location.href='setClassCo.jsp?cono=<%=cono%>'">����</button>
				     </td>
			  </tr> 
			  <tr>
				     <td width="250" height="40" align="center" bgcolor="#D9FFFF">��һѧ��</td>
				     <td width="250" align="center" bgcolor="#D9FFFF">
				     	<a href="setClassSemester.jsp?dno=<%=dno%>&cono=<%=cono %>&semester=1">��һѧ��</a>
				     </td>
				     <td width="250" align="center" bgcolor="#D9FFFF">
				    	 <a href="setClassSemester.jsp?dno=<%=dno%>&cono=<%=cono %>&semester=2">�ڶ�ѧ��</a>
				     </td>
			  </tr>
			  <tr>
				     <td width="250" height="40" align="center" bgcolor="#D9FFFF">�ڶ�ѧ��</td>
				     <td width="250" align="center" bgcolor="#D9FFFF">
				     	<a href="setClassSemester.jsp?dno=<%=dno%>&cono=<%=cono %>&semester=3">����ѧ��</a>
				     </td>
				     <td width="250" align="center" bgcolor="#D9FFFF">
				     	<a href="setClassSemester.jsp?dno=<%=dno%>&cono=<%=cono %>&semester=4">����ѧ��</a>
				     </td>
			  </tr>
			  <tr>
				     <td width="250" height="40" align="center" bgcolor="#D9FFFF">����ѧ��</td>
				     <td width="250" align="center" bgcolor="#D9FFFF">
				     	<a href="setClassSemester.jsp?dno=<%=dno%>&cono=<%=cono %>&semester=5">����ѧ��</a>
				     </td>
				     <td width="250" align="center" bgcolor="#D9FFFF">
				     	<a href="setClassSemester.jsp?dno=<%=dno%>&cono=<%=cono %>&semester=6">����ѧ��</a>
				     </td>
			  </tr>
			  <tr>
				     <td width="250" height="40" align="center" bgcolor="#D9FFFF">����ѧ��</td>
				     <td width="250" align="center" bgcolor="#D9FFFF">
				     	<a href="setClassSemester.jsp?dno=<%=dno%>&cono=<%=cono %>&semester=7">����ѧ��</a>
				     </td>
				     <td width="250" align="center" bgcolor="#D9FFFF">
				     	<a href="setClassSemester.jsp?dno=<%=dno%>&cono=<%=cono %>&semester=8">�ڰ�ѧ��</a>
				     </td>
			  </tr>
		</table>
	</body>
</html>