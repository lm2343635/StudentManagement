<%@ page language="java" contentType="text/html; charset=gb2312"%>
<%@ page import="com.mysql.jdbc.Driver"%>
<%@ page import="java.sql.*"%>
 <%
String inputUser=(String)session.getAttribute("user");
String userType=(String)session.getAttribute("userType");
String photoPath="../photo/"+inputUser+".jpg";
String returnPath="../"+userType+"/maintainInfo.jsp";
%>
<html>
	<head>
		<title>�ϴ���Ƭ</title>
		<link rel="stylesheet" rev="stylesheet" href="../css/home.css" type="text/css">
		<link rel="stylesheet" rev="stylesheet" href="../css/myfont.css" type="text/css">
	</head>
	<body>
		 <center>
		 <img src="../images/top.jpg"><br>
		 <jsp:include page="../public/headerUserType.jsp"/>
		 <table  border="0">
	       <tr>
		     <td height="40" width="300"  align="center" bgcolor="#0000FF"><myfont>��Ƭ���ϴ�</myfont></td>
	       </tr> 
		   <tr>
			  <td align="center" bgcolor="#D9FFFF">
			  	<img style="margin: 50px;" width="130" height="190" src="<%=photoPath%>"/>
			  </td>
		   </tr>
		   <tr>
			  <td height="40" align="center" bgcolor="#D9FFFF">
			  	<a href="<%=returnPath%>">����</a>
			  </td>
		   </tr>
	   	  </table>
	</body>
</html>