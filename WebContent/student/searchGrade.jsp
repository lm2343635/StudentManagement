<%@ page language="java" contentType="text/html; charset=gb2312"%>
<%@ page import="com.mysql.jdbc.Driver"%>
<%@ page import="java.sql.*"%>
<jsp:useBean id="connectDatabase" class="com.nefu.stumgr.bean.ConnectDatabase" />
<%
String sno=(String)session.getAttribute("user");
ResultSet rs=connectDatabase.exeQuery("select sc.cno,semester,cname,tname,ccredit,grade from sc,teach,course,teacher "+
		"where sno="+sno+" and sc.tno=teach.tno and sc.cno=teach.cno and course.cno=sc.cno and sc.tno=teacher.tno order by semester"); 
%>
<html>
	<head>
	<title>成绩查询</title>
	<link rel="stylesheet" rev="stylesheet" href="../css/myfont.css" type="text/css">
    <link rel="stylesheet" rev="stylesheet" href="../css/home.css" type="text/css">
	<link rel="stylesheet" rev="stylesheet" href="../css/hover.css" type="text/css">
</head>

<body>
	<center>
	<img src="../images/top.jpg"><br>
	<jsp:include page="header.jsp"/>
	<table  border="0" style="border-spacing:0">
	   <tr>
		  <td width="200" height="40" align="center" bgcolor="#009933" class="block">
		  	 <a href="searchGrade.jsp" ><myfont>历年成绩</myfont></a>     
		  </td>
		  <td width="1" height="40" align="center" bgcolor="#FFFFFF" class="block"></td>
		  <td width="200" align="center" bgcolor="#0000FF" class="block">
	 	    <a href="searchGradeSemester.jsp"><myfont>学期成绩</myfont></a>     
		  </td>
		  <td width="1" height="40" align="center" bgcolor="#FFFFFF" class="block"></td>
		  <td width="200" height="40" align="center" bgcolor="#0000FF" class="block">
		  	 <a href="searchGradeYear.jsp"><myfont>学年成绩</myfont></a>     
		  </td>
		  <td width="1" height="40" align="center" bgcolor="#FFFFFF" class="block"></td>
		  <td width="200" align="center" bgcolor="#0000FF" class="block">
		 	 <a href="searchGradeStatistics.jsp"><myfont>成绩统计</myfont></a>     
		  </td>
	   </tr>   	
	   <tr>
		  <td colspan="7" width="800" height="8" align="center"  bgcolor="#009933"></td>
	   </tr>
	</table>
	<table  border="0" style="margin: 0; padding: 0;">
		 <tr>
		     <td height="40" width="95" align="center" bgcolor="#0000FF"><myfont>课程号</myfont></td>
		     <td width="100" align="center" bgcolor="#0000FF"><myfont>修读学期</myfont></td>
		     <td width="200" align="center" bgcolor="#0000FF"><myfont>课程名</myfont></td>
		     <td width="200" align="center" bgcolor="#0000FF"><myfont>任课教师</myfont></td>
		     <td width="100" align="center" bgcolor="#0000FF"><myfont>学分</myfont></td>
		     <td width="100" align="center" bgcolor="#0000FF"><myfont>成绩</myfont></td>
		 </tr>
		<%
		while(rs.next())
		{
		%>
		 <tr>
		     <td height="40" align="center" bgcolor="#D9FFFF"><%=rs.getString("sc.cno") %></td>
		     <td align="center" bgcolor="#D9FFFF"><%=rs.getString("semester") %></td>
		     <td align="center" bgcolor="#D9FFFF"><%=rs.getString("cname") %></td>
		     <td align="center" bgcolor="#D9FFFF"><%=rs.getString("tname") %></td>
		     <td align="center" bgcolor="#D9FFFF"><%=rs.getString("ccredit") %></td>
		     <td align="center" bgcolor="#D9FFFF">
		     <%
		     if(rs.getString("grade")==null)
		    	 out.print("暂无成绩");
		     else
		    	 out.print(rs.getString("grade"));
		     %>
		     </td>
		 </tr>	
		<%
		}
		%>
	</table>
</body>
</html>