<%@ page language="java" contentType="text/html; charset=gb2312"%>
<%@ page import="com.mysql.jdbc.Driver"%>
<%@ page import="java.sql.*"%>
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
		 <form enctype="multipart/form-data" method="post" action="../servletUpload?uploader=photo">
			 <table  border="0">
			 		<tr>
				     <td colspan="2" width="200" height="40"  align="center" bgcolor="#0000FF"><myfont>�ϴ���Ƭ</myfont></td>
			       </tr>
			       <tr>
				     <td height="40"  width="600" align="center" bgcolor="#D9FFFF">
				     	ѡ����Ƭ(����jpg��ʽ���ϴ�ǰ�뽫�ļ�����Ϊ��ѧ�Ż򹤺�.jpg��)��
				     </td>
				     <td height="40"  width="100" align="center" bgcolor="#D9FFFF">
				     	<input type="file" name="ulfile"> 
				     </td>
			       </tr>
			       <tr>
				     <td height="40"  colspan="2" align="center" bgcolor="#D9FFFF">
						 <input type="submit" value="�ϴ�">
						 <input type="reset" value="���">
				     </td>
			       </tr>
			 </table>			 
		 </form>
	</body>
</html>