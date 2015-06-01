<%@ page language="java" contentType="text/html; charset=gb2312"%>
<%@ page import="com.mysql.jdbc.Driver"%>
<%@ page import="java.sql.*"%>
 <jsp:useBean id="connectDatabase" class="com.nefu.stumgr.bean.ConnectDatabase" />
 
<html>
	<head>
		<title>成绩录入</title>
		<link rel="stylesheet" rev="stylesheet" href="../css/home.css" type="text/css">
		<link rel="stylesheet" rev="stylesheet" href="../css/myfont.css" type="text/css">
		<link rel="stylesheet" rev="stylesheet" href="../css/hover.css" type="text/css">
	</head>
	<body>
		 <center>
 		 <img src="../images/top.jpg"><br>
 		 <jsp:include page="../teacher/header.jsp"/>
 		 <table  border="0"  style="border-spacing:0">
		   <tr>
			  <td width="375" height="40" align="center" bgcolor="#009933" class="block">
			  	 <a href="inputGrade.jsp"><myfont>按班级录入</myfont></a>     
			  </td>
			  <td width="1" height="40" align="center" bgcolor="#FFFFFF" class="block"></td>
			  <td width="375" align="center" bgcolor="#0000FF" class="block">
			 	 <a href="inputGradeStudent.jsp"><myfont>按学生录入</myfont></a>     
			  </td>
		   </tr>   	
		   <tr>
		  	 <td colspan="3" width="800" height="8" align="center"  bgcolor="#009933"></td>
	   	   </tr>	
		</table>
		<% 
		String tno=(String)session.getAttribute("user");
		ResultSet rs=connectDatabase.exeQuery
		    ("select sc.cno,ccredit,cname,count(sno),avg(grade) from sc,course "+
		    		"where sc.cno=course.cno and tno="+tno+" group by sc.cno");
		%>
	 	<table  border="0">
	       <tr>
		     <td height="40" width="130"  align="center" bgcolor="#0000FF"><myfont>课程号</myfont></td>
		     <td width="395" align="center" bgcolor="#0000FF"><myfont>课程名</myfont></td>
		     <td width="130" align="center" bgcolor="#0000FF"><myfont>学分</myfont></td>    
		     <td width="130" align="center" bgcolor="#0000FF"><myfont>选课人数</myfont></td>
	       </tr>
	       <%
	       while(rs.next())
	       {
	    	%>
	       <tr>
		     <td height="40"  align="center" bgcolor="#D9FFFF"><%=rs.getString("sc.cno") %></td>
		     <td align="center" bgcolor="#D9FFFF">
		     	<a href="inputGradeClass.jsp?cno=<%=rs.getString("sc.cno")%>"><%=rs.getString("cname")%></a>
		     </td>
		     <td align="center" bgcolor="#D9FFFF"><%=rs.getString("ccredit") %></td>
		     <td align="center" bgcolor="#D9FFFF"><%=rs.getString("count(sno)") %></td>
	       </tr>  
			<%
			}
			rs.close();
			%>
		</table>
	</body>
</html>