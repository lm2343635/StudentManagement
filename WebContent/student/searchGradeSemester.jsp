<%@ page language="java" contentType="text/html; charset=gb2312"%>
<%@ page import="com.mysql.jdbc.Driver"%>
<%@ page import="java.sql.*"%>
 <jsp:useBean id="connectDatabase" class="com.nefu.stumgr.bean.ConnectDatabase" />
 <%
 String semester="";
 if(request.getParameter("semester")==null)
	 semester="1";
 else
	 semester=request.getParameter("semester");
 %>
<html>
	<head>
	<title>学期成绩</title>
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
		  <td width="200" height="40" align="center" bgcolor="#0000FF" class="block">
		  	 <a href="searchGrade.jsp" ><myfont>历年成绩</myfont></a>     
		  </td>
		  <td width="1" height="40" align="center" bgcolor="#FFFFFF" class="block"></td>
		  <td width="200" align="center" bgcolor="#009933" class="block">
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
	</table >
	<table  border="0"  style="border-spacing:0; margin: 2px;">
	   <tr>
	   <%
	   for(int i=1;i<=8;i++)
	   {
	   %>
		  <td width="97" height="40" align="center" class="block"
		  <%
		  	 if(i==Integer.parseInt(semester))
		  	 {
		  		%>bgcolor="#009933"<%
		  	 }
		  	 else
		  	 {
		  		%>bgcolor=" #0000FF"<%
		  	 }
		  	 %>
		  >
		  	 <a href="searchGradeSemester.jsp?semester=<%=i %>" ><myfont>第<%=i %>学期</myfont></a>     
		  </td>   
		  <%
		  if(i!=8)
		  {
		  %>
		  <td width="1" height="40" align="center" bgcolor="#FFFFFF" class="block"></td>
	   <%
		  }
	   }
	   %>
	   </tr>
	   <tr>
		  <td colspan="15" width="800" height="8" align="center"  bgcolor="#009933"></td>
	   </tr>   	
	</table>
	<jsp:include page="searchGradeSemesterData.jsp"/>
</body>
</html>