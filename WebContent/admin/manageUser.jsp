<%@ page language="java" contentType="text/html; charset=gb2312"%>
<html>
	<head>
		<title>用户管理</title>
		<link rel="stylesheet" rev="stylesheet" href="../css/myfont.css" type="text/css">
		<link rel="stylesheet" rev="stylesheet" href="../css/home.css" type="text/css">
	</head>
	<body>
		<center>
		<img src="../images/top.jpg"><br>
		<jsp:include page="header.jsp"></jsp:include>
		<table  border="0">
			     <tr>
			       <td height="40" colspan="3" align="center" bgcolor="#0000FF">
			      	 <myfont>用户管理</myfont>
			       </td>
			     </tr>
				 <tr>
				     <td width="250" height="40" align="center" bgcolor="#D9FFFF">
				     	<a href="manageAdmin.jsp">管理员</a>
				     </td>
				     <td width="250" height="40" align="center" bgcolor="#D9FFFF">
				     	<a href="manageTeacher.jsp">教师</a>
				     </td>
				     <td width="250" height="40" align="center" bgcolor="#D9FFFF">
				     	<a href="manageStudent.jsp">学生</a>
				     </td>
				   </tr>
		</table>
	</body>
</html>