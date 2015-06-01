<%@ page language="java" contentType="text/html; charset=gb2312"%>
<%@ page import="com.mysql.jdbc.Driver"%>
<%@ page import="java.sql.*"%>
 <jsp:useBean id="connectDatabase" class="com.nefu.stumgr.bean.ConnectDatabase" />
<%
String cno=request.getParameter("cno");
String tno=(String)session.getAttribute("user");
ResultSet rs=connectDatabase.exeQuery("select cname from course where cno="+cno);
String cname="";
while(rs.next())
	cname=rs.getString("cname");
rs=connectDatabase.exeQuery("select class,count(teach.cno) from teach,sc,student where teach.tno="+tno+
		" and teach.cno=sc.cno and teach.tno=sc.tno and sc.sno=student.sno group by class");
 %>
<html>
	<head>
		<title><%=cname %>按班级录入成绩</title>
		<link rel="stylesheet" rev="stylesheet" href="../css/home.css" type="text/css">
		<link rel="stylesheet" rev="stylesheet" href="../css/myfont.css" type="text/css">
	</head>
	<body>
		 <center>
 		 <img src="../images/top.jpg"><br>
 		 <jsp:include page="../teacher/header.jsp"></jsp:include>
 		 <table border="0">
		    <tr>
		      <td height="40" colspan="3" align="center" bgcolor="#0000FF">
		      	<myfont><%=cname %>按班级录入成绩</myfont>
		      	<button type="button"  onClick="window.location.href='inputGrade.jsp'">返回</button>
		      </td>
		    </tr>
		    <tr>
			     <td height="40" width="400"  align="center" bgcolor="#0000FF"><myfont>班级名称</myfont></td>
			     <td width="150" align="center" bgcolor="#0000FF"><myfont>班级选课人数</myfont></td>
			     <td width="150" align="center" bgcolor="#0000FF"><myfont>选择</myfont></td>	
		    </tr>
		    <%
		    while(rs.next())
		    {
		 	%>
		    <tr>
			     <td height="40" align="center" bgcolor="#D9FFFF"><%=rs.getString("class") %></td>
			     <td align="center" bgcolor="#D9FFFF"><%=rs.getString("count(teach.cno)")%></td>
			     <td width="180" align="center" bgcolor="#D9FFFF">
					<a href="inputGradeClassMember.jsp?cno=<%=cno %>&class=<%=rs.getString("class")%>">选择</a>
				 </td>
		    </tr>  
				<%
				}
				rs.close();
				%>
		 </table>
	</body>
</html>