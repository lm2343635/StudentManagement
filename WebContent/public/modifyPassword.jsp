<%@ page language="java" contentType="text/html; charset=gb2312"%>
<html>
	<head>
		<title>�޸�����</title>
		<script>
		 function confirm()
		 {var t1,t2;
		  t1=modify.password.value;
		  t2=modify.ConfirmPassword.value;
		  if(t1!=t2) 
			  {
			 	 alert("���벻һ��");
			  }
		 }
		</script>
		<link rel="stylesheet" rev="stylesheet" href="../css/home.css" type="text/css">
		<style>
			myfont{color: #FFFFFF; font-size: 20}
    	</style>
	</head>
	<body>
		<center>
		<img src="../images/top.jpg"><br>
		<%
		String userType=(String)session.getAttribute("userType");
		if(userType.equals("student"))
		{
			%>
			<jsp:include page="../student/header.jsp"></jsp:include>
			<% 
		}
		else if(userType.equals("teacher"))
		{
			%>
			<jsp:include page="../teacher/header.jsp"></jsp:include>
			<% 
		}
		else if(userType.equals("admin"))
		{
			%>
			<jsp:include page="../admin/header.jsp"></jsp:include>
			<% 
		}
		%>
	    <form action="modifyPasswordHandle.jsp" method="post"  name=modify>   
			    <table  border="0">
			       <tr>
				     <td width="200" height="40"  align="center" bgcolor="#0000FF"><myfont>������</myfont></td>
				     <td width="290" align="center" bgcolor="#D9FFFF">
				     	<input type="password" name="oldPassword">
				     </td>
			       </tr>
			       <tr>
				     <td width="200" height="40"  align="center" bgcolor="#0000FF"><myfont>������</myfont></td>
				     <td width="290" align="center" bgcolor="#D9FFFF">
				     	<input type="password" name="password">
				     </td>
			       </tr>
			       <tr>
				     <td width="200" height="40"  align="center" bgcolor="#0000FF"><myfont>ȷ������</myfont></td>
				     <td width="290" align="center" bgcolor="#D9FFFF">
				     	<input type="password" name="ConfirmPassword" onblur="confirm()">
				     </td>
			       </tr>
			   </table>
			   <br>
			   <input type="submit" value="�ύ">
		       <input type="reset" value="����">
	    </form> 
	</body>
</html>