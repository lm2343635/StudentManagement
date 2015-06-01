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
		<title><%=dname %>课程设置</title>
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
				     	<myfont><%=dname%>课程设置</myfont>
				     	<button type="button"  onClick="window.location.href='setClassCo.jsp?cono=<%=cono%>'">返回</button>
				     </td>
			  </tr> 
			  <tr>
				     <td width="250" height="40" align="center" bgcolor="#D9FFFF">第一学年</td>
				     <td width="250" align="center" bgcolor="#D9FFFF">
				     	<a href="setClassSemester.jsp?dno=<%=dno%>&cono=<%=cono %>&semester=1">第一学期</a>
				     </td>
				     <td width="250" align="center" bgcolor="#D9FFFF">
				    	 <a href="setClassSemester.jsp?dno=<%=dno%>&cono=<%=cono %>&semester=2">第二学期</a>
				     </td>
			  </tr>
			  <tr>
				     <td width="250" height="40" align="center" bgcolor="#D9FFFF">第二学年</td>
				     <td width="250" align="center" bgcolor="#D9FFFF">
				     	<a href="setClassSemester.jsp?dno=<%=dno%>&cono=<%=cono %>&semester=3">第三学期</a>
				     </td>
				     <td width="250" align="center" bgcolor="#D9FFFF">
				     	<a href="setClassSemester.jsp?dno=<%=dno%>&cono=<%=cono %>&semester=4">第四学期</a>
				     </td>
			  </tr>
			  <tr>
				     <td width="250" height="40" align="center" bgcolor="#D9FFFF">第三学年</td>
				     <td width="250" align="center" bgcolor="#D9FFFF">
				     	<a href="setClassSemester.jsp?dno=<%=dno%>&cono=<%=cono %>&semester=5">第五学期</a>
				     </td>
				     <td width="250" align="center" bgcolor="#D9FFFF">
				     	<a href="setClassSemester.jsp?dno=<%=dno%>&cono=<%=cono %>&semester=6">第六学期</a>
				     </td>
			  </tr>
			  <tr>
				     <td width="250" height="40" align="center" bgcolor="#D9FFFF">第四学年</td>
				     <td width="250" align="center" bgcolor="#D9FFFF">
				     	<a href="setClassSemester.jsp?dno=<%=dno%>&cono=<%=cono %>&semester=7">第七学期</a>
				     </td>
				     <td width="250" align="center" bgcolor="#D9FFFF">
				     	<a href="setClassSemester.jsp?dno=<%=dno%>&cono=<%=cono %>&semester=8">第八学期</a>
				     </td>
			  </tr>
		</table>
	</body>
</html>